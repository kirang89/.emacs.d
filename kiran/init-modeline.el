;; Modeline Configuration
;; Author: Kiran Gangadharan


;; Set font face for mode line
;;(set-face-attribute 'mode-line nil :font "Source Code Pro-13")

;; powerline
(require 'powerline)
(powerline-default-theme)
;; (powerline-revert)

;; Remove modeline border
(set-face-attribute 'mode-line nil
                    :box nil)


(require 'diminish)
;; (eval-after-load "helm" '(diminish 'helm-mode))
;; (eval-after-load "fundamental" '(diminish 'fundamental-mode))
(eval-after-load "abbrev" '(diminish 'abbrev-mode))
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "company" '(diminish 'company-mode))
;; (eval-after-load "projectile" '(diminish 'projectile-mode))

(defadvice emacs-lisp-mode (after elisp-rename-modeline activate)
  (setq mode-name "ELisp"))

(provide 'init-modeline)
