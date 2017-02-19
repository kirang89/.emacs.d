;; Disable VC hooks
;; http://stackoverflow.com/questions/6724471/git-slows-down-emacs-to-death-how-to-fix-this
(setq vc-handled-backends nil)

(remove-hook 'find-file-hooks 'vc-find-file-hook)

(use-package magit
  :defer t
  :init
  (global-set-key (kbd "C-c C-g") 'magit-status)
  :config
  ;; Open magit in a new buffer
  (setq magit-status-buffer-switch-function 'switch-to-buffer)

  (defun disable-magit-highlight-in-buffer ()
    (face-remap-add-relative 'magit-item-highlight '()))
  (add-hook 'magit-status-mode-hook 'disable-magit-highlight-in-buffer)

  (setq magit-set-upstream-on-push 'askifnotset))


(provide 'init-magit)
;;; init-magit ends here
