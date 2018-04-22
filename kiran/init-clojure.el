;; A little more syntax highlighting
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
                (1 font-lock-keyword-face))))))

(eval-after-load 'clojure-mode
  '(progn
     (define-key clojure-mode-map (kbd "C-c C-h") #'clojure-cheatsheet)))

(define-clojure-indent
  (defroutes 'defun)
  (fact 1)
  (facts 1)
  (s/fdef 1)
  (spec/fdef 1)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))

(require 'paredit)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'subword-mode)
(add-hook 'clojure-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c d c") 'clojure-cheatsheet)
            (local-set-key (kbd "<C-right>") #'paredit-forward-slurp-sexp)
            (local-set-key (kbd "<C-left>") #'paredit-forward-barf-sexp)))

;; Clojurescript hooks
(add-hook 'clojurescript-mode-hook #'paredit-mode)
(add-hook 'clojurescript-mode-hook #'subword-mode)
(add-hook 'clojurescript-mode-hook
          (lambda ()
            (local-set-key (kbd "<C-right>") #'paredit-forward-slurp-sexp)
            (local-set-key (kbd "<C-left>") #'paredit-forward-barf-sexp)))

;;;;
;; Cider
;;;;

(use-package cider
  :ensure t
  :init

  (setq cider-repl-pop-to-buffer-on-connect t
        cider-mode-line nil
        cider-prompt-for-symbol nil
        cider-show-error-buffer t
        cider-auto-select-error-buffer t
        cider-repl-history-file "~/.emacs.d/cider-history"
        cider-repl-wrap-history t
        cider-repl-history-size 100
        cider-repl-use-clojure-font-lock t
        cider-docview-fill-column 70
        cider-stacktrace-fill-column 76
        nrepl-hide-special-buffers t
        nrepl-popup-stacktraces nil
        nrepl-log-messages nil
        nrepl-hide-special-buffers t
        cider-repl-use-pretty-printing t
        cider-repl-display-help-banner nil
        cider-repl-result-prefix ";; => "
        cider-show-error-buffer nil
        ;; highlight result of evaluating clojure code
        cider-overlays-use-font-lock t
        cider-cljs-lein-repl
        "(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel!)
           (figwheel-sidecar.repl-api/cljs-repl))"
        ;; experimental
        cider-font-lock-dynamically '(macro core function var))

  :config

  (add-hook 'clojure-mode-hook
            (lambda ()
              (local-set-key (kbd "<C-return>") 'cider-eval-last-sexp)
              (local-set-key (kbd "C-M-d") 'cider-debug-defun-at-point)))
  (add-hook 'cider-mode-hook #'eldoc-mode)
  (add-hook 'cider-mode-hook #'paredit-mode)
  (add-hook 'cider-mode-hook #'subword-mode)
  (add-hook 'cider-mode-hook #'company-mode)

  (add-hook 'cider-repl-mode-hook #'eldoc-mode)
  (remove-hook 'cider-repl-mode-hook #'aggressive-indent-mode)
  (add-hook 'cider-repl-mode-hook
            (lambda ()
              (local-set-key (kbd "C-l") 'cider-repl-clear-buffer))))

(use-package clj-refactor
  :ensure t
  :diminish ""
  :config
  (add-hook 'clojure-mode-hook
            (lambda ()
              (clj-refactor-mode 1)
              (cljr-add-keybindings-with-prefix "C-c .")))
  (add-hook 'clojurescript-mode-hook
            (lambda ()
              (clj-refactor-mode 1)
              (cljr-add-keybindings-with-prefix "C-c ."))))

(defun kg/set-pretty-symbols ()
  "Make some word or string show as pretty Unicode symbols."
  (setq prettify-symbols-alist
        '(
          ("fn"  . 955)     ; λ
          ("->"  . 8594)    ; →
          ("=>"  . 8658)    ; ⇒
          ("map" . 8614)    ; ↦
          )))

(defun kg/ns-reset ()
  "Refreshes the cider repl."
  (interactive)
  (save-some-buffers)
  (cider-interactive-eval "(user/reset)"))

(defun kg/cider-figwheel-repl ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(require 'figwheel-sidecar.repl-api)
             (figwheel-sidecar.repl-api/start-figwheel!) ; idempotent
             (figwheel-sidecar.repl-api/cljs-repl)")
    (cider-repl-return)))

(provide 'init-clojure)
;; init-clojure.el ends here.
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
