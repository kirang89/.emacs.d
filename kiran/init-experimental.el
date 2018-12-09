;; open a new line above or below the current one, even if the cursor is midsentence
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)

;; Delete files to trash
(setq delete-by-moving-to-trash t)

(setq fast-but-imprecise-scrolling t)

;; (global-set-key (kbd "M-s") (save-buffer))

;; window manager
(use-package eyebrowse
  :ensure t
  :config
  (define-key eyebrowse-mode-map (kbd "M-1") 'eyebrowse-switch-to-window-config-1)
  (define-key eyebrowse-mode-map (kbd "M-2") 'eyebrowse-switch-to-window-config-2)
  (define-key eyebrowse-mode-map (kbd "M-3") 'eyebrowse-switch-to-window-config-3)
  (define-key eyebrowse-mode-map (kbd "M-4") 'eyebrowse-switch-to-window-config-4)
  (eyebrowse-mode t)
  (setq eyebrowse-new-workspace t))

(defun kg/split-below-and-move ()
  (interactive)
  (split-window-below)
  (other-window 1))

  (defun kg/split-right-and-move ()
  (interactive)
  (split-window-right)
  (other-window 1))

(global-set-key (kbd "C-x 3") 'kg/split-right-and-move)
(global-set-key (kbd "C-x 2") 'kg/split-below-and-move)

;; Smart commenting
;;
;; TODO: Paredit keeps overriding the key
;; See https://github.com/xahlee/xah-fly-keys/issues/27 for a potential solution
(use-package comment-dwim-2
  :ensure t
  :config
  (global-set-key (kbd "M-;") 'comment-dwim-2))

(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-S-z") 'redo)

(use-package neotree
  :init
  (use-package all-the-icons)

  :config
  (global-set-key (kbd "<f5>") 'neotree-toggle)

  (setq-default neo-smart-open t)
  (setq neo-theme (if (display-graphic-p) 'icons 'nerd))
  (setq neo-show-hidden-files t)
  ;; Scale the text down a notch when in a neotree buffer
  (defun kg/text-scale-down ()
    (interactive)
    (progn
      (text-scale-adjust 0)
      (text-scale-decrease 1)))

  (add-hook 'neo-after-create-hook
            (lambda (_)
              (call-interactively #'kg/text-scale-down))))

;; might improve performance when moving cursor
;; see https://emacs.stackexchange.com/questions/28736/emacs-pointcursor-movement-lag/28746
(setq auto-window-vscroll nil)

(global-set-key (kbd "<f7>") 'imenu)

;; (use-package treemacs
;;   :ensure t
;;   :defer t
;;   :init
;;   (with-eval-after-load 'winum
;;     (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
;;   :config
;;   (progn
;;     (setq treemacs-collapse-dirs              (if (executable-find "python") 3 0)
;;           treemacs-deferred-git-apply-delay   0.5
;;           treemacs-display-in-side-window     t
;;           treemacs-file-event-delay           5000
;;           treemacs-file-follow-delay          0.2
;;           treemacs-follow-after-init          t
;;           treemacs-follow-recenter-distance   0.1
;;           treemacs-goto-tag-strategy          'refetch-index
;;           treemacs-indentation                2
;;           treemacs-indentation-string         " "
;;           treemacs-is-never-other-window      nil
;;           treemacs-no-png-images              nil
;;           treemacs-project-follow-cleanup     nil
;;           treemacs-persist-file               (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
;;           treemacs-recenter-after-file-follow nil
;;           treemacs-recenter-after-tag-follow  nil
;;           treemacs-show-hidden-files          t
;;           treemacs-silent-filewatch           nil
;;           treemacs-silent-refresh             nil
;;           treemacs-sorting                    'alphabetic-desc
;;           treemacs-space-between-root-nodes   t
;;           treemacs-tag-follow-cleanup         t
;;           treemacs-tag-follow-delay           1.5
;;           treemacs-width                      35)

;;     ;; The default width and height of the icons is 22 pixels. If you are
;;     ;; using a Hi-DPI display, uncomment this to double the icon size.
;;     ;;(treemacs-resize-icons 44)

;;     (treemacs-follow-mode t)
;;     (treemacs-filewatch-mode t)
;;     (treemacs-fringe-indicator-mode t)
;;     (pcase (cons (not (null (executable-find "git")))
;;                  (not (null (executable-find "python3"))))
;;       (`(t . t)
;;        (treemacs-git-mode 'extended))
;;       (`(t . _)
;;        (treemacs-git-mode 'simple))))
;;   :bind
;;   (:map global-map
;;         ("M-0"       . treemacs-select-window)
;;         ("C-x t 1"   . treemacs-delete-other-windows)
;;         ("C-x t t"   . treemacs)
;;         ("C-x t B"   . treemacs-bookmark)
;;         ("C-x t C-t" . treemacs-find-file)
;;         ("C-x t M-t" . treemacs-find-tag)))

;; (use-package treemacs-projectile
;;   :after treemacs projectile
;;   :ensure t)

;;; See https://github.com/wasamasa/dotemacs/blob/master/init.org#comint
(setq comint-prompt-read-only t)

(defun my-comint-preoutput-read-only (text)
  (propertize text 'read-only t))

(add-hook 'comint-preoutput-filter-functions
          'my-comint-preoutput-read-only)

;; Experiment with using Function keys to work with position registers

(provide 'init-experimental)
;;; init-experimental.el ends here.
