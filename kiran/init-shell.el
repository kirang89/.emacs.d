
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

(provide 'init-shell)
;;; init-shell.el ends here
