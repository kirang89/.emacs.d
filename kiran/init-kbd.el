
;; workaround for alt not working as meta key
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)

;; Only ask for confirmation if buffer has been modified
(global-set-key [(control x) (k)] 'kill-this-buffer)

; keybindings for increasing/decreasing window height
(global-set-key (kbd "C--") 'shrink-window)
(global-set-key (kbd "C-=") 'enlarge-window)
(global-set-key (kbd "C-9") 'shrink-window-horizontally)
(global-set-key (kbd "C-0") 'enlarge-window-horizontally)
;;(global-set-key (kbd "<f5>") 'fullscreen-mode-fullscreen-toggle)

;; Clean view of major mode keybindings
(global-set-key (kbd "C-h C-m") 'discover-my-major)

(global-set-key (kbd "M-l") 'goto-line)

(provide 'init-kbd)
;;; init-kbd.el ends here
