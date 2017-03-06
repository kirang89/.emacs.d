;; UTF-8 UTF-8 everywhere!
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)

(setq ns-command-modifier 'meta)

;; Disable bypassing certain (ex: M-h) to system
(setq mac-pass-command-to-system nil)

;; require final newlines in files when they are saved
(setq require-final-newline t)

;; Always newline-and-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Remove autocomplete (and use company-mode instead)
(require 'auto-complete)
(global-auto-complete-mode -1)

;; disable backup
(setq backup-inhibited t)

;; do not make backup files
(setq make-backup-files nil)

;; turn auto-save off
(setq-default auto-save-default nil)

;; don't show trailing whitespace
(setq-default show-trailing-whitespace nil)

;; indents 4 chars
(setq c-basic-offset 4)
(setq standard-indent 4)

;; and 4 char wide for TAB
(setq tab-width 4)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; update the buffer if a file has change on disk
(global-auto-revert-mode 1)

;; delete trailing whitespace on file save
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; auto fill for text mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Rewrite selected text
(delete-selection-mode 1)

;; Use M-w to copy line containing cursor if no region
;; is selected.
(defadvice kill-ring-save
    (before slick-copy activate compile)
    "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active
       (list (region-beginning)
             (region-end))
     (message "Line copied")
     (list (line-beginning-position)
           (line-beginning-position 2)))))

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
;; (use-package flyspell-mode
;;   :init
;;   (setq ispell-program-name "aspell"
;;         ispell-extra-args (list "--sug-mode=ultra" "--lang=en_US"))
;;   :config
;;   (add-hook 'text-mode-hook #'flyspell-mode))


(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))


;; Create intermediate directories
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p (format "Directory %s does not exist. Create it? " dir)))
                  (make-directory dir t))))))


;; Mode for distraction free writing
(use-package darkroom
  :defer t
  :diminish "DkR")
;;(autoload 'darkroom "darkroom" "Darkroom mode" t)


;; Allow pasting selection outside of Emacs
(setq select-enable-clipboard t
      save-interprogram-paste-before-kill t)


(use-package aggressive-indent
  :commands (aggressive-indent-mode)
  :config
  ;;(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode))


;; Comment a line from anywhere in that line
;; (use-package smart-comment
;;   :config
;;   (global-set-key (kbd "M-;") 'smart-comment-line))


(provide 'init-editing)
;;; init-editing.el ends here
