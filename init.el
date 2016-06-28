;;; init.el --- Configuration for Emacs
;;
;;; Commentary:
;;
;; Configuration for Emacs
;;
;;; Code:


; =================================== TODOS ===============================
;
; - Better completion in eshell
; - Completely migrate to using use-package
; - Eshell does not show previous commands
; - Try anaconda mode
; - Read http://www.lunaryorn.com/2015/01/06/my-emacs-configuration-with-use-package.html
;
; ========================================= ===============================

;; Record the start time
(setq *emacs-load-start* (current-time))

;; Disable VC hooks
;; http://stackoverflow.com/questions/6724471/git-slows-down-emacs-to-death-how-to-fix-this
(setq vc-handled-backends nil)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; language
(setq current-language-environment "English")

;; UTF-8 UTF-8 everywhere!
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

(setq confirm-kill-emacs #'y-or-n-p)

;; do not make backup files
(setq make-backup-files nil)

(add-to-list 'load-path "~/.emacs.d/kiran/")

(require 'init-solarized)

(require 'init-packages)
(require 'use-package)

(require 'init-looks)
(require 'init-editing)
(require 'init-dired)
(require 'init-kbd)
(require 'init-ido)
(require 'init-helm)
(require 'init-ibuffer)
(require 'init-company)
(require 'init-keychord)
(require 'init-parens)
;;(require 'init-c)
(require 'init-python)
(eval-after-load 'clojure-mode '(require 'init-clojure))
(require 'init-elisp)
(eval-after-load 'markdown-mode '(require 'init-markdown))
(eval-after-load 'org '(require 'init-org))
(require 'init-yasnippet)
(require 'init-modeline)
(require 'init-shell)
(require 'efuns)
(require 'init-magit)
;; (require 'init-projectile)
(require 'init-mu4e)
(eval-after-load 'web-mode '(require 'init-web))

;; Custom configuration set by Emacs
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Smart modeline
;; (setq sml/no-confirm-load-theme t)
;; (sml/setup)

;; set exec-path according to the system's PATH
;; This is primarily for OS X, where starting Emacs in GUI mode
;; doesn't inherit the shell's environment. This ensures that
;; any command we can call from a shell, we can call inside Emacs.
;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize))

;; Remove autocomplete (and use company-mode instead)
(require 'auto-complete)
(global-auto-complete-mode -1)

;; turn beep off
(setq visible-bell nil)

;; disable backup
(setq backup-inhibited t)

;; turn auto-save off
(setq-default auto-save-default nil)

;; don't show trailing whitespace
(setq-default show-trailing-whitespace nil)

;; Create intermediate directories
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
                  (make-directory dir t))))))

;; Toggle frame split (see efuns.el)
(global-set-key (kbd "C-x |") 'toggle-frame-split)

;; remote-editing ftw!
;; (require 'tramp)
;; (setq tramp-default-method "ssh")

;; Clean view of major mode keybindings
(global-set-key (kbd "C-h C-m") 'discover-my-major)

(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))

;; Completion ignores filenames ending in any string in this list.
(setq completion-ignored-extensions
      '(".o" ".elc" "~" ".bin" ".class" ".exe" ".ps" ".abs" ".mx"
        ".~jv" ".rbc" ".pyc" ".beam" ".aux" ".out" ".pdf" ".hbc"))

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

;; Turn on ansi color interpretation in a compilation buffer
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  "Show some love for the compilation buffers."
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
;; Follow compiler ouput
(setq compilation-scroll-output t)

;; Various keywords (in comments) are now flagged in a Red Error font
(add-hook 'prog-common-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\<\\(FIX\\|FIXME\\|TODO\\|BUG\\|HACK\\):" 1 font-lock-warning-face t)))))

(use-package json-mode
  :mode "\\.json\\'"
  :config
  ;; (add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
  (bind-key "{" #'paredit-open-curly json-mode-map)
  (bind-key "}" #'paredit-close-curly json-mode-map))


(use-package neotree
  :init
  (setq neo-smart-open t)
  (setq-default neo-dont-be-alone t)
  (setq neo-hidden-files-regexp
        "^\\.\\|~$\\|^#.*#$\\|^target$\\|^pom\\.*\\|^__pycache__$\\|^env$")
  :config
  ;; (local-set-key (kbd "M-<up>") 'neotree-select-up-node)
  ;; (local-set-key (kbd "M-<down>") 'neotree-select-down-node)
  (global-set-key [f9] 'neotree-toggle))

;;; =====================================
;;; Experimental Stuff
;;; =====================================

;; flycheck support
;;(autoload 'flycheck-mode "flycheck" "Checker" t)
;;(require 'flycheck)
;;(add-hook 'after-init-hook #'global-flycheck-mode)

;; Use spotlight instead of locate
(setq locate-command "mdfind")


(use-package aggressive-indent
  :commands (aggressive-indent-mode)
  :config
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode))


;; Increase the GC threshold to 50MB during startup and then bring it
;; down to the default value of 800KB
;; (setq gc-cons-threshold 50000000)

;; (add-hook 'emacs-startup-hook 'my/set-gc-threshold)
;; (defun my/set-gc-threshold ()
;;   "Reset `gc-cons-threshold' to its default value."
;;   (setq gc-cons-threshold 800000))

;; Make C-v and M-v undo each other
(setq scroll-preserve-screen-position 'always)

;;; =================================================================

;; Start emacs server
(server-start)

;; Write out a message indicating how long it took to process the init script
(require 'cl)
(message "init.el loaded in %ds"
         (destructuring-bind (hi lo ms ps) (current-time)
           (- (+ hi lo)
              (+ (first *emacs-load-start*)
                 (second *emacs-load-start*)))))

(provide `.emacs)

;;; init.el ends here
