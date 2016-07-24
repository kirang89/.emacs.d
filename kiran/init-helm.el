;; Helm configuration

;;(run-with-idle-timer 1 nil (lambda () (helm-mode 1)))

(use-package helm
  :config
  (require 'helm-config)
  (require 'helm)

  ;; Activate Helm.
  (helm-mode 1)
  (helm-autoresize-mode -1)

  ;; (with-eval-after-load "projectile"
  ;;   (use-package helm-projectile
  ;;     ;; A binding for using Helm to pick files using Projectile,
  ;;     ;; and override the normal grep with a Projectile based grep.
  ;;     :bind (("C-c C-f" . helm-projectile-find-file-dwim)
  ;;            ("C-x C-g" . helm-projectile-grep))
  ;;     :config (helm-projectile-on)))

  ;; Make Helm look nice.
  (setq-default helm-M-x-fuzzy-match t
		helm-buffers-fuzzy-matching t
		helm-recentf-fuzzy-match t
		helm-apropos-fuzzy-match t
		;; open Helm window in the current window where point is in
		helm-split-window-in-side-p t
        helm-ff-ido-style-backspace 'always)

  ;;(set-face-attribute 'helm-source-header nil :height 0.75)

  ;; Replace common selectors with Helm versions.
  ;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  ;; (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (global-set-key (kbd "C-x b") #'helm-mini)
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "M-y") #'helm-show-kill-ring)
  (global-set-key (kbd "C-x C-r") #'helm-recentf)
  (global-set-key (kbd "C-x C-o") #'helm-occur)
  (global-set-key (kbd "C-c C-s") #'helm-do-grep-ag)

  (with-eval-after-load 'helm-files
    (define-key helm-read-file-map (kbd "<backspace>") 'helm-find-files-up-one-level)
    (define-key helm-find-files-map (kbd "<backspace>") 'helm-find-files-up-one-level)))

;; (use-package helm-ls-git
;;   :ensure t
;;   :bind ("C-x C-d" . helm-browse-project))

(provide 'init-helm)
;;; init-helm.el ends here
