;;; init.el --- Configuration for Emacs
;;
;;; Commentary:
;;
;; Configuration for Emacs
;;
;;; Code:

;; Record the start time
(setq *emacs-load-start* (current-time))

;; language
(setq current-language-environment "English")

;; Prefer unicode encoding everywhere
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
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
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(add-to-list 'load-path "~/.emacs.d/kiran/")

(require 'init-packages)
(require 'init-looks)
(require 'init-kbd)
(require 'init-ido)
(require 'init-helm)
(require 'init-keychord)
(require 'init-company)
(require 'init-python)
(require 'init-clojure)
(require 'init-elisp)
(require 'init-markdown)
(require 'init-org)
(require 'init-yasnippet)
(require 'init-shell)
(require 'efuns)
(require 'init-magit)
(require 'init-modeline)
(require 'init-mu4e)
(require 'init-news)
(require 'init-web)

;; Custom configuration set by Emacs
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Smoother scrolling behavior when using keyboard navigation
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; Remove autocomplete (and use company-mode instead)
(require 'auto-complete)
(global-auto-complete-mode -1)

;; Smart parenthesis
(require 'smartparens-config)
(smartparens-global-mode)

;; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode t)

;; require final newlines in files when they are saved
(setq require-final-newline t)

;; use shift to move around windows
;; (windmove-default-keybindings 'shift)

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

(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

;;; Make files and folders in dired-mode neater
(require 'dired-details)
(dired-details-install)

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

;; Mode for distraction free writing
(autoload 'darkroom "darkroom" "Darkroom mode" t)

(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))

;; Turn on beacon mode globally
(beacon-mode 1)

;; Completion ignores filenames ending in any string in this list.
(setq completion-ignored-extensions
      '(".o" ".elc" "~" ".bin" ".class" ".exe" ".ps" ".abs" ".mx"
        ".~jv" ".rbc" ".pyc" ".beam" ".aux" ".out" ".pdf" ".hbc"))

;; Rewrite selected text
(delete-selection-mode 1)

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
