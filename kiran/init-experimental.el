;; Consider whether or not to keep this
;; (setq echo-keystrokes 0.5)

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

;; (use-package dashboard
;;   :config
;;   (dashboard-setup-startup-hook)

;;   (setq dashboard-items '((recents  . 5)
;;                           (projects . 5)
;;                           (agenda . 5))))

(global-set-key (kbd "M-s") (save-buffer))

;; unset C- and M- digit keys to create useful keybindings for them
(dotimes (n 10)
  ;;(global-unset-key (kbd (format "C-%d" n)))
  (global-unset-key (kbd (format "M-%d" n))))

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

;; undo history as a branching tree of changes
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode 1)
  (global-set-key (kbd "C-/") 'undo)
  (global-set-key (kbd "M-z") 'undo)
  (defalias 'redo 'undo-tree-redo)
  (global-set-key (kbd "C-S-/") 'redo)
  (global-set-key (kbd "M-Z") 'redo))

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

;; Edit multiple regions in the same way simultaneously
;; (use-package iedit
;;   :config
;;   (global-set-key (kbd "C-") iedit-mode)
;;   (defun iedit-dwim (arg)
;;     "Starts iedit but uses \\[narrow-to-defun] to limit its scope."
;;     (interactive "P")
;;     (if arg
;;         (iedit-mode)
;;       (save-excursion
;;         (save-restriction
;;           (widen)
;;           ;; this function determines the scope of `iedit-start'.
;;           (if iedit-mode
;;               (iedit-done)
;;             ;; `current-word' can of course be replaced by other
;;             ;; functions.
;;             (narrow-to-defun)
;;             (iedit-start (current-word) (point-min) (point-max))))))))

(use-package neotree
  :config
  (global-set-key (kbd "<f5>") 'neotree-toggle)
  (setq neo-theme 'nerd))

(provide 'init-experimental)
;;; init-experimental.el ends here.
