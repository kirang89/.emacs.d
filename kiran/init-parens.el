
;; highlight parentheses when the cursor is next to them
(require 'paren)
;; Highlight matching parens
(add-hook 'prog-mode-hook #'show-paren-mode)

;; Smart parenthesis
(require 'smartparens-config)
(smartparens-global-mode)
;; (foo bar) -> foo bar
(define-key smartparens-mode-map (kbd "M-s") 'sp-splice-sexp)
;; (foo bar) -> [foo bar]
(define-key smartparens-mode-map (kbd "M-S") 'sp-rewrap-sexp)

(use-package paredit
  :diminish " π"
  :init
  (add-hook 'clojure-mode-hook 'enable-paredit-mode)
  (add-hook 'cider-repl-mode-hook 'enable-paredit-mode)
  (add-hook 'lisp-mode-hook 'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
  (add-hook 'ielm-mode-hook 'enable-paredit-mode)
  (add-hook 'json-mode-hook 'enable-paredit-mode))

;; (add-hook 'paredit-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-c C-s") 'paredit-wrap-round)
;;             (local-set-key (kbd "M-n") 'paredit-splice-sexp-killing-forward)
;;             (local-set-key (kbd "M-p") 'paredit-splice-sexp-killing-backward)))

(provide 'init-parens)
;;; init-parens ends here
