;; require final newlines in files when they are saved
(setq require-final-newline t)

;; Always newline-and-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; indents 4 chars
(setq c-basic-offset 4)
(setq standard-indent 4)

;; and 4 char wide for TAB
(setq tab-width 4)

;; use spaces instead of tabs
(setq indent-tabs-mode nil)

;; update the buffer if a file has change on disk
(global-auto-revert-mode)

;; delete trailing whitespace on file save
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; auto fill for text mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Rewrite selected text
(delete-selection-mode 1)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-;") 'er/expand-region)

;; avy
(require 'avy)
(define-key global-map (kbd "C-`") 'avy-goto-word-or-subword-1)

;; Move b/w windows ace-jump style
(require 'ace-window)
(define-key global-map (kbd "M-p") 'ace-window)

;; move buffers around
(require 'buffer-move)
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; Requires aspell to be installed
;; Install on OSX by running `brew install aspell --with-lang-en`
;; (autoload 'flyspell-mode "flyspell" "Spell checker" t)
;; (setq-default ispell-program-name "aspell")
;; (setq ispell-extra-args
;;       (list "--sug-mode=ultra"
;;             "--lang=en_US"))

;; multiple cursors!
;; To quit mc mode hit C-g or RET
;; TO insert newline hit C-j
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Mode for distraction free writing
(autoload 'darkroom "darkroom" "Darkroom mode" t)

(provide 'init-editing)
;;; init-editing.el ends here
