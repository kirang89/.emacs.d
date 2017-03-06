(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 10)
  (setq ivy-count-format "")
  (setq ivy-count-format "(%d/%d) ")

  ;; Let ivy use flx for fuzzy-matching
  (require 'flx)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))

  ;; Use [Enter] to navigate into the directory, not dired-open it.
  (define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done)

  ;; Let projectile use ivy
  (setq projectile-completion-system 'ivy))


(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "C-x C-r") 'counsel-recentf)


(provide 'init-ivy)
;; init-ivy.el ends here
