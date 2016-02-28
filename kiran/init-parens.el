
;; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode t)

;; Smart parenthesis
(require 'smartparens-config)
(smartparens-global-mode)

;; (foo bar) -> foo bar
(define-key smartparens-mode-map (kbd "M-s") 'sp-splice-sexp)

;; (foo bar) -> [foo bar]
(define-key smartparens-mode-map (kbd "M-S") 'sp-rewrap-sexp)

;; (add-hook 'paredit-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-c C-s") 'paredit-wrap-round)
;;             (local-set-key (kbd "M-n") 'paredit-splice-sexp-killing-forward)
;;             (local-set-key (kbd "M-p") 'paredit-splice-sexp-killing-backward)))

(provide 'init-parens)
;;; init-parens ends here
