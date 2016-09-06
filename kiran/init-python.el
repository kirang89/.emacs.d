(use-package python
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python3" . python-mode)
  :init
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  ;;(setenv "PYTHONPATH" "/usr/local/lib/python2.7/site-packages:")
  (setenv "PYTHONPATH" "/Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages/")
  ;; Make python shell use utf-8 encoding
  ;; (setenv "LC_CTYPE" "UTF-8")
  (setq python-shell-interpreter-args "-i"
        py-electric-colon-active t
        python-indent-offset 4
        py-force-py-shell-name-p t
        py-shell-switch-buffers-on-execute-p t
        py-smart-indentation t)
  :config
  (add-hook 'python-mode-hook (lambda ()
                                (require 'sphinx-doc)
                                (sphinx-doc-mode t)))
  (add-hook 'python-mode-hook 'yas-minor-mode)
  (add-hook 'python-mode-hook 'show-paren-mode)
  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'python-mode-hook 'projectile-mode)
  (add-hook 'python-mode-hook 'subword-mode)
  (remove-hook 'python-mode-hook 'flymake-mode))

(use-package elpy
    :after python
    :bind ("M-." . elpy-goto-definition)
    :init
    (setq elpy-rpc-backend "jedi")
    :config
    (elpy-enable)

    (let ((disabled-modules '(elpy-module-flymake elpy-module-highlight-indentation)))
      (setq elpy-modules (-difference elpy-modules disabled-modules))))


(use-package company-jedi
  :after python
  :config
  (add-to-list 'company-backends 'company-jedi))

(use-package sphinx-doc
  :after python
  :config
  (sphinx-doc-mode t))

;; (use-package pytest
;;   :ensure t
;;   :commands (pytest-all
;;              pytest-directory
;;              pytest-failed
;;              pytest-module
;;              pytest-one
;;              pytest-pdb-all
;;              pytest-pdb-directory
;;              pytest-pdb-module
;;              pytest-pdb-one))

;; Stop pinging me about trying to guess the indentation.
;; The defaults work fine.
(setq python-indent-guess-indent-offset nil)

;; Setting this for pyvenv-workon to work
(setenv "WORKON_HOME" "/Users/kiran/Envs")

(provide 'init-python)
;;; init-python.el ends here
