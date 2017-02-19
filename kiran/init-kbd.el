
; workaround for alt not working as meta key
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)

;; Remap C-w to backward kill word instead of kill region
;;(global-set-key "\C-w" 'kill-region)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
;;(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key (kbd "C-c l") 'kill-whole-line)

(require 'efuns)
(global-set-key (kbd "C-c C-k") 'kg/quick-copy-line)

;; Only ask for confirmation if buffer has been modified
(global-set-key [(control x) (k)] 'kill-this-buffer)

; keybindings for increasing/decreasing window height
(global-set-key (kbd "C--") 'shrink-window)
(global-set-key (kbd "C-=") 'enlarge-window)
(global-set-key (kbd "C-9") 'shrink-window-horizontally)
(global-set-key (kbd "C-0") 'enlarge-window-horizontally)
(global-set-key (kbd "<f5>") 'fullscreen-mode-fullscreen-toggle)

;; keybindings for dictionary
(add-hook 'text-mode-hook
          (lambda () (local-set-key (kbd "C-c d") 'dictionary-lookup-definition)))
(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "C-c d") 'dictionary-lookup-definition)))

(global-set-key (kbd "C-x f") 'find-file-in-repository)

(global-set-key (kbd "C-c }") 'mc/mark-next-like-this)

;; Join current line to previous and fix whitespace at join
(global-set-key (kbd "M-j")
                (lambda () (interactive) (join-line -1)))

(global-set-key (kbd "<f2>") 'helm-ag)

(global-set-key (kbd "<f6>") 'helm-projectile-ag)

;; Toggle frame split (see efuns.el)
(global-set-key (kbd "C-x |") 'toggle-frame-split)

;; Clean view of major mode keybindings
(global-set-key (kbd "C-h C-m") 'discover-my-major)


(provide 'init-kbd)
;;; init-kbd.el ends here
