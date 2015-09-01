;; Author: Kiran Gangadharan

;; Record the start time
(setq *emacs-load-start* (current-time))

;; language
(setq current-language-environment "English")

;; Prefer unicode encoding everywhere
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

(setq confirm-kill-emacs #'y-or-n-p)

;; do not make backup files
(setq make-backup-files nil)
;; Don't litter fs with backup files
;;(setq backup-directory-alist '((".", "~/.saves")))

;; set exec-path according to the system's PATH
;; This is primarily for OS X, where starting Emacs in GUI mode
;; doesn't inherit the shell's environment. This ensures that
;; any command we can call from a shell, we can call inside Emacs.
(exec-path-from-shell-initialize)

(add-to-list 'load-path "~/.emacs.d/kiran/")

(require 'init-looks)
(require 'init-kbd)
(require 'init-packages)
(require 'init-ido)
(require 'init-helm)
(require 'init-keychord)
(require 'init-company)
(require 'init-python)
(require 'init-markdown)
(require 'init-org)
(require 'init-yasnippet)
(require 'init-shell)
(require 'efuns)
(require 'init-magit)
(require 'init-modeline)
;;(require 'init-mu4e)
(require 'init-news)
(require 'init-web)

;; Custom configuration set by Emacs
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; autocomplete
(require 'auto-complete)
(global-auto-complete-mode -1)
;;(require 'auto-complete-config)
;;(ac-config-default)
;;(setq ac-ignore-case nil)
;;(add-to-list 'ac-modes 'python-mode)

;; Smart parenthesis
(require 'smartparens-config)
(smartparens-global-mode)

; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode t)

;; require final newlines in files when they are saved
(setq require-final-newline t)

;; use shift to move around windows
(windmove-default-keybindings 'shift)

;; turn beep off
(setq visible-bell nil)

;; disable backup
(setq backup-inhibited t)

;; auto fill for text mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; turn auto-save off
(setq-default auto-save-default -1)

;; don't show trailing whitespace
(setq-default show-trailing-whitespace nil)

; indents 4 chars
(setq c-basic-offset 4)
(setq standard-indent 4)

;; and 4 char wide for TAB
(setq tab-width 4)

;; use spaces instead of tabs
(setq indent-tabs-mode nil)

;; update the buffuer if a file has change on disk
(global-auto-revert-mode)

;; delete trailing whitespace on file save
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; Create intermediate directories
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
                  (make-directory dir t))))))

;; ace-jump aka avy
(require 'avy)
(define-key global-map (kbd "C-`") 'avy-goto-word-or-subword-1)

;; Move b/w windows ace-jump style
(require 'ace-window)
(define-key global-map (kbd "M-p") 'ace-window)

;; Toggle frame split (see efuns.el)
(global-set-key (kbd "C-x |") 'toggle-frame-split)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-;") 'er/expand-region)

;; remote-editing ftw!
(require 'tramp)
(setq tramp-default-method "scp")

;; move buffers around
(require 'buffer-move)
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; Run MIT Scheme with Emacs
;(require 'xscheme)
;(setenv "MITSCHEME_LIBRARY_PATH" "/usr/local/lib/mit-scheme-x86-64")

(add-to-list 'auto-mode-alist '("\\.pp\\'" . pascal-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

;;; Make files and folders in dired-mode neater
(require 'dired-details)
(dired-details-install)

;; nifty documentation at point for lisp files
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)

;; Requires aspell to be installed
;; Install on OSX by running `brew install aspell --with-lang-en`
(autoload 'flyspell-mode "flyspell" "Spell checker" t)
(setq-default ispell-program-name "aspell")

;; multiple cursors!
;; To quit mc mode hit C-g or RET
;; TO insert newline hit C-j
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Clean view of major mode keybindings
(global-set-key (kbd "C-h C-m") 'discover-my-major)

;;; =====================================
;;; Experimental Stuff
;;; =====================================

;;(require 'cask)
;;(cask-initialize)

;; Keeps ~Cask~ file in sync with the packages
;; that you install/uninstall via ~M-x list-packages~
;; https://github.com/rdallasgray/pallet
;;(require 'pallet)

;; autopair
;;(require 'autopair)
;;(autopair-global-mode)

;; Join current line to previous and fix whitespace at join
(global-set-key (kbd "M-j")
                (lambda () (interactive) (join-line -1)))

;; Always newline-and-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Default formatting style for C based modes
(setq c-default-style "java")
(setq-default c-basic-offset 2)

;;; =================================================================


;; Start emacs server
(server-start)

;; Write out a message indicating how long it took to process the init script
(message "init.el loaded in %ds"
         (destructuring-bind (hi lo ms ps) (current-time)
           (- (+ hi lo)
              (+ (first *emacs-load-start*)
                 (second *emacs-load-start*)))))

(provide `.emacs)

;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "#232533" :foreground "#ffffff" :box (:line-width 1 :style released-button) :weight normal))))
 '(org-block ((t (:inherit shadow))))
 '(org-block-background ((t (:background "#2e3043"))))
 '(org-code ((t (:inherit shadow))))
 '(org-done ((t (:foreground "#a9dc69" :slant italic :weight bold))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.4))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-link ((t (:inherit link :weight normal))))
 '(org-list-dt ((t (:weight normal))))
 '(org-tag ((t (:weight light))))
 '(org-todo ((t (:foreground "#feccd4" :weight bold)))))
