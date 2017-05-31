;; Ido settings
;; Author: Kiran Gangadharan

;; Enable ido (Interactively Do Things) mode
(use-package ido
  :ensure t
  :init  (setq ido-enable-flex-matching t
               ido-ignore-extensions t
               ido-use-virtual-buffers t
               ido-everywhere t)
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (add-to-list 'completion-ignored-extensions ".pyc")
  (add-to-list 'ido-ignore-files ".DS_STORE"))

(use-package ido-vertical-mode
  :ensure t
  :config (ido-vertical-mode 1))

;; ido with fuzzy search
(use-package flx-ido
  :ensure t
  :init (setq ido-enable-flex-matching t
              ido-use-faces nil)
  :config (flx-ido-mode 1))

(provide 'init-ido)
