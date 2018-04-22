;; UTF-8 UTF-8 everywhere!
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)

(when (eq system-type 'darwin)
  (setq-default exec-path (append exec-path '("/usr/local/bin"))
                ns-command-modifier 'meta))

;; Disable bypassing certain (ex: M-h) to system
(setq mac-pass-command-to-system nil)

;; require final newlines in files when they are saved
(setq require-final-newline t)

;; Always newline-and-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; disable backup
(setq backup-inhibited t
      make-backup-files nil)

;; turn auto-save off
(setq-default auto-save-default nil)

;; don't show trailing whitespace
(setq-default show-trailing-whitespace nil)

;; indents 4 chars
(setq standard-indent 4
      c-basic-offset 4
      tab-width 4)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode 1)

(global-subword-mode 1)

;; delete trailing whitespace on file save
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; auto fill for text mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Remap C-w to backward kill word instead of kill region
;;(global-set-key "\C-w" 'kill-region)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key (kbd "C-c l") 'kill-whole-line)

;; Join current line to previous and fix whitespace at join
(global-set-key (kbd "M-j")
                (lambda () (interactive) (join-line -1)))

;; Rewrite selected text
(delete-selection-mode 1)

(put 'downcase-region 'disabled nil)    ; Enable downcase-region
(put 'upcase-region 'disabled nil)      ; Enable upcase-region

;; When middle-clicking dont't adjust point and paste at the then adjusted point.
(setq mouse-yank-at-point t)

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
  :ensure t
  :config (global-set-key (kbd "C-;") 'er/expand-region))

;; move buffers around
(use-package buffer-move
  :ensure t
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
  :ensure t
  :config
  (setq-default mc/edit-lines-empty-lines 'ignore
                mc/insert-numbers-default 1)
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
  (global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click))


;; Create intermediate directories
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p (format "Directory %s does not exist. Create it? " dir)))
                  (make-directory dir t))))))


;; Mode for distraction free writing
;; (use-package darkroom
;;   :ensure t
;;   :diminish "DkR")

(setq select-enable-clipboard t             ; Merge system's and emacs' clipboard
      save-interprogram-paste-before-kill t ; Allow pasting selection outside of Emacs
      )


(use-package aggressive-indent
  :ensure t
  :commands (aggressive-indent-mode)
  :config
  (add-hook 'emacs-lisp-mode-hook 'aggressive-indent-mode)
  (add-hook 'clojure-mode-hook 'aggressive-indent-mode))

(global-set-key (kbd "C-x l") 'goto-line)

(provide 'init-editing)
;;; init-editing.el ends here
