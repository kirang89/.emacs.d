
(add-hook 'c-mode-hook 'irony-mode)
;; (add-to-list 'company-backends 'company-c-headers)
;; (add-to-list 'company-backends 'company-irony)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(setq-default c-basic-offset 4)

;; (add-hook 'c-mode-hook (local-set-key (kbd "C-c C-c") #'compile-command))

(provide 'init-c)
;;; init-c ends here
