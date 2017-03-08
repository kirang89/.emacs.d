;; Completion ignores filenames ending in any string in this list.
(setq completion-ignored-extensions
      '(".o" ".elc" "~" ".bin" ".class" ".exe" ".ps" ".abs" ".mx"
        ".~jv" ".rbc" ".pyc" ".beam" ".aux" ".out" ".pdf" ".hbc"))


(use-package company
  :diminish ""
  :init
  ;; (add-hook 'prog-mode-hook 'company-mode)
  ;; (add-hook 'comint-mode-hook 'company-mode)
  :config
  (global-company-mode)
  ;; Quick-help (popup documentation for suggestions).
  ;; (use-package company-quickhelp
  ;;   :if window-system
  ;;   :init (company-quickhelp-mode 1))
  ;; Company settings.
  (setq company-tooltip-limit 20)
  (setq company-idle-delay 0.1)
  (setq company-echo-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-require-match nil)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-align-annotations t)
  ;; weight by frequency
  (setq company-transformers '(company-sort-by-occurrence))
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
  (define-key company-active-map (kbd "<backtab>") 'company-select-previous)

  ;; =======================
  ;; Adding company backends
  ;; =======================

  ;; Python auto completion
  (use-package company-jedi
    :init
    (setq company-jedi-python-bin "python3")
    :config
    (add-to-list 'company-backends 'company-jedi))

  ;; HTML completion
  (use-package company-web
    :bind (("C-c w" . company-web-html))
    :config
    (add-to-list 'company-backends 'company-web-html))

  ;; Python auto completion
  ;; (use-package company-anaconda
  ;;   :ensure t
  ;;   :config
  ;;   (add-to-list 'company-backends
  ;;                '(company-anaconda :with company-capf)))

  ;; C code completion
  ;; (use-package company-irony
  ;;   :ensure t
  ;;   :config
  ;;   (add-to-list 'company-backends 'company-irony))

  (use-package company-statistics
    :config
    (add-hook 'after-init-hook 'company-statistics-mode))

  ;; (use-package company-ansible
  ;;   :defer t
  ;;   :config
  ;;   (add-to-list 'company-backends 'company-ansible))
  )

;;(company-quickhelp-mode 1)


(provide 'init-company)
;;; init-company.el ends here
