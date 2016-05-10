
;; yasnippet
;;(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20141005.124/")

(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
;; (require 'yasnippet)
;; (yas-global-mode 1)
(autoload 'yasnippet "yasnippet" "Snippets for every occasion" t)
(eval-after-load "yasnippet"
  (lambda ()
    (yas-global-mode 1)))

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
