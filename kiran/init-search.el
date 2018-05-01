
;; Use spotlight instead of locate
(setq locate-command "mdfind")

;; avy
(use-package avy
  :ensure t
  :config (define-key global-map (kbd "C-.") 'avy-goto-word-or-subword-1))

;; Search string in org-mode files using OS X Spotlight
(defun locate-org-files (search-string)
  "Adjust `locate-with-filter' to only search `org-mode' files with SEARCH-STRING."
  (interactive "Search string: ")
  (locate-with-filter search-string ".org$"))

(global-set-key (kbd "C-c f o") 'locate-org-files)

(defalias 'find-grep 'rg)

(use-package swiper
  :ensure t
  :config
  (global-set-key (kbd "<f6>") 'swiper))

(provide 'init-search)
;;; init-search.el ends here
