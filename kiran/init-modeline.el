;; Modeline Configuration
;; Author: Kiran Gangadharan

;; powerline
(require 'powerline)
(powerline-default-theme)
;; (setq powerline-default-separator (quote arrow-fade))
(setq powerline-default-separator 'wave)
(powerline-buffer-size nil 'l)

(line-number-mode t)
(column-number-mode -1)
(size-indication-mode -1)

;; Set default font for different modeline modes
(defun kg/set-modeline-face ()
    (let ((faces '(mode-line
               mode-line-buffer-id
               mode-line-emphasis
               mode-line-highlight
               mode-line-inactive)))
     (mapc
      (lambda (face)
        (set-face-attribute face nil :font "Code New Roman 12" :weight 'light))
      faces)))

(add-hook 'after-init-hook 'kg/set-modeline-face)

(require 'diminish)
(eval-after-load "helm" '(diminish 'helm-mode))
(eval-after-load "abbrev" '(diminish 'abbrev-mode))
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "company" '(diminish 'company-mode))
(eval-after-load "projectile" '(diminish 'projectile-mode))
(eval-after-load "flyspell" '(diminish 'flyspell-mode))
(eval-after-load "sphinx-doc" '(diminish 'sphinx-doc-mode))
(eval-after-load "elpy" '(diminish 'elpy-mode))
(eval-after-load "org-indent" '(diminish 'org-indent-mode))
;; (eval-after-load "paredit" '(diminish 'paredit-mode))
(eval-after-load "smartparens" '(diminish 'smartparens-mode))
(eval-after-load "flycheck" '(diminish 'flycheck-mode))
(eval-after-load "cider" '(diminish 'cider-mode "Cdr"))
(eval-after-load "subword" '(diminish 'subword-mode))
(eval-after-load "indent-guide" '(diminish 'indent-guide-mode))
(eval-after-load "beacon" '(diminish 'beacon-mode))

(defadvice emacs-lisp-mode (after elisp-rename-modeline activate)
  (setq mode-name "ELisp"))

(defvar mode-line-cleaner-alist
  `((paredit-mode . " π")
    ;; Major modes
    (hi-lock-mode . "")
    (python-mode . "Py")
    (clojure-mode . "λ"))
  "Alist for `clean-mode-line'.

When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")

(defun clean-mode-line ()
  (interactive)
  (loop for cleaner in mode-line-cleaner-alist
        do (let* ((mode (car cleaner))
                 (mode-str (cdr cleaner))
                 (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
                 (setcar old-mode-str mode-str))
               ;; major mode
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

(provide 'init-modeline)
;;; init-modeline.el ends here
