;;; init.el --- Configuration for Emacs
;;
;;; Commentary:
;;
;; Configuration for Emacs
;;
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(setq package-enable-at-startup nil)

(package-initialize)

;; Recompile .el file(s) if changes occur
(byte-recompile-directory (expand-file-name "~/.emacs.d/kiran") 0)

;; Prevent loading of outdated .elc files
(setq load-prefer-newer t)

;; Record the start time
(setq *emacs-load-start* (current-time))

;; Experiment: Turn off mouse interface early in startup to avoid momentary display
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Cache 50MB before garbage collection
(setq gc-cons-threshold 50000000)

;; language
(setq current-language-environment "English")

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

(setq confirm-kill-emacs #'y-or-n-p)

;; Turn off bell
(setq ring-bell-function #'ignore)

;; https://www.emacswiki.org/emacs/ExecPath
(add-to-list 'exec-path "/usr/local/bin")

(add-to-list 'load-path "~/.emacs.d/kiran/")

(package-initialize)

;; On OS X Emacs doesn't use the shell PATH if it's not started from
;; the shell. Let's fix that:
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config (exec-path-from-shell-initialize))

;; Custom configuration set by Emacs
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(require 'init-packages)
(require 'init-ui)
(require 'init-editing)
;;(require 'init-dired)
(require 'init-kbd)
(require 'init-ido)
(require 'init-smex)
(require 'init-ivy)
(require 'init-ibuffer)
(require 'init-company)
(require 'init-keychord)
(require 'init-parens)
(require 'init-search)
(require 'init-python)
(require 'init-clojure)
(require 'init-elisp)
(require 'init-elixir)
(require 'init-org)
(require 'init-yasnippet)
(require 'init-modeline)
(require 'init-shell)
(require 'init-efuns)
(require 'init-magit)
(require 'init-markdown)
;;(require 'init-flycheck)
(require 'init-projectile)
;;(require 'init-solarized)
;;(require 'init-latex)
(require 'init-docker)
(require 'init-experimental)
(eval-after-load 'web-mode '(require 'init-web))

(load-theme 'darkokai)
(set-face-attribute 'region nil :background "#3a3a3a")

(fringe-mode 10)

;; Save minibuffer history
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length 150)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)

;; turn beep off
(setq visible-bell nil)

;; Follow compiler ouput
(setq compilation-scroll-output t)

(remove-hook 'org-mode-hook 'linum-mode)
(remove-hook 'compilation-minor-mode-hook 'linum-mode)
(remove-hook 'custom-theme-choose-mode-hook 'linum-mode)

;; don't disable narrow-to-region command
(put 'narrow-to-region 'disabled nil)

(use-package discover-my-major
  :ensure t)

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

;; ======= TODOs ===========
;; - Checkout stuff in https://github.com/bbatsov/crux
;; - https://github.com/abo-abo/hydra
;; - https://github.com/kiwanami/emacs-calfw
;; - https://github.com/ilya-babanov/emacs-bpr
