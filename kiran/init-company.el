

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-require-match nil
      company-selection-wrap-around t
      company-tooltip-align-annotations t)

(company-quickhelp-mode 1)

;; Decrease delay before autocompletion popup shows up
(setq company-idle-delay .3)

;; Remove blinking
;;(setq company-echo-delay 0)

(provide 'init-company)
