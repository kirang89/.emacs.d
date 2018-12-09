(use-package yasnippet
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  :config
  (yas-global-mode))


;; (add-to-list 'warning-suppress-types '(yasnippet backquote-change))

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
