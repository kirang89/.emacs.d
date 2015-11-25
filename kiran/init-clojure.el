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

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; go right to the REPL buffer when it's finished connecting
(defvar cider-repl-pop-to-buffer-on-connect)
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(defvar cider-show-error-buffer)
(setq cider-show-error-buffer t)

(defvar cider-auto-select-error-buffer)
(setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
(defvar cider-repl-history-file)
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history
(defvar cider-repl-wrap-history)
(setq cider-repl-wrap-history t)

(defvar cider-repl-use-clojure-font-lock)
(setq cider-repl-use-clojure-font-lock t)

;; enable paredit in your REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(provide 'init-clojure)
;;; init-clojure.el ends here
