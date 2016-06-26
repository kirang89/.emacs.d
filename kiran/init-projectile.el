
(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (add-hook 'prog-mode-hook 'projectile-mode)
  ;; asks for file to open when project is switched
  (setq projectile-switch-project-action 'helm-projectile-find-file)

  (use-package helm-projectile
    :ensure t
    :init
    (setq projectile-completion-system 'helm)))


(defun kg/smart-find-file ()
  "Find files using projectile if within a project, or fall-back to ido."
  (interactive)
  (if (projectile-project-p)
      (projectile-find-file)
    (ido-find-file)))

(bind-key "C-x C-f" 'kg/smart-find-file)


(provide 'init-projectile)
;;; init-projectile.el ends here
