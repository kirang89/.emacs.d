
;; python-mode settings
;;(require 'python-mode)
;;(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(setq py-electric-colon-active t)

;; Elpy setup
(package-initialize)
(elpy-enable)
(elpy-use-ipython)
(setq elpy-rpc-backend "jedi")

(company-quickhelp-mode 1)

;;(elpy-clean-modeline)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(add-hook 'python-mode-hook '(lambda () (setq python-indent 4)))

; Set PYTHONPATH, because we don't load .bashrc
(setenv "PYTHONPATH" "/usr/local/lib/python2.7/site-packages:")

(add-hook 'python-mode-hook 'yas-minor-mode)
;;(add-hook 'python-mode-hook 'auto-complete-mode)
;;(add-hook 'py-shell-hook '(lambda () (linum-mode -1)))

;; jedi
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
;;(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:complete-on-dot t)

;;setting up iPython as interpreter
;;(require 'ipython)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--classic"
      python-shell-prompt-regexp ">>> "
      python-shell-prompt-output-regexp ""
      python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
      python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;;Fix for NameError when launching ipython
(setq py-python-command-args '("--colors=linux"))

;; (setq py-force-py-shell-name-p t)
;; ;; switch to the interpreter after executing code
;; (setq py-shell-switch-buffers-on-execute-p t)
;; (setq py-switch-buffers-on-execute-p t)
;; ;; don't split windows
;; (setq py-split-windows-on-execute-p nil)
;; ;; try to automagically figure out indentation
(setq py-smart-indentation t)

;; flycheck support
;;(require 'flycheck)
;;(add-hook 'after-init-hook #'global-flycheck-mode)

;; Make python shell use utf-8 encoding
(setenv "LC_CTYPE" "UTF-8")

(autoload 'nose "nose" "Nose mode" t)
(defvar nose-use-verbose nil)

(provide 'init-python)
;;; init-python.el ends here
