
;; git-awesome-mode
(require 'magit)

(setq magit-status-buffer-switch-function 'switch-to-buffer)

(defun disable-magit-highlight-in-buffer ()
  (face-remap-add-relative 'magit-item-highlight '()))

(add-hook 'magit-status-mode-hook 'disable-magit-highlight-in-buffer)

(global-set-key (kbd "C-c C-g") 'magit-status)

(provide 'init-magit)
;;; init-magit ends here
