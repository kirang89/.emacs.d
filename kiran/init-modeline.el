;; Modeline Configuration
;; Author: Kiran Gangadharan


;; Set font face for mode line
;;(set-face-attribute 'mode-line nil :font "Source Code Pro-13")

;; powerline
(require 'powerline)
(powerline-default-theme)
;; (powerline-revert)

(require 'diminish)

;;(eval-after-load "helm" '(diminish 'helm-mode))
;;(eval-after-load "fundamental" '(diminish 'fundamental-mode))
(eval-after-load "abbrev" '(diminish 'abbrev-mode))
