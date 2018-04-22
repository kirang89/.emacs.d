(use-package alchemist
  :init
  (setq elixir-format-mix-path "/usr/local/bin/mix")
  (setq alchemist-iex-program-name "/usr/local/bin/iex")
  (setq alchemist-execute-command "/usr/local/bin/elixir")
  (setq alchemist-test-status-modeline nil)
  (setq alchemist-test-display-compilation-output t)
  ;; (setq alchemist-hooks-compile-on-save t)
  :config
   (add-hook 'elixir-mode-hook 'alchemist-mode))

;; (add-hook 'elixir-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-M-;") #'elixir-format)
;;             ;; (global-unset-key (kbd "M -"))
;;             (add-hook 'before-save-hook #'elixir-format-before-save)))

(provide 'init-elixir)
;; init-clojure.el ends here.
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
