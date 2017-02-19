(use-package neotree
  :defer t
  :init
  (setq neo-smart-open t)
  (setq-default neo-dont-be-alone t)
  (setq neo-hidden-files-regexp
        "^\\.\\|~$\\|^#.*#$\\|^target$\\|^pom\\.*\\|^__pycache__$\\|^env$")
  :config
  ;; (local-set-key (kbd "M-<up>") 'neotree-select-up-node)
  ;; (local-set-key (kbd "M-<down>") 'neotree-select-down-node)
  (global-set-key [f9] 'neotree-toggle))

(provide 'init-neotree)
;; init-neotree.el ends here
