
;; highlight matching parentheses
(require 'paren)
;; (add-hook 'prog-mode-hook #'show-paren-mode)
(show-paren-mode 1)
(setq show-paren-delay 0)
(set-face-background 'show-paren-match (face-background 'default))
(if (eq (frame-parameter nil 'background-mode) 'dark)
    (set-face-foreground 'show-paren-match "red")
  (set-face-foreground 'show-paren-match "black"))
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)

;; Smart parenthesis
(require 'smartparens-config)
(smartparens-global-mode)
;; (foo bar) -> foo bar
(define-key smartparens-mode-map (kbd "M-s") 'sp-splice-sexp)
;; (foo bar) -> [foo bar]
(define-key smartparens-mode-map (kbd "M-S") 'sp-rewrap-sexp)

;; Checkout http://danmidwood.com/content/2014/11/21/animated-paredit.html
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
