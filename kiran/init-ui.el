
(add-to-list 'default-frame-alist '(height . 38))
(add-to-list 'default-frame-alist '(width . 85))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; inhibit welcome screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Start emacs with text-mode
(setq initial-major-mode 'text-mode)

;; Set a better frame title
(setq frame-title-format '("%b (%m)"))

;; Remove scratch buffer message
(setq initial-scratch-message "")

;; Remove menu bar when running Emacs from terminal
;; (when (not window-system)
;;   (menu-bar-mode -1))

(setq-default cursor-type 'box)

;; Don't blink the cursor
(blink-cursor-mode 1)

;; Hide cursor in inactive windows
(setq cursor-in-non-selected-windows nil)

;; Focus on help windows
(setq help-window-select t)

;;(set-frame-font "SF Mono:weight=light:pixelsize=11")
(set-frame-font "Iosevka Type:weight=light:pixelsize=15")
;;(set-frame-font "AkkuratMonoMono:weight=light:pixelsize=13")
;;(set-frame-font "Source Code Pro:weight=regular:pixelsize=14")
;;(set-frame-font "DejaVu Sans Mono:weight=regular:pixelsize=15")
;;(set-frame-font "Fira Code:weight=regular:pixelsize=15")
;;(set-frame-font "Maax:weight=regular:pixelsize=15")
;;(set-frame-font "Courier Prime Code:weight=regular:pixelsize=16")

;; Set default line spacing (relative)
(setq-default line-spacing 0.3)

;; don't show the tool bar
(tool-bar-mode -1)

;; don't show the scroll bar
(scroll-bar-mode -1)

(setq scroll-margin 0
      scroll-conservatively 10000
      scroll-preserve-screen-position t)

;; ;; Scroll one line at a time (less "jumpy" than defaults)
;; (setq mouse-wheel-scroll-amount '(2 ((shift) . 2))) ;; two lines at a time
;; (setq mouse-wheel-progressive-speed 't) ;; don't accelerate scrolling
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;; (setq scroll-step 1) ;; keyboard scroll one line at a time

;; Smoother scrolling behavior when using keyboard navigation
;; (setq redisplay-dont-pause t
;;       scroll-margin 0
;;       ;;scroll-step 5
;;       scroll-conservatively 10000
;;       ;; Make C-v and M-v undo each other
;;       scroll-preserve-screen-position 'always
;;       mouse-wheel-follow-mouse 't
;;       ;; Scroll in one line increments
;;       ;; Gives a smoother mouse scroll
;;       mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; (use-package smooth-scroll
;;   :config
;;   (smooth-scroll-mode 1)
;;   (setq smooth-scroll/vscroll-step-size 5))

;; (smooth-scrolling-mode -1)

;; Minimal fringe
;; (add-hook 'after-init-hook (lambda () (fringe-mode 15)))

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

(setq linum-format "%5d ")
(add-hook 'prog-mode-hook 'linum-mode)

(defun kg/reset-linum ()
  "Reset formatting of line numbers."
  (interactive)
  (let ((font "Iosevka Type:weight=regular:pixelsize=13"))
    (require 'linum)
    (set-face-attribute 'linum nil :font font)))

;; set color for selection
;; (set-face-attribute 'region nil :background "#666")

;; Smoother scrolling behavior when using keyboard navigation
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; (setq redisplay-dont-pause t
;;       scroll-margin 1
;;       scroll-step 0
;;       scroll-conservatively 100000
;;       scroll-preserve-screen-position t)

;;(add-hook 'after-init-hook #'kg/reset-linum)

;; set unique names for two similar buffers
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Number each buffer for easy switching with M-<no>
(use-package window-numbering
  :config (window-numbering-mode t))

(global-prettify-symbols-mode 1)

;; Turn on ansi color interpretation in a compilation buffer
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  "Show some love for the compilation buffers."
  (read-only-mode -1)
  (ansi-color-apply-on-region (point-min) (point-max))
  (read-only-mode))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; Various keywords (in comments) are now flagged in a Red Error font
(add-hook 'prog-common-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\<\\(FIX\\|FIXME\\|TODO\\|BUG\\|HACK\\):"
                                       1 font-lock-warning-face t)))))

;; Use this for github theme
;;(set-face-attribute 'helm-selection nil :background "#A7C6E3")

(provide 'init-looks)
;;; init-looks.el ends here
