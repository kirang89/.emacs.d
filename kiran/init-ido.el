;; Ido settings
;; Author: Kiran Gangadharan

;; Enable ido (Interactively Do Things) mode
(require 'ido)
(ido-mode t)

;; ido vertical mode
(require 'ido-vertical-mode)
(ido-vertical-mode 1)

;; ido with fuzzy search
(require 'flx-ido)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(add-to-list 'ido-ignore-files "\\.pyc")
(add-to-list 'ido-ignore-files ".DS_STORE")
(setq ido-use-faces nil)
;(setq flx-ido-use-faces nil)

(provide 'init-ido)
