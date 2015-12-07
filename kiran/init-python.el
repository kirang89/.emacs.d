
;; python-mode settings
(setq py-electric-colon-active t)

;; Elpy setup
(package-initialize)
(elpy-enable)
;;(elpy-use-ipython)
(setq elpy-rpc-backend "jedi")

;; (elpy-clean-modeline)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq python-indent-offset 4)

; Set PYTHONPATH, because we don't load .bashrc
(setenv "PYTHONPATH" "/usr/local/lib/python2.7/site-packages:")

(defun kg/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'yas-minor-mode)
(add-hook 'python-mode-hook 'kg/python-mode-hook)
(add-hook 'python-mode-hook 'turn-on-eldoc-mode)
;;(add-hook 'python-mode-hook 'projectile-mode)
(add-hook 'python-mode-hook (lambda ()
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)))
(add-hook 'python-mode-hook (lambda ()
                              (require 'indent-guide)
                              (indent-guide-mode t)))

(defvar py-force-py-shell-name-p)
(setq py-force-py-shell-name-p t)
;; switch to the interpreter after executing code
(defvar py-shell-switch-buffers-on-execute-p)
(setq py-shell-switch-buffers-on-execute-p t)

;; don't split windows
;;(setq py-split-windows-on-execute-p t)

;; ;; try to automagically figure out indentation
(defvar py-smart-indentation)
(setq py-smart-indentation t)

;; Make python shell use utf-8 encoding
(setenv "LC_CTYPE" "UTF-8")

(add-hook 'python-mode-hook (lambda ()
                              (require 'nose)
                              (defvar nose-use-verbose t)
                              'linum-mode))

(add-hook 'python-mode-hook
          (lambda () (local-set-key (kbd "C-c t") 'elpy-test-nose-runner)))

(add-hook 'elpy-mode-hook 'flycheck-mode)

;; (require 'helm)
;; (add-hook 'python-mode-hook
;;           (lambda () (local-set-key (kbd "C-c f") #'helm-semantic-or-imenu)))


(provide 'init-python)
;;; init-python.el ends here
