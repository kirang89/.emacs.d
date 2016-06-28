
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

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

(setq ns-use-srgb-colorspace t)

;; Good font sizes
;; ===============
(set-frame-font "Source Code Pro-15.0:weight=regular:spacing=m")
;;(set-frame-font "Office Code Pro 13")

;; Set default line spacing (relative)
(setq-default line-spacing 0.3)

; don't show the tool bar
(require 'tool-bar)
(tool-bar-mode nil)

; don't show the scroll bar
(scroll-bar-mode -1)

;; Smoother scrolling behavior when using keyboard navigation
(setq redisplay-dont-pause t
      scroll-margin 3
      scroll-step 5
      scroll-conservatively 1000
      ;; Make C-v and M-v undo each other
      scroll-preserve-screen-position 'always
      mouse-wheel-follow-mouse 't
      ;; Scroll in one line increments
      ;; Gives a smoother mouse scroll
      mouse-wheel-scroll-amount '(1 ((shift) . 1)))

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

;; Syntax Highlighting
(require 'font-lock)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode 1)

;; M-q should fill at 80 chars, not 70
(setq-default fill-column 80)

;;(setq linum-format "%5d ")
;;(custom-set-variables '(linum-format 'dynamic))

(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat "  %" (number-to-string w) "d ")))
    ad-do-it))

(defun kg/reset-linum ()
  "Reset formatting of line numbers."
  (interactive)
  (let ((font "Source Code Pro-11:weight=regular:spacing=m"))
    (require 'linum)
    (set-face-attribute 'linum nil :font font)))

(add-hook 'prog-mode-hook 'linum-mode)

;; set color for selection
;; (set-face-attribute 'region nil :background "#666")

;; Smoother scrolling behavior when using keyboard navigation
(setq redisplay-dont-pause t
      scroll-margin 3
      scroll-step 5
      scroll-conservatively 1000
      scroll-preserve-screen-position 1)
(add-hook 'after-init-hook #'kg/reset-linum)

;; set unique names for two similar buffers
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Number each buffer for easy switching with M-<no>
(use-package window-numbering
  :config (window-numbering-mode t))

(global-prettify-symbols-mode 1)

;; Use this for github theme
;;(set-face-attribute 'helm-selection nil :background "#A7C6E3")

(provide 'init-looks)
;;; init-looks.el ends here
