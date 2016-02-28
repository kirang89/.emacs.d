;;
;; Clojure configuration
;;

;; Enable paredit for Clojure
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
(add-hook 'clojure-mode-hook 'subword-mode)

;; (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; A little more syntax highlighting
(require 'clojure-mode-extra-font-locking)

;; syntax highlighting in repl
(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "lein repl")
            (font-lock-add-keywords
             nil
             '(("(\\(facts?\\)"
                (1 font-lock-keyword-face))
               ("(\\(background?\\)"
                (1 font-lock-keyword-face))))
            (define-clojure-indent (fact 1))
            (define-clojure-indent (facts 1))
            'linum-mode))


(add-hook 'clojure-mode-hook 'flycheck-mode)
(add-hook 'clojure-mode-hook 'linum-mode)
(add-hook 'clojure-mode-hook 'kg/set-pretty-symbols)
(add-hook 'clojure-mode-hook 'paren-face-mode)
(add-hook 'clojure-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-s") 'paredit-wrap-round)))

;;;;
;; Cider
;;;;

(setq cider-repl-pop-to-buffer-on-connect t
      cider-mode-line nil
      cider-show-error-buffer t
      cider-auto-select-error-buffer t
      cider-repl-history-file "~/.emacs.d/cider-history"
      cider-repl-wrap-history t
      cider-repl-use-clojure-font-lock t
      cider-docview-fill-column 70
      cider-stacktrace-fill-column 76
      cider-repl-use-pretty-printing t
      cider-repl-display-help-banner nil)

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
;; enable paredit in REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paren-face-mode)

(defun kg/clj-src-file-name-from-test (name)
  (s-with name
    (s-replace "/test/" "/src/")
    (s-replace "_test.clj" ".clj")))

(defun kg/clj-test-file-name-from-src (name)
  (s-with name
    (s-replace "/src/" "/test/")
    (s-replace ".clj" "_test.clj")))

(defun kg/set-pretty-symbols ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("fn"  . 955)     ; λ
          ("->"  . 8594)    ; →
          ("=>"  . 8658)    ; ⇒
          ("map" . 8614)    ; ↦
          )))

(provide 'init-clojure)
;;; init-clojure.el ends here
