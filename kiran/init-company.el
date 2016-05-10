(add-to-list 'load-path "/Users/kiran/.emacs.d/elpa/company-20150727.1415")
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-require-match nil
      company-selection-wrap-around t
      company-tooltip-align-annotations t
      company-tooltip-limit 10)

;;(company-quickhelp-mode 1)

;; Decrease delay before autocompletion popup shows up
(setq company-idle-delay 0.2)

;; Remove blinking
(setq company-echo-delay 0)

;; weight by frequency
(setq company-transformers '(company-sort-by-occurrence))

(provide 'init-company)
;;; init-company.el ends here
