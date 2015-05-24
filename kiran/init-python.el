
;; python-mode settings
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(setq py-electric-colon-active t)

; Set PYTHONPATH, because we don't load .bashrc
(setenv "PYTHONPATH" "/usr/local/lib/python2.7/site-packages:")

;(add-hook 'python-mode-hook 'autopair-mode)
;(add-hook 'python-mode-hook 'yas-minor-mode)
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'py-shell-hook '(lambda () (linum-mode -1)))

;; Access symbol lookup using C-h S
(require 'pydoc-info)

;; jedi
(require 'jedi)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook
	  (lambda ()
	    (jedi:setup)
	    (jedi:ac-setup)
            (local-set-key "\C-cd" 'jedi:show-doc)
            ;(local-set-key (kbd "M-SPC") 'jedi:complete)
            (local-set-key (kbd "M-.") 'jedi:goto-definition)))

;;setting up iPython as interpreter
;;(require 'ipython)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args ""
      python-shell-prompt-regexp "In \\[[0-9]+\\]: "
      python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
      python-shell-completion-setup-code
      "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code ""
      python-shell-completion-string-code
      "';'.join(__IP.complete('''%s'''))\n")

;;Fix for NameError when launching ipython
(setq py-python-command-args '("--colors=linux"))

;; (setq py-force-py-shell-name-p t)
;; ;; switch to the interpreter after executing code
;; (setq py-shell-switch-buffers-on-execute-p t)
;; (setq py-switch-buffers-on-execute-p t)
;; ;; don't split windows
;; (setq py-split-windows-on-execute-p nil)
;; ;; try to automagically figure out indentation
;; (setq py-smart-indentation t)


;; flycheck support
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Make python shell use utf-8 encoding
(setenv "LC_CTYPE" "UTF-8")

;;(require 'nose)
;;(defvar nose-use-verbose nil)

(provide 'init-python)
;;; init-python.el ends here
