;;
;; Clojure configuration
;;

;; Enable paredit for Clojure
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
(add-hook 'clojure-mode-hook 'subword-mode)

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; A little more syntax highlighting
(require 'clojure-mode-extra-font-locking)

;; syntax highlighting in repl
(add-hook 'clojure-mode-hook
          (lambda ()
            (defvar inferior-lisp-program)
            (setq inferior-lisp-program "lein repl")
            (font-lock-add-keywords
             nil
             '(("(\\(facts?\\)"
                (1 font-lock-keyword-face))
               ("(\\(background?\\)"
                (1 font-lock-keyword-face))))
            (define-clojure-indent (fact 1))
            (define-clojure-indent (facts 1))))

(add-hook 'clojure-mode-hook
          (lambda () (local-set-key (kbd "C-c C-s") 'paredit-wrap-round)))

;;;;
;; Cider
;;;;

(setq cider-repl-pop-to-buffer-on-connect t
      cider-mode-line nil
      cider-show-error-buffer t
      cider-auto-select-error-buffer t
      cider-repl-history-file "~/.emacs.d/cider-history"
      cider-repl-wrap-history t
      cider-repl-use-clojure-font-lock t)

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
;; enable paredit in REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(provide 'init-clojure)
;;; init-clojure.el ends here
