(use-package flycheck
  :diminish flycheck-mode
  :config
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(provide 'init-flycheck)
;; init-flycheck.el ends here
