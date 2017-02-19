
;; Use spotlight instead of locate
(setq locate-command "mdfind")

(defalias 'find-grep 'ag)

;; (use-package swiper-helm
;;   :config
;;   (global-unset-key (kbd "C-s"))
;;   (global-unset-key (kbd "C-r"))
;;   (global-set-key (kbd "C-s") 'swiper-helm)
;;   (global-set-key (kbd "C-r") 'swiper-helm))

(provide 'init-search)
;;; init-search.el ends here
