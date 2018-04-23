
;; Use spotlight instead of locate
(setq locate-command "mdfind")

;; avy
(use-package avy
  :ensure t
  :config (define-key global-map (kbd "C-.") 'avy-goto-word-or-subword-1))

;; Search string in org-mode files using OS X Spotlight
(defun locate-org-files (search-string)
  "Adjust `locate-with-filter' to only search `org-mode' files with SEARCH-STRING."
  (interactive "sSearch string: ")
  (locate-with-filter search-string ".org$"))

(global-set-key (kbd "C-x f") 'find-file-in-repository)
(global-set-key (kbd "C-c f o") 'locate-org-files)
(global-set-key (kbd "<f7>") 'swiper-helm)
(global-set-key (kbd "<f2>") 'helm-ag)
(global-set-key (kbd "<f6>") 'helm-projectile-ag)

(defalias 'find-grep 'ag)

(provide 'init-search)
;;; init-search.el ends here
