;;;
;;; Configuration for editing html, js and css
;;;

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)

(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-expanding t)
(setq web-mode-enable-css-colorization t)

(use-package web-mode
  :ensure t
  :mode ("\\.html$" . web-mode))

(use-package web-beautify
  :ensure t
  :commands (web-beautify-css
             web-beautify-css-buffer
             web-beautify-html
             web-beautify-html-buffer
             web-beautify-js
             web-beautify-js-buffer))

;; (use-package js3-mode
;;   :ensure t
;;   :mode ("\\.js$" . js3-mode))

(use-package impatient-mode
  :ensure t
  :diminish (impatient-mode . "ι")
  :commands (impatient-mode))

(use-package emmet-mode
  :ensure t
  :diminish (emmet-mode . "ε")
  :bind* (("C-)" . emmet-next-edit-point)
          ("C-(" . emmet-prev-edit-point))
  :commands (emmet-mode
             emmet-next-edit-point
             emmet-prev-edit-point)
  :config
  ;; Auto-start on any markup modes
  (add-hook 'sgml-mode-hook 'emmet-mode))

(add-hook 'web-mode-hook 'emmet-mode)

(use-package nginx-mode
  :commands (nginx-mode))

(use-package json-mode
  :mode "\\.json\\'"
  :config
  ;; (add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
  (bind-key "{" #'paredit-open-curly json-mode-map)
  (bind-key "}" #'paredit-close-curly json-mode-map))

;; (use-package css-eldoc
;;   :config
;;   (progn
;;     (add-hook 'css-mode-hook 'turn-on-css-eldoc)
;;     (add-hook 'scss-mode-hook 'turn-on-css-eldoc)
;;     (add-hook 'less-css-mode-hook 'turn-on-css-eldoc)))

(provide 'init-web)
;;; init-web.el ends here
