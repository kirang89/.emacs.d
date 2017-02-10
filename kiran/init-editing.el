
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq ns-command-modifier 'meta)

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
(setq-default indent-tabs-mode nil)

;; update the buffer if a file has change on disk
(global-auto-revert-mode)

;; delete trailing whitespace on file save
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; auto fill for text mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Rewrite selected text
(delete-selection-mode 1)

;; expand-region
(use-package expand-region
  :config (global-set-key (kbd "C-;") 'er/expand-region))

;; avy
(use-package avy
  :config (define-key global-map (kbd "C-`") 'avy-goto-word-or-subword-1))


;; move buffers around
(use-package buffer-move
  :config
  (global-set-key (kbd "C-c <up>")     'buf-move-up)
  (global-set-key (kbd "C-c <down>")   'buf-move-down)
  (global-set-key (kbd "C-c <left>")   'buf-move-left)
  (global-set-key (kbd "C-c <right>")  'buf-move-right))


;; Requires aspell to be installed
;; Install on OSX by running `brew install aspell --with-lang-en`
(use-package flyspell-mode
  :init
  (setq ispell-program-name "aspell"
        ispell-extra-args (list "--sug-mode=ultra" "--lang=en_US"))
  :config
  (add-hook 'text-mode-hook #'flyspell-mode))


(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;; Mode for distraction free writing
(use-package darkroom
  :defer t
  :diminish "DkR")
;;(autoload 'darkroom "darkroom" "Darkroom mode" t)

(provide 'init-editing)
;;; init-editing.el ends here
