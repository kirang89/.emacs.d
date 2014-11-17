
;; inhibit welcome screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Set frame font
;; (set-frame-font "Source Code Pro 10")

(setq initial-frame-alist '(
   (font . "Source Code Pro-13:weight=regular")
))

(setq default-frame-alist '(
   (font . "Source Code Pro-13:weight=regular")
))

; don't show the menu bar
(menu-bar-mode nil)

; don't show the tool bar
(require 'tool-bar)
(tool-bar-mode nil)

; don't show the scroll bar
(scroll-bar-mode -1)

;; syntax highlighting by default
(global-font-lock-mode 1)

; set cursor color
(set-cursor-color "#636363")

;;(setq mac-allow-anti-aliasing nil)

;; default frame size
(add-to-list 'default-frame-alist '(left . 80))
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 90))

; display line numbers to the right of the window
(global-linum-mode t)
(setq linum-format " %d")

;; powerline
;;(require 'powerline)
;;(powerline-default-theme)
;;(powerline-center-theme)

(provide 'init-looks)
;;; init-looks.el ends here
