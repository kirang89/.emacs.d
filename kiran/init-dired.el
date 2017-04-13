(use-package dired
  :config
  (setq dired-recursive-deletes 'always
        dired-recursive-copies 'always
        delete-by-moving-to-trash t
        dired-omit-mode t
        dired-omit-files "^\\.?#"))

;;; Make files and folders in dired-mode neater
(use-package dired-details
  :config
  (dired-details-install))

(provide 'init-dired)
;;; init-dired.el ends here
