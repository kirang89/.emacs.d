(require 'eshell)
(set-terminal-coding-system 'utf-8)
;; set zsh as shell in emacs
;;(setenv "ESHELL" "/bin/zsh")
;;(setenv "SHELL" "/bin/zsh")
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
      eshell-scroll-to-bottom-on-output nil
      eshell-scroll-show-maximum-output t)

;; (add-to-list 'eshell-output-filter-functions
;;              'eshell-postoutput-scroll-to-bottom)

(add-hook 'eshell-mode-hook
          (lambda ()
            (local-set-key (kbd "<up>") 'eshell-previous-input)
            (local-set-key (kbd "<down>") 'eshell-next-input)))

(defun eshell-here ()
  "Opens up a new shell in the directory associated with the current buffer's file.  The eshell is renamed to match that directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(global-set-key (kbd "C-!") 'eshell-here)

;; ============================= CUSTOM PROMPT ======================================
(defun curr-dir-git-branch-string (pwd)
  "Return current git branch as a string, or the empty string if
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

;; Set this to match eshell-prompt-function
(setq eshell-prompt-regexp " λ ")

;; Make C-a go to beginning of command instead of line
(add-hook 'eshell-mode-hook '(lambda ()
                               (local-set-key (kbd "C-a")
                                              '(lambda ()
                                                 (interactive)
                                                 (beginning-of-line)
                                                 (search-forward-regexp eshell-prompt-regexp)))))


;; Make prompt read-only
(require 'em-term)
(add-to-list 'eshell-modules-list 'eshell-rebind)

;; Turn off the default prompt.
(setq eshell-highlight-prompt nil)
;; =================================================================================

;; =========================== ALIASES =============================================
(defalias 'e 'find-file)
(defalias 'ee 'find-file-other-window)

;; git status
(defun eshell/gst (&rest args)
  "Make git status use Magit."
    (magit-status (pop args) nil)
    (eshell/echo))

;; git diff
(defalias 'gd 'magit-diff-unstaged)
(defalias 'gds 'magit-diff-staged)

(defun eshell/ef (filename &optional dir)
  "Search for the first matching FILENAME (in a DIR) and load it into a file to edit."
  (let* ((files (eshell/f filename dir))
         (file (car (s-split "\n" files))))
    (find-file file)))

(defun eshell/clear ()
    "Clear the eshell buffer."
    (interactive)
    (let ((inhibit-read-only t))
      (erase-buffer)))
;; =================================================================================

(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))

(provide 'init-shell)
;;; init-shell.el ends here
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
