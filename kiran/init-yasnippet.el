(use-package yasnippet
  :defer t
  :config
  (add-hook 'clojure-mode-hook 'yas-minor-mode)
  ;;(add-hook 'js-mode-hook 'yas-minor-mode)
  (add-hook 'python-mode-hook 'yas-minor-mode)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets")))

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
