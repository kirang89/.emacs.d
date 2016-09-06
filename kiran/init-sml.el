;; Add path to sml binary

;; (setenv "PATH" (concat (getenv "PATH") "/usr/local/smlnj/bin:"))
;; (setq exec-path (append exec-path '("/usr/local/smlnj/bin")))
;; (setq exec-path (cons "/usr/local/smlnj/bin"  exec-path))

(add-hook 'sml-mode-hook (lambda ()
                           (require 'company-sml)
                           (add-hook 'company-sml 'company-sml-setup)
                           (add-hook 'company-sml 'company-sml-keywords-setup)))

(provide 'init-sml)
;;; init-sml ends here
