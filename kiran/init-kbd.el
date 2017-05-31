
; workaround for alt not working as meta key
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)

(global-set-key (kbd "M-x") 'execute-extended-command)

;; Only ask for confirmation if buffer has been modified
(global-set-key [(control x) (k)] 'kill-this-buffer)

; keybindings for increasing/decreasing window height
(global-set-key (kbd "C--") 'shrink-window)
(global-set-key (kbd "C-=") 'enlarge-window)
(global-set-key (kbd "C-9") 'shrink-window-horizontally)
(global-set-key (kbd "C-0") 'enlarge-window-horizontally)
;;(global-set-key (kbd "<f5>") 'fullscreen-mode-fullscreen-toggle)

;; keybindings for dictionary
(add-hook 'text-mode-hook
          (lambda () (local-set-key (kbd "C-c d") 'dictionary-lookup-definition)))
(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "C-c d") 'dictionary-lookup-definition)))

;;(global-set-key (kbd "C-c }") 'mc/mark-next-like-this)

;; Toggle frame split (see efuns.el)
;;(global-set-key (kbd "C-x |") 'toggle-frame-split)

;; Clean view of major mode keybindings
(global-set-key (kbd "C-h C-m") 'discover-my-major)

(provide 'init-kbd)
;;; init-kbd.el ends here
