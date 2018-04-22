(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 10)
  (setq ivy-count-format "")
  (setq ivy-count-format "(%d/%d) ")

  (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  ;; Let ivy use flx for fuzzy-matching
  (use-package flx
    :ensure t
    :init
    (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy))))

  ;; Use [Enter] to navigate into the directory, not dired-open it.
  (define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done)

  ;; Let projectile use ivy
  (setq projectile-completion-system 'ivy))

(use-package counsel
  :ensure t
  :config
  (global-set-key (kbd "C-c g") 'counsel-ag)
  ;;(global-set-key (kbd "M-g") 'counsel-git-grep)
  (global-set-key (kbd "M-g") 'counsel-rg)
  (global-set-key (kbd "M-y") 'counsel-yank-pop)
  (setq recentf-max-saved-items 50)
  (setq recentf-auto-cleanup (* 24 60 60))
  (global-set-key (kbd "C-x C-r") 'counsel-recentf))

;; (use-package swiper
;;   :ensure t
;;   :config
;;   (global-set-key (kbd "C-s") 'swiper))

(provide 'init-ivy)
;; init-ivy.el ends here
