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

(require 'init-packages)
(require 'init-ui)
(require 'init-editing)
(require 'init-dired)
(require 'init-kbd)
(require 'init-ido)
(require 'init-ivy)
;;(require 'init-helm)
(require 'init-ibuffer)
(require 'init-company)
(require 'init-keychord)
(require 'init-parens)
(require 'init-search)
(require 'init-python)
(require 'init-clojure)
(require 'init-elisp)
(require 'init-org)
(require 'init-yasnippet)
(require 'init-modeline)
;;(require 'init-shell)
(require 'efuns)
(require 'init-magit)
(require 'init-markdown)
(require 'init-gc)
(require 'init-flycheck)
;;(require 'init-neotree)
(require 'init-projectile)
;;(require 'init-solarized)
;;(require 'init-latex)
;;(require 'init-news)

;;(require 'init-mu4e)
;;(eval-after-load 'c-mode '(require 'init-c))
;;(eval-after-load 'web-mode '(require 'init-web))
;;(eval-after-load 'prolog-mode '(require 'init-prolog))
;;(eval-after-load 'sml-mode '(require 'init-sml))

;; Custom configuration set by Emacs
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

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

;; Learn about HTTP headers, media-types, methods, relations and status codes
;;(use-package know-your-http-well)

;;(use-package fancy-narrow)

(use-package google-this
  :config (google-this-mode t))

;; Start emacs server
(server-start)

;; Write out a message indicating how long it took to process the init script
(require 'cl)
(message "init.el loaded in %ds"
         (destructuring-bind (hi lo ms ps) (current-time)
           (- (+ hi lo)
              (+ (first *emacs-load-start*)
                 (second *emacs-load-start*)))))


;; ======= TODOs ===========
;; - Checkout stuff in https://github.com/bbatsov/crux
;; - https://github.com/abo-abo/hydra
;; - https://github.com/kiwanami/emacs-calfw
;; - https://github.com/ilya-babanov/emacs-bpr


(provide `.emacs)
;;; init.el ends here
