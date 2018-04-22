(use-package projectile
  :ensure t
  :init
  (setq-default projectile-cache-file
                (expand-file-name ".projectile-cache" user-emacs-directory))
  (add-hook 'prog-mode-hook #'projectile-mode)
  :config
  (projectile-mode)
  ;; asks for file to open when project is switched
  (setq projectile-switch-project-action 'helm-projectile-find-file)
  (setq-default projectile-enable-caching t
                projectile-mode-line '(:eval (projectile-project-name))))


(defun kg/smart-find-file ()
  "Find files using projectile if within a project, or fall-back to ido."
  (interactive)
  (if (projectile-project-p)
      (projectile-find-file)
    (ido-find-file)))

(bind-key "M-t" 'kg/smart-find-file)

(provide 'init-projectile)
;;; init-projectile.el ends here
