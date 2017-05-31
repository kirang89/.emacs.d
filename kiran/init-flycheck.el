(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (setq-default flycheck-check-syntax-automatically '(save mode-enabled)
                flycheck-disabled-checkers '(emacs-lisp-checkdoc)
                flycheck-display-errors-delay .3)
  (add-hook 'after-init-hook 'global-flycheck-mode))

(provide 'init-flycheck)
;; init-flycheck.el ends here
