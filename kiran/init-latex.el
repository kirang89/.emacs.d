(setenv "PATH" (concat "/Library/TeX/texbin" (getenv "PATH")))

(setq exec-path (cons "/Library/TeX/texbin"  exec-path))

;; (setq org-latex-create-formula-image-program 'convert)

(provide 'init-latex)
;;; init-latex.el ends here
