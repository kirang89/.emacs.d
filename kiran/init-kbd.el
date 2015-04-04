
; workaround for alt not working as meta key
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)

;; Remap C-w to backward kill word instead of kill region
;;(global-set-key "\C-w" 'kill-region)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
;;(global-set-key "\C-c\C-k" 'kill-region)

;; Only ask for confirmation if buffer has been modified
(global-set-key [(control x) (k)] 'kill-this-buffer)

;; navigation
;;(global-set-key (kbd "C-c ;") 'next-buffer)
;(global-set-key (kbd "C-c :") 'previous-buffer)

;;(global-set-key (kbd "C-c l") 'kill-whole-line)

;; highlight current line
(global-hl-line-mode 1)
;(set-face-background 'hl-line "#9998aa")
;; (require 'highlight-current-line)
;; (highlight-current-line-on t)
;; (set-face-background 'highlight-current-line-face "#3D3D3D")

; keybindings for increasing/decreasing window height
(global-set-key (kbd "C--") 'shrink-window)
(global-set-key (kbd "C-=") 'enlarge-window)
(global-set-key (kbd "C-9") 'shrink-window-horizontally)
(global-set-key (kbd "C-0") 'enlarge-window-horizontally)

;; keybindings for dictionary
(global-set-key "\C-cs" 'dictionary-search)

(global-set-key (kbd "C-x f") 'find-file-in-repository)

(global-set-key (kbd "C-c C-a") 'org-agenda)

(global-set-key (kbd "C-c C-g") 'magit-status)

(provide 'init-kbd)
;;; init-kbd.el ends here
