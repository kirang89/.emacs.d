(add-hook 'python-mode-hook 'subword-mode)

(use-package elpy
  :ensure t
  :bind ("M-." . elpy-goto-definition)
  :init

  ;; Since ELPY is not a simple mode, but a collection of smaller modes stitched
  ;; together, we have to call with-eval-after-load
  (with-eval-after-load 'python (elpy-enable))

  (setq elpy-rpc-backend "jedi")
  (add-hook 'python-mode-hook #'flycheck-mode)
  ;; Make python shell use utf-8 encoding
  (setenv "LC_CTYPE" "UTF-8")
  :config
  ;; (elpy-enable)
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


(use-package pip-requirements
  :diminish pip-requirements-mode "PyPA Reqs"
  :preface
  (defun kg/pip-requirements-ignore-case ()
    (setq-local completion-ignore-case t))
  :init (add-hook 'pip-requirements-mode-hook #'kg/pip-requirements-ignore-case))


(use-package sphinx-doc
  :ensure t
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

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Start/Stop jedi on env activation/deactivation
(add-hook 'pyvenv-post-activate-hooks 'jedi:start-server)
(add-hook 'pyvenv-post-activate-hook 'elpy-rpc-restart)
(add-hook 'pyvenv-post-deactivate-hooks 'jedi:stop-server)


(provide 'init-python)
;;; init-python.el ends here
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
