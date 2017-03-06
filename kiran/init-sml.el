;; Add path to sml binary
;; (setenv "PATH" (concat
;;                 "/usr/local/smlnj/bin:" (getenv "PATH")))
;; (setq exec-path (cons "/usr/local/smlnj/bin"  exec-path))


(add-hook 'sml-mode-hook (lambda ()
                           (require 'company-sml)
                           (add-hook 'company-sml 'company-sml-setup)
                           (add-hook 'company-sml 'company-sml-keywords-setup)))

(provide 'init-sml)
;;; init-sml ends here
