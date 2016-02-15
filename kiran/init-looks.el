
;; inhibit welcome screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; empty scratch

(setq initial-scratch-message ";; The Hacker Ethic held that every program should be as good as you could make
;; it(or better), infinitely flexible, admired for it’s brilliance of concept
;; and execution and designed to extend it’s user’s powers")

;; Set a better frame title
(setq frame-title-format '("%b (%m)"))

;; Remove menu bar when running Emacs from terminal
(when (not window-system)
  (menu-bar-mode -1))

;; Load theme
;;(load-theme 'zenburn t)

;; Set frame font

;; Set default line spacing (relative)
(setq-default line-spacing 0.2)

;; Disable font antialiasing
;;(setq mac-allow-anti-aliasing nil)

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

;; default frame size
;; (add-to-list 'default-frame-alist '(left . 80))
;; (add-to-list 'default-frame-alist '(top . 0))
;; (add-to-list 'default-frame-alist '(height . 50))
;; (add-to-list 'default-frame-alist '(width . 90))

;; M-q should fill at 80 chars, not 70
(setq-default fill-column 80)

; display line numbers to the left of the window
;; (global-linum-mode -1)
;; (setq linum-format "%4d ")

;; Show line numbers, dynamically with spaces on either side
(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))

(require 'linum)
(eval-after-load "linum"
  (set-face-attribute 'linum nil :font "Code New Roman 11"))

;; highlight current line number as well
(require 'hlinum)
(hlinum-activate)
(eval-after-load "hlinum"
  (set-face-attribute 'linum-highlight-face nil :font "Code New Roman 11"))

;; set unique names for two similar buffers
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Clean up modeline a bit
(line-number-mode)
(size-indication-mode -1)
(column-number-mode -1)

;; Number each buffer for easy switching with M-<no>
(add-to-list 'load-path
             "/Users/kiran/.emacs.d/elpa/window-numbering-20150228.1247")
(require 'window-numbering)
(window-numbering-mode t)

(global-prettify-symbols-mode 1)

;; (defun kg/reset-frame-look ()
;;   (interactive)
;;   (set-face-attribute 'linum nil :font "Fira Code 10")
;;   (fringe-mode 0)
;;   (powerline-reset)
;;   (let ((faces '(mode-line
;;                mode-line-buffer-id
;;                mode-line-emphasis
;;                mode-line-highlight
;;                mode-line-inactive)))
;;      (mapc
;;       (lambda (face)
;;         (set-face-attribute face nil :font "Fira Code 11"))
;;       faces)))

;; Make Emacs handle sRGB colors correctly
;; for solarized theme
;; (setq solarized-broken-srgb nil)

(provide 'init-looks)
;;; init-looks.el ends here
