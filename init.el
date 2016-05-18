;;; init.el --- Configuration for Emacs
;;
;;; Commentary:
;;
;; Configuration for Emacs
;;
;;; Code:

;; Record the start time
(setq *emacs-load-start* (current-time))

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
;; Don't litter fs with backup files
;;(setq backup-directory-alist '((".", "~/.saves")))

(add-to-list 'load-path "~/.emacs.d/kiran/")

(require 'init-packages)
(require 'use-package)

(require 'init-looks)
(require 'init-modeline)
(require 'init-editing)
(require 'init-kbd)
(require 'init-ido)
(require 'init-helm)
(require 'init-ibuffer)
(require 'init-keychord)
(require 'init-company)
(require 'init-parens)
(eval-after-load 'python-mode '(require 'init-python))
(eval-after-load 'clojure-mode '(require 'init-clojure))
(require 'init-elisp)
(eval-after-load 'markdown-mode '(require 'init-markdown))
(eval-after-load 'org '(require 'init-org))
(require 'init-yasnippet)
(require 'init-shell)
(require 'efuns)
(require 'init-magit)
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

;; Smoother scrolling behavior when using keyboard navigation
(setq redisplay-dont-pause t
      scroll-margin 3
      scroll-step 5
      scroll-conservatively 1000
      scroll-preserve-screen-position 1)

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

(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

;;; Make files and folders in dired-mode neater
(require 'dired-details)
(dired-details-install)

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
     (message "Copied line")
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


;;; =====================================
;;; Experimental Stuff
;;; =====================================

;; flycheck support
;;(autoload 'flycheck-mode "flycheck" "Checker" t)
;;(require 'flycheck)
;;(add-hook 'after-init-hook #'global-flycheck-mode)

;; Use spotlight instead of locate
(setq locate-command "mdfind")

;;(projectile-global-mode)
;; asks for file to open when project is switched
;;(setq projectile-switch-project-action 'helm-projectile-find-file)
;; turns on helm bindings for projectile
;;(helm-projectile-on)
;; (define-key projectile-mode-map (kbd "C-x j") 'projectile-find-file)

(remove-hook 'text-mode-hook 'turn-on-flyspell)

;; Comment a line from anywhere in that line
(use-package smart-comment
  :ensure t
  :bind ("M-;" . smart-comment))

;; Various keywords (in comments) are now flagged in a Red Error font
(add-hook 'prog-common-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\<\\(FIX\\|FIXME\\|TODO\\|BUG\\|HACK\\):" 1 font-lock-warning-face t)))))

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
