
;; markdown-mode
(autoload 'markdown-mode "markdown-mode" "Major mode for markdown editing" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(provide 'init-markdown)
;;; init-markdown.el ends here
