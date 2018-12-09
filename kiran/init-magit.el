;; Disable VC hooks
;; http://stackoverflow.com/questions/6724471/git-slows-down-emacs-to-death-how-to-fix-this
(setq vc-handled-backends '(Git))
;; (remove-hook 'find-file-hooks 'vc-find-file-hook)

(use-package magit
  :ensure t
  :init
  (global-set-key (kbd "C-c C-g") 'magit-status)
  :config
  ;; Make magit status buffer fill the entire frame
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)

  (defun disable-magit-highlight-in-buffer ()
    (face-remap-add-relative 'magit-item-highlight '()))
  (add-hook 'magit-status-mode-hook 'disable-magit-highlight-in-buffer)

  (setq magit-set-upstream-on-push 'askifnotset))


(provide 'init-magit)
;;; init-magit ends here
