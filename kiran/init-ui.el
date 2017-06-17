(add-to-list 'default-frame-alist '(height . 38))
(add-to-list 'default-frame-alist '(width . 85))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; inhibit welcome screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Resize windows proportionally
(setq-default window-combination-resize t)

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
(setq-default cursor-in-non-selected-windows nil)

;; Remove line highlight
(global-hl-line-mode -1)

;; Focus on help windows
(setq-default help-window-select t)

;; (set-frame-font "Source Code Pro:weight=regular:pixelsize=16")
(set-frame-font "Inconsolata:weight=regular:pixelsize=17")

;; Italics for comments
(set-face-attribute 'font-lock-comment-face nil :italic t)
(set-face-attribute 'font-lock-doc-face nil :italic t)

;; Set default line spacing (relative)
(setq-default line-spacing 0.15)

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

(defun kg/set-fringe-background ()
  "Set the fringe background to the same color as the regular background."
  (interactive)
  (custom-set-faces
   `(fringe ((t (:background ,(face-background 'default)))))))

(add-hook 'after-init-hook #'kg/set-fringe-background)

;; highlight current line
(global-hl-line-mode t)

;; Syntax Highlighting
(require 'font-lock)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode 1)

;; M-q should fill at 80 chars, not 70
(setq-default fill-column 80)

;;(setq linum-format "%5d ")
;;(add-hook 'prog-mode-hook 'linum-mode)

;; (defun kg/reset-linum ()
;;   "Reset formatting of line numbers."
;;   (interactive)
;;   (let ((font "Source Code Pro:weight=regular:pixelsize=13"))
;;     (setq linum-format "%5d ")
;;     (require 'linum)
;;     (set-face-attribute 'linum nil :font font)))

;; Smoother scrolling behavior when using keyboard navigation
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; set unique names for two similar buffers
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Number each buffer for easy switching with M-<no>
(use-package window-numbering
  :ensure t
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

;; turn off auto revert messages
(setq auto-revert-verbose nil)

;; (use-package auto-dim-other-buffers
;;   :ensure t
;;   :init (auto-dim-other-buffers-mode 1))

(provide 'init-ui)
;;; init-ui.el ends here
