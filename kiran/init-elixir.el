(require 'elixir-format)

(setq elixir-format-mix-path "/usr/local/bin/mix")

(add-hook 'elixir-mode-hook
          (lambda ()
            (local-set-key (kbd "C-M-;") #'elixir-format)
            (add-hook 'before-save-hook #'elixir-format-before-save)))

(provide 'init-elixir)
;; init-clojure.el ends here.
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
