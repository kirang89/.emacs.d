
;; inhibit welcome screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Set a better frame title
(setq frame-title-format '("%b (%m)"))

;; Remove scratch buffer message
(setq initial-scratch-message "")

;; Remove menu bar when running Emacs from terminal
(when (not window-system)
  (menu-bar-mode -1))

;;(setq-default cursor-type 'bar)

;; Good font sizes
;; ===============
;;(set-frame-font "Code New Roman-16:spacing=m")
;;(set-frame-font "Consolas-14:weight=bold:spacing=m")
;;(set-frame-font "Inconsolata-13:weight=regular:spacing=m")
;;(set-frame-font "Inconsolata-g-15:spacing=m")
;;(set-frame-font "Source Code Pro-13.0:weight=light:spacing=m")
;;(set-frame-font "Source Code Pro-13:weight=medium:height=150")
;; with ls 0.2
(set-frame-font "Hasklig-13:weight=medium:spacing=m") ;; with ls 0.2
;;(set-frame-font "Menlo-13:weight=regular:spacing=m")
;;(set-frame-font "Generic Mono II-14:weight=medium:spacing=m")
;;(set-frame-font "Roboto Mono 13")
;;(set-frame-font "Droid Sans Mono-13:weight=bold:spacing=m")
;;(set-frame-font "Liberation Mono-13:weight=bold:spacing=p")
;;(set-frame-font "Office Code Pro 13")
;;(set-default-font "-apple-Monaco-normal-normal-normal-*-13-*-*-*-*-0-iso10646-1")
;;(set-frame-font "-*-Hack-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")
;;(set-frame-font "DejaVu Sans Mono-13:weight=bold:spacing=p")
;;(set-frame-font "Fira Mono Medium for Powerline-15:spacing=m")
;;(set-frame-font "NanumGothicCoding-17:spacing=m")
;;(set-frame-font "AHAMONO-17:spacing=m")
;;(set-frame-font "Anonymous Pro-14:spacing=m")

;; Set default line spacing (relative)
(setq-default line-spacing 0.1)

; don't show the tool bar
(require 'tool-bar)
(tool-bar-mode nil)

; don't show the scroll bar
(scroll-bar-mode -1)

;; Scroll in one line increments
;; Gives a smoother mouse scroll
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

; Minimal fringe
(fringe-mode 4)

;; Experimental
(defun kg/set-fringe-background ()
  "Set the fringe background to the same color as the regular background."
  (interactive)
  (custom-set-faces
   `(fringe ((t (:background ,(face-background 'default)))))))

(add-hook 'after-init-hook #'kg/set-fringe-background)

;; remove highlight current line
(global-hl-line-mode -1)

; add any custom themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; Syntax Highlighting
(require 'font-lock)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode 1)

;; M-q should fill at 80 chars, not 70
(setq-default fill-column 80)

;; Show line numbers, dynamically with spaces on either side
;; (defadvice linum-update-window (around linum-dynamic activate)
;;   (let* ((w (length (number-to-string
;;                      (count-lines (point-min) (point-max)))))
;;          (linum-format (concat " %" (number-to-string w) "d ")))
;;     ad-do-it))

;; highlight current line number as well
;; (use-package hlinum
;;   :config
;;   (hlinum-activate)
;;   ;;(set-face-attribute 'linum-highlight-face nil :font "Fira Code 11")
;;   (set-face-attribute 'linum-highlight-face nil :font "Code New Roman 12"))

;;(setq linum-format " %4d ")
(setq linum-format "%5i ")

;; Dynamically adjust to width
;;(custom-set-variables '(linum-format 'dynamic))
;; (custom-set-variables '(nlinum-format 'dynamic))

(defun kg/reset-linum ()
  "Reset formatting of line numbers"
  (interactive)
  (let ((font "Source Code Pro-11.0:weight=regular:spacing=m"))
    (require 'linum)
    (set-face-attribute 'linum nil :font font)))

(add-hook 'after-init-hook #'kg/reset-linum)
(add-hook 'prog-mode-hook 'linum-mode)

;; set color for selection
;; (set-face-attribute 'region nil :background "#666")

;; set unique names for two similar buffers
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Clean up modeline a bit
(line-number-mode -1)
(size-indication-mode -1)
(column-number-mode -1)

;; Number each buffer for easy switching with M-<no>
;; (add-to-list 'load-path
;;              "/Users/kiran/.emacs.d/elpa/window-numbering-20150228.1247")

(use-package window-numbering
  :config (window-numbering-mode t))

(global-prettify-symbols-mode 1)

(provide 'init-looks)
;;; init-looks.el ends here
