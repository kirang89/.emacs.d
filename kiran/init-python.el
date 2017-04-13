(add-hook 'python-mode-hook 'subword-mode)

(use-package elpy
  :bind ("M-." . elpy-goto-definition)
  :init
  (setq elpy-rpc-backend "jedi")
  (add-hook 'python-mode-hook #'flycheck-mode)
  (add-hook 'python-mode-hook 'elpy-mode)
  ;; Make python shell use utf-8 encoding
  (setenv "LC_CTYPE" "UTF-8")
  :config
  (elpy-enable)
  (setq python-shell-interpreter-args "-i"
        py-electric-colon-active t
        python-indent-offset 4
        py-force-py-shell-name-p t
        py-shell-switch-buffers-on-execute-p t
        py-smart-indentation t
        python-shell-completion-native nil
        python-shell-interpreter "python2")
  (let ((disabled-modules '(elpy-module-flymake
                            elpy-module-highlight-indentation)))
    (setq elpy-modules (-difference elpy-modules disabled-modules))))

(use-package company-jedi
  ;; :after python
  :config
  (add-to-list 'company-backends 'company-jedi))

(use-package sphinx-doc
  ;; :after python
  :config
  (add-hook 'python-mode-hook (lambda ()
                                (require 'sphinx-doc)
                                (sphinx-doc-mode t))))

(setq python-shell-completion-native nil)
;; Stop pinging me about trying to guess the indentation.
;; The defaults work fine.
(setq python-indent-guess-indent-offset nil)

;; Setting this for pyvenv-workon to work
(setenv "WORKON_HOME" "/Users/kiran/Envs")
;; (setenv "PYTHONPATH" "/usr/local/lib/python2.7/site-packages:")
;; (setenv "PYTHONPATH"
;;         "/Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages/")

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Start/Stop jedi on env activation/deactivation
(add-hook 'pyvenv-post-activate-hooks 'jedi:start-server)
(add-hook 'pyvenv-post-deactivate-hooks 'jedi:stop-server)


(provide 'init-python)
;;; init-python.el ends here
