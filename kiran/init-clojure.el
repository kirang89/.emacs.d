;; A little more syntax highlighting
;;(require 'clojure-mode-extra-font-locking)

(use-package clojure-mode-extra-font-locking
  :ensure t)

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

            (define-clojure-indent
              (defroutes 'defun)
              (fact 1)
              (facts 1)
              (clojure.spec/fdef 1)
              (GET 2)
              (POST 2)
              (PUT 2)
              (DELETE 2)
              (HEAD 2)
              (ANY 2)
              (context 2))))

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'kg/set-pretty-symbols)
(add-hook 'clojure-mode-hook 'paren-face-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'subword-mode)
(add-hook 'clojure-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c r") 'cider-eval-region)
            (local-set-key (kbd "C-c C-s") 'paredit-wrap-round)
            (local-set-key (kbd "<C-return>") 'cider-eval-last-sexp)
            (local-set-key (kbd "C-c d c") 'clojure-cheatsheet)
            (local-set-key (kbd "C-'") 'cider-debug-defun-at-point)
            (local-set-key (kbd "C-M-d") 'cider-debug-defun-at-point)))


;;;;
;; Cider
;;;;

(use-package cider
  :ensure t
  :init

  (setq cider-repl-pop-to-buffer-on-connect t
        cider-mode-line nil
        cider-show-error-buffer t
        cider-auto-select-error-buffer t
        cider-repl-history-file "~/.emacs.d/cider-history"
        cider-repl-wrap-history t
        cider-repl-history-size 100
        cider-repl-use-clojure-font-lock t
        cider-docview-fill-column 70
        cider-stacktrace-fill-column 76
        nrepl-hide-special-buffers t
        ;; Stop error buffer from popping up while working in buffers other than REPL:
        nrepl-popup-stacktraces nil
        nrepl-log-messages nil
        nrepl-hide-special-buffers t
        cider-repl-use-pretty-printing t
        cider-repl-display-help-banner nil
        cider-repl-result-prefix ";; => "
        cider-show-error-buffer nil)

  :config

  (add-hook 'cider-mode-hook #'eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'paredit-mode)
  (add-hook 'cider-repl-mode-hook #'paren-face-mode)
  (add-hook 'cider-repl-mode-hook #'subword-mode)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode)
  ;; (add-hook 'cider-mode-hook
  ;;           (local-set-key (kbd "C-c d") 'cider-debug-defun-at-point))
  (add-hook 'cider-mode-hook
            (local-set-key (kbd "<C-return>") 'cider-eval-defun-at-point))

  (defun cider-send-and-evaluate-sexp ()
    "Send and eval expression in REPL.

Sends the s-expression located before the point or the active
region to the REPL and evaluates it.Then the Clojure buffer is
activated as if nothing happened."
    (interactive)
    (if (not (region-active-p))
        (cider-insert-last-sexp-in-repl)
      (cider-insert-in-repl
       (buffer-substring (region-beginning) (region-end)) nil))
    (cider-switch-to-repl-buffer)
    (cider-repl-closing-return)
    (cider-switch-to-last-clojure-buffer)
    (message ""))

  (bind-key "C-c C-v" 'cider-send-and-evaluate-sexp))


(use-package clj-refactor
  :ensure t
  :config
  (add-hook 'clojure-mode-hook
            (lambda ()
              (clj-refactor-mode 1)
              (cljr-add-keybindings-with-prefix "C-c ."))))


;; Look up packages in Clojars
(use-package clojars
  :ensure t)


(defun kg/clj-src-file-name-from-test (name)
  (s-with name
    (s-replace "/test/" "/src/")
    (s-replace "_test.clj" ".clj")))


(defun kg/clj-test-file-name-from-src (name)
  (interactive)
  (s-with name
    (s-replace "/src/" "/test/")
    (s-replace ".clj" "_test.clj")))


(defun kg/set-pretty-symbols ()
  "Make some word or string show as pretty Unicode symbols."
  (setq prettify-symbols-alist
        '(
          ("fn"  . 955)     ; λ
          ("->"  . 8594)    ; →
          ("=>"  . 8658)    ; ⇒
          ("map" . 8614)    ; ↦
          )))


(defun kg/helm-clojure-headlines ()
  "Display headlines for the current Clojure file."
  (interactive)
  (helm-mode t)
  (helm :sources '(((name . "Clojure Headlines")
                    (volatile)
                    (headline "^[;(]")))))


(defun kg/ns-reset ()
  "Refreshes the cider repl."
  (interactive)
  (save-some-buffers)
  (cider-interactive-eval "(user/reset)"))


;; TODO Setup flycheck using the below link
;; https://github.com/howardabrams/dot-files/blob/master/emacs-clojure.org#linting

(provide 'init-clojure)
;; init-clojure.el ends here.
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
