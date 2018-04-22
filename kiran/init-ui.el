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
;; (setq frame-title-format '("%b (%m)"))
(setq
 frame-title-format
 '((:eval (if (buffer-file-name)
              (abbreviate-file-name (buffer-file-name))
            "%b"))))

;; Remove scratch buffer message
(setq initial-scratch-message "")

(setq-default cursor-type 'box)

;; blink the cursor
(blink-cursor-mode 1)

;; Hide cursor in inactive windows
(setq-default cursor-in-non-selected-windows nil)

;; Remove line highlight
(global-hl-line-mode -1)

;; Focus on help windows
(setq-default help-window-select t)

(set-frame-font "SF Mono:weight=light:pixelsize=12")

;; TODO: Setup as per https://github.com/bleadof/emacs.d/blob/f5eded385b1a1fcdcb6af15d875a230d26fe53ff/conf/fundamentals/company-emoji-conf.el
;;(set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend)

;; Set default line spacing (relative)
(setq-default line-spacing 0.45)

;; Italics for comments
(set-face-attribute 'font-lock-comment-face nil :italic t)
(set-face-attribute 'font-lock-doc-face nil :italic t)

;; don't show the tool bar
(tool-bar-mode -1)

;; don't show the scroll bar
(scroll-bar-mode -1)

(setq scroll-margin 0
      scroll-conservatively 10000
      scroll-preserve-screen-position t)

(defun kg/set-fringe-background ()
  "Set the fringe background to the same color as the regular background."
  (interactive)
  (custom-set-faces
   `(fringe ((t (:background ,(face-background 'default)))))))

(add-hook 'after-init-hook #'kg/set-fringe-background)

;; Syntax Highlighting
(require 'font-lock)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode 1)

;; M-q should fill at 85 chars, not 70
(setq-default fill-column 85)

(setq linum-format "%5d ")
(add-hook 'prog-mode-hook 'linum-mode)

;; set unique names for two similar buffers
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Navigate windows using Shift + arrow key
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Use pretty symbols for common keywords
;; (global-prettify-symbols-mode 1)

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

;; turn off auto revert messages
(setq auto-revert-verbose nil)

;; Use this with bubbleberry theme
;; (set-face-attribute 'region nil :background "#363636")

(provide 'init-ui)
;;; init-ui.el ends here
