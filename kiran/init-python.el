
(use-package python
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :config
  (setq python-shell-interpreter-args "-i"
        py-electric-colon-active t
        python-indent-offset 4
        py-force-py-shell-name-p t
        py-shell-switch-buffers-on-execute-p t
        py-smart-indentation t)

  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  (setenv "PYTHONPATH" "/usr/local/lib/python2.7/site-packages:")
  ;; Make python shell use utf-8 encoding
  (setenv "LC_CTYPE" "UTF-8")

  (add-hook 'python-mode-hook (lambda ()
                                (require 'sphinx-doc)
                                (sphinx-doc-mode t)))
  (add-hook 'python-mode-hook 'yas-minor-mode)
  (add-hook 'python-mode-hook 'show-paren-mode)
  (add-hook 'python-mode-hook (lambda ()
                                (require 'nose)
                                (defvar nose-use-verbose t))))


(use-package anaconda-mode
  :ensure t
  :defer 2
  :diminish anaconda-mode
  :diminish anaconda-eldoc-mode
  :bind (:map python-mode-map
              ("C-c d" . anaconda-mode-show-doc))
  :config
  (progn
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
    (add-to-list 'company-backends 'company-anaconda)))

;; Elpy setup
;;(elpy-enable)
;;(elpy-use-ipython)
;;(setq elpy-rpc-backend "jedi")

;; (elpy-clean-modeline)
; Set PYTHONPATH, because we don't load .bashrc

;; (defun kg/python-mode-hook ()
;;   (add-to-list 'company-backends 'company-jedi))

;;(add-hook 'python-mode-hook 'kg/python-mode-hook)
;;(add-hook 'python-mode-hook 'turn-on-eldoc-mode)
;;(add-hook 'python-mode-hook 'projectile-mode)
;; (add-hook 'elpy-mode-hook (lambda ()
;; 			    (local-set-key (kbd "M-.") 'elpy-goto-definition)))


;; (add-hook 'python-mode-hook
;;           (lambda () (local-set-key (kbd "C-c t") 'elpy-test-nose-runner)))

;; (add-hook 'elpy-mode-hook 'flycheck-mode)
;; (setq flycheck-highlighting-mode 'lines)
;; (add-hook 'python-mode-hook
;;           (lambda () (local-set-key (kbd "C-c f") #'flycheck-list-errors)))

;; (require 'helm)
;; (add-hook 'python-mode-hook
;;           (lambda () (local-set-key (kbd "C-c f") #'helm-semantic-or-imenu)))


;; Settings to try out anaconda-mode
;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'eldoc-mode)

(provide 'init-python)
;;; init-python.el ends here
