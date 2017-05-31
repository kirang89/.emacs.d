;;(require 'highlight-indentation)
;;(set-face-background 'highlight-indentation-face "#2f3940") ;; or use #242c31
;; (set-face-background 'highlight-indentation-face "#64737D")
;; (set-face-background 'highlight-indentation-face "#3E4342")
;; ;;(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
;;(remove-hook 'elpy-mode-hook 'highlight-indentation-mode)

;; Learn about HTTP headers, media-types, methods, relations and status codes
;;(use-package know-your-http-well)

;; (use-package google-this
;;   :config (google-this-mode t))

;; Consider whether or not to keep this
(setq echo-keystrokes 0.5)

;; (require 'diff-hl-flydiff)
;; (global-diff-hl-mode t)
;; (diff-hl-flydiff-mode)
;; (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

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

;; Comment a line from anywhere in that line
;; (use-package smart-comment
;;   :config
;;   (global-set-key (kbd "M-;") 'smart-comment-region))

;; Delete files to trash
(setq delete-by-moving-to-trash t)

(use-package lispy
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1))))

(provide 'init-experimental)
;;; init-experimental.el ends here.
