;;; init-elisp --- Configuration for Emacs Lisp mode-line
;;
;;; Commentary:
;;
;; Configuration for Emacs Lisp mode-line
;;
;;; Code:

(add-hook 'emacs-lisp-mode-hook 'flycheck-mode)

;;(add-hook 'emacs-lisp-mode-hook 'linum-mode)

;; Documentation at point for lisp files
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)

(add-hook 'emacs-lisp-mode-hook (lambda () (rainbow-delimiters-mode)))

(add-hook 'emacs-lisp-mode-hook 'paren-face-mode)

(add-hook 'emacs-lisp-mode-hook 'aggressive-indent-mode)


(provide 'init-elisp)
;;; init-elisp ends here
