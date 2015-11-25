;; Helm configuration

(require 'helm-config)
(helm-mode 1)
(setq helm-buffers-fuzzy-matching t)

(helm-autoresize-mode -1)

;; open Helm window in the current window where point is in
(setq helm-split-window-in-side-p t)

;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(global-set-key (kbd "C-x b") #'helm-mini)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "M-y") #'helm-show-kill-ring)
(global-set-key (kbd "C-x C-r") #'helm-recentf)
;; (global-set-key (kbd "C-x C-b") #'helm-buffers-list)
;; (global-set-key (kbd "C-x C-f") #'helm-find-files)

(provide 'init-helm)
;;; init-helm.el ends here
