
;; set zsh as shell in emacs
(setenv "ESHELL" "/bin/zsh")
(setenv "SHELL" "/bin/zsh")

;; bash completion for emacs shell
(autoload 'bash-completion-dynamic-complete "bash-completion" "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions 'bash-completion-dynamic-complete)
(add-hook 'shell-command-complete-functions 'bash-completion-dynamic-complete)

(setenv "PAGER" "cat")

(add-hook 'eshell-mode-hook
          (lambda ()
            ;; The 'ls' executable requires the Gnu version on the Mac
            (let ((ls (if (file-exists-p "/usr/local/bin/gls")
                          "/usr/local/bin/gls"
                        "/bin/ls")))
              (eshell/alias "ll" (concat ls " -AlohG --color=always")))))

(global-set-key (kbd "C-c e") 'eshell)

(setq eshell-cmpl-cycle-completions nil
      eshell-history-size 1024
      eshell-save-history-on-exit t
      eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'"
      eshell-hist-ignoredups t
      eshell-scroll-to-bottom-on-output t
      eshell-scroll-show-maximum-output t)

;; (add-to-list 'eshell-output-filter-functions
;;              'eshell-postoutput-scroll-to-bottom)

;; git status
(defun eshell/gst (&rest args)
    (magit-status (pop args) nil)
    (eshell/echo))

;; git diff
(defalias 'gd 'magit-diff-unstaged)
(defalias 'gds 'magit-diff-staged)

(defun eshell/ef (filename &optional dir)
  "Searches for the first matching filename and loads it into a
file to edit."
  (let* ((files (eshell/f filename dir))
         (file (car (s-split "\n" files))))
    (find-file file)))

(defun eshell/clear ()
    "clear the eshell buffer."
    (interactive)
    (let ((inhibit-read-only t))
      (erase-buffer)))


;; ===================== CUSTOM PROMPT =================================
(defun curr-dir-git-branch-string (pwd)
  "Returns current git branch as a string, or the empty string if
PWD is not in a git repo (or the git command is not found)."
  (interactive)
  (when (and (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let ((git-output (shell-command-to-string (concat "cd " pwd " && git branch | grep '\\*' | sed -e 's/^\\* //'"))))
      (if (> (length git-output) 0)
          (concat " :" (substring git-output 0 -1))
        "(no branch)"))))

(defun pwd-replace-home (pwd)
  "Replace home in PWD with tilde (~) character."
  (interactive)
  (let* ((home (expand-file-name (getenv "HOME")))
         (home-len (length home)))
    (if (and
         (>= (length pwd) home-len)
         (equal home (substring pwd 0 home-len)))
        (concat "~" (substring pwd home-len))
      pwd)))

(defun pwd-shorten-dirs (pwd)
  "Shorten all directory names in PWD except the last two."
  (let ((p-lst (split-string pwd "/")))
    (if (> (length p-lst) 2)
        (concat
         (mapconcat (lambda (elm) (if (zerop (length elm)) ""
                               (substring elm 0 1)))
                    (butlast p-lst 2)
                    "/")
         "/"
         (mapconcat (lambda (elm) elm)
                    (last p-lst 2)
                    "/"))
      pwd  ;; Otherwise, we just return the PWD
      )))

(defun split-directory-prompt (directory)
  "Break up the directory into a 'parent' and a 'base'"
  (if (string-match-p ".*/.*" directory)
      (list (file-name-directory directory) (file-name-base directory))
    (list "" directory)))

;; Turn off the default prompt.
(setq eshell-highlight-prompt nil)

;; Create a custom prompt using the functions above
(setq eshell-prompt-function
      (lambda ()
        (let* ((directory (split-directory-prompt (pwd-shorten-dirs (pwd-replace-home (eshell/pwd)))))
               (parent (car directory))
               (name (cadr directory))
               (branch (or (curr-dir-git-branch-string (eshell/pwd)) "")))

          (if (eq 'dark (frame-parameter nil 'background-mode))
              (concat   ;; Prompt for Dark Themes
               (propertize parent 'face `(:foreground "#8888FF"))
               (propertize name   'face `(:foreground "#8888FF" :weight bold))
               (propertize branch 'face `(:foreground "green"))
               (propertize " λ"   'face `(:weight ultra-bold))
               (propertize " "    'face `(:weight bold)))

            (concat    ;; Prompt for Light Themes
             (propertize parent 'face `(:foreground "blue"))
             (propertize name   'face `(:foreground "blue" :weight bold))
             (propertize branch 'face `(:foreground "dark green"))
             (propertize " λ"   'face `(:weight ultra-bold))
             (propertize " "    'face `(:weight bold)))))))

;; ======================================================================

(provide 'init-shell)
;;; init-shell.el ends here
