;; Helm configuration
;; Author: Kiran Gangadharan

(require 'helm-config)
(helm-mode 1)
(setq helm-buffers-fuzzy-matching t)

;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(global-set-key (kbd "C-x b") #'helm-mini)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "M-y") #'helm-show-kill-ring)
;; (global-set-key (kbd "C-x C-b") #'helm-buffers-list)
;; (global-set-key (kbd "C-x C-f") #'helm-find-files)
;; (global-set-key (kbd "C-x C-r") #'helm-recentf)

(provide 'init-helm)
