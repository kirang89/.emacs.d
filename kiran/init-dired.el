;; (use-package dired
;;   :ensure t
;;   :config
;;   (setq dired-recursive-deletes 'always
;;         dired-recursive-copies 'always
;;         delete-by-moving-to-trash t
;;         dired-omit-mode t
;;         dired-omit-files "^\\.?#"))

;; ;;; Make files and folders in dired-mode neater
;; (use-package dired-details
;;   :ensure t
;;   :config
;;   (dired-details-install))

;; (use-package direx
;;   :ensure t
;;   :config
;;   (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory))

(provide 'init-dired)
;;; init-dired.el ends here
