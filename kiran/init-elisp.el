;;; init-elisp --- Configuration for Emacs Lisp mode-line
;;
;;; Commentary:
;;
;; Configuration for Emacs Lisp mode-line
;;
;;; Code:

;; Documentation at point for lisp files
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (rainbow-delimiters-mode)
                                  (local-set-key (kbd "M-.") 'find-file-at-point)))

(provide 'init-elisp)
;;; init-elisp ends here
