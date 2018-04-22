(use-package key-chord
  :ensure t
  :config
  (key-chord-mode t)
  (key-chord-define-global "ww"
			               (lambda ()
			                 (interactive)
			                 (find-file "~/Box Sync/org-notes/work.org")))
  ;;(key-chord-define-global "bb" #'helm-mini)
  (key-chord-define-global "bb" 'ivy-switch-buffer)
  (key-chord-define-global "ff" 'kg/smart-find-file)
  (key-chord-define-global "jj" 'avy-goto-word-or-subword-1)
  (key-chord-define-global "``"
                           (lambda ()
                             (interactive)
                             (find-file "~/Box Sync/org-notes/brain-droppings/random.txt")))
  (key-chord-define-global "yy"
			               (lambda ()
			                 (interactive)
			                 (find-file "~/.emacs.d/init.el")))
  (key-chord-define-global "ii"
			               (lambda ()
			                 (interactive)
			                 (find-file "~/Box Sync/org-notes/notes.txt"))))


(provide 'init-keychord)
