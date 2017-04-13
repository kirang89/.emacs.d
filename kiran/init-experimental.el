(require 'highlight-indentation)
;;(set-face-background 'highlight-indentation-face "#2f3940") ;; or use #242c31
;;(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
(add-hook 'elpy-mode-hook 'highlight-indentation-mode)


;; Learn about HTTP headers, media-types, methods, relations and status codes
;;(use-package know-your-http-well)


;;(use-package fancy-narrow)


;; (use-package google-this
;;   :config (google-this-mode t))


;; Consider whether or not to keep this
(setq echo-keystrokes 0.5)


;; (setq whitespace-line-column 80)
;; (setq whitespace-style '(face tabs empty trailing lines-tail))
;; (require 'whitespace)
;; (whitespace-mode -1)


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


(provide 'init-experimental)
;;; init-experimental.el ends here.
