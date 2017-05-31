;;;
;;; Configuration for editing html, js and css
;;;

(use-package web-mode
  :mode ("\\.html$" . web-mode)
  :init
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)

  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-expanding t)
  (setq web-mode-enable-css-colorization t))


(use-package web-beautify
  :commands (web-beautify-css
             web-beautify-css-buffer
             web-beautify-html
             web-beautify-html-buffer
             web-beautify-js
             web-beautify-js-buffer))


(defun surround-html (start end tag)
   "Wraps the specified region (or the current 'symbol / word'
 with a properly formatted HTML tag."
   (interactive "r\nsTag: " start end tag)
   (save-excursion
     (narrow-to-region start end)
     (goto-char (point-min))
     (insert (format "<%s>" tag))
     (goto-char (point-max))
     (insert (format "</%s>" tag))
     (widen)))

(define-key html-mode-map (kbd "C-c C-w") 'surround-html)

;; (use-package js3-mode
;;   :ensure t
;;   :mode ("\\.js$" . js3-mode))

;; (use-package impatient-mode
;;   :diminish (impatient-mode . "ι")
;;   :commands (impatient-mode))

(use-package emmet-mode
  :diminish (emmet-mode . "ε")
  :bind* (("C-)" . emmet-next-edit-point)
          ("C-(" . emmet-prev-edit-point))
  :commands (emmet-mode
             emmet-next-edit-point
             emmet-prev-edit-point)
  :init
  (setq emmet-indentation 2)
  (setq emmet-move-cursor-between-quotes t)
  :config
  ;; Auto-start on any markup modes
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode))


(use-package nginx-mode
  :commands (nginx-mode))


(use-package json-mode
  :mode "\\.json\\'"
  :config
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
