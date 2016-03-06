
;; set zsh as shell in emacs
(setenv "ESHELL" "/bin/zsh")
(setenv "SHELL" "/bin/zsh")

;; bash completion for emacs shell
(autoload 'bash-completion-dynamic-complete
  "bash-completion"
  "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions
  'bash-completion-dynamic-complete)
(add-hook 'shell-command-complete-functions
  'bash-completion-dynamic-complete)

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

(provide 'init-shell)
;;; init-shell.el ends here
