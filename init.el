;;; init.el --- Configuration for Emacs
;;
;;; Commentary:
;;
;; Configuration for Emacs
;;
;;; Code:


; =================================== TODOS ===============================
;
; - Completely migrate to using use-package
; - Read
;   - http://www.lunaryorn.com/2015/01/06/my-emacs-configuration-with-use-package.html
;   - http://writequit.org/eos/eos.html
;
; ========================================= ===============================

;; Record the start time

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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

(setq default-file-name-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

(setq confirm-kill-emacs #'y-or-n-p)

;; do not make backup files
(setq make-backup-files nil)

;; Turn off bell
(setq ring-bell-function #'ignore)

;; https://www.emacswiki.org/emacs/ExecPath
(add-to-list 'exec-path "/usr/local/bin")

;; Disable key bypass (ex: M-h) to system
(setq mac-pass-command-to-system nil)

;; Prevent loading of outdated .elc files
(setq load-prefer-newer t)

(add-to-list 'load-path "~/.emacs.d/kiran/")

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
(require 'init-python)
(require 'init-clojure)
(require 'init-elisp)
(require 'init-org)
(require 'init-yasnippet)
(require 'init-modeline)
(require 'init-shell)
(require 'efuns)
(require 'init-magit)
(require 'init-projectile)
;;(require 'init-solarized)
;;(require 'init-mu4e)
(eval-after-load 'markdown-mode '(require 'init-markdown))
(eval-after-load 'c-mode '(require 'init-c))
(eval-after-load 'web-mode '(require 'init-web))
(eval-after-load 'prolog-mode '(require 'init-prolog))
(eval-after-load 'sml-mode '(require 'init-sml))

;; Custom configuration set by Emacs
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; set exec-path according to the system's PATH
;; This is primarily for OS X, where starting Emacs in GUI mode
;; doesn't inherit the shell's environment. This ensures that
;; any command we can call from a shell, we can call inside Emacs.
;; (use-package exec-path-from-shell
;;   :config
;;   (when (memq window-system '(mac ns))
;;     (exec-path-from-shell-initialize)))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Save minibuffer history
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)

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
                           (y-or-n-p (format "Directory %s does not exist. Create it? " dir)))
                  (make-directory dir t))))))

;; Toggle frame split (see efuns.el)
(global-set-key (kbd "C-x |") 'toggle-frame-split)

;; remote-editing ftw!
;; (require 'tramp)
;; (setq tramp-default-method "ssh")

;; Clean view of major mode keybindings
(global-set-key (kbd "C-h C-m") 'discover-my-major)


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

;; Follow compiler ouput
(setq compilation-scroll-output t)

;; Spell checking in text mode
;;(remove-hook 'text-mode-hook 'turn-on-flyspell)

;; Comment a line from anywhere in that line
;; (use-package smart-comment
;;   :ensure t
;;   :bind ("M-;" . smart-comment))

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

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (add-hook 'prog-mode-hook #'flycheck-mode))

;; Use spotlight instead of locate
(setq locate-command "mdfind")

(use-package aggressive-indent
  :commands (aggressive-indent-mode)
  :config
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode))

;; (use-package google-this
;;   :ensure t
;;   :commands (google-this-word
;;              google-this-region
;;              google-this-symbol
;;              google-this-clean-error-string
;;              google-this-line
;;              google-this-search
;;              google-this-cpp-reference))

;;(setq-default cursor-type 'bar)

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t
      save-interprogram-paste-before-kill t)

(setq paradox-github-token nil)

;; Learn about HTTP headers, media-types, methods, relations and status codes
(use-package know-your-http-well)

;;(use-package fancy-narrow)

(use-package swiper-helm
  :config
  ;; (global-unset-key (kbd "C-s"))
  ;; (global-unset-key (kbd "C-r"))
  ;; (global-set-key (kbd "C-s") 'swiper-helm)
  ;; (global-set-key (kbd "C-r") 'swiper-helm)
  )

(setq-default cursor-type 'bar)


(setenv "PATH" (concat "/Library/TeX/texbin" (getenv "PATH")))
(setq exec-path (cons "/Library/TeX/texbin"  exec-path))
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
