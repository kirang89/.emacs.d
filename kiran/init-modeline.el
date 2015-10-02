;; Modeline Configuration
;; Author: Kiran Gangadharan


;; Set font face for mode line
;;(set-face-attribute 'mode-line nil :font "Source Code Pro-13")

;; powerline
(require 'powerline)
(powerline-default-theme)
;; (powerline-revert)

(line-number-mode t)
(column-number-mode -1)

;; Remove modeline border
(set-face-attribute 'mode-line nil
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :box nil)
(set-face-attribute 'mode-line-highlight nil
                    :box nil)

(require 'diminish)
(eval-after-load "helm" '(diminish 'helm-mode))
(eval-after-load "abbrev" '(diminish 'abbrev-mode))
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "company" '(diminish 'company-mode))
;; (eval-after-load "projectile" '(diminish 'projectile-mode))
(eval-after-load "flyspell" '(diminish 'flyspell-mode))
(eval-after-load "sphinx-doc" '(diminish 'sphinx-doc-mode))
(eval-after-load "elpy" '(diminish 'elpy-mode))
;;(eval-after-load "org-indent" '(diminish 'org-indent-mode)
;;(eval-after-load "paredit" '(diminish 'paredit-mode))
(eval-after-load "smartparens" '(diminish 'smartparens-mode))
(eval-after-load "flycheck" '(diminish 'flycheck-mode "FC"))


(defadvice emacs-lisp-mode (after elisp-rename-modeline activate)
  (setq mode-name "ELisp"))

(provide 'init-modeline)
