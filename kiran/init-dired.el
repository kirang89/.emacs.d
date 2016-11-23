(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(setq delete-by-moving-to-trash t)

(setq dired-omit-mode t
      ;; autosave files
      dired-omit-files "^\\.?#")

;;; Make files and folders in dired-mode neater
(require 'dired-details)
(dired-details-install)

(provide 'init-dired)
;;; init-dired.el ends here
