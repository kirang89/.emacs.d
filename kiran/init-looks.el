
;; inhibit welcome screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Set a better frame title
(setq frame-title-format '("%b (%m)"))

;; Remove menu bar when running Emacs from terminal
(when (not window-system)
  (menu-bar-mode -1))

(setq-default cursor-type 'bar)

;; Load theme
;;(load-theme 'zenburn t)

;; Good font sizes
;; ===============
;; (set-frame-font "Code New Roman 16")
;; (set-frame-font "Inconsolata Bold 15")
;; (set-frame-font "Source Code Pro 16")
(set-frame-font "Menlo 13")
;; (set-frame-font "PragmataPro 17")
;; (set-frame-font "Roboto Mono Light 13")
;; (set-frame-font "DejaVu Sans Mono 13")
;; (set-frame-font "CamingoCode 14")
;; (set-frame-font "Droid Sans Mono 13")
;; (set-frame-font "Ubuntu Mono 15")
;; (set-frame-font "Office Code Pro 13")
;; (set-frame-font "Hasklig 13")


;; Set default line spacing (relative)
(setq-default line-spacing 0.5)

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
(fringe-mode 1)

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
(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))

(require 'linum)
(eval-after-load "linum"
  (set-face-attribute 'linum nil :font "Menlo 11"))

;; highlight current line number as well
(require 'hlinum)
(hlinum-activate)
(eval-after-load "hlinum"
  (set-face-attribute 'linum-highlight-face nil :font "Menlo 11"))

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
(add-to-list 'load-path
             "/Users/kiran/.emacs.d/elpa/window-numbering-20150228.1247")
(require 'window-numbering)
(window-numbering-mode t)

(global-prettify-symbols-mode 1)

;; Make Emacs handle sRGB colors correctly
;; for solarized theme
;; (setq solarized-broken-srgb nil)

(provide 'init-looks)
;;; init-looks.el ends here
