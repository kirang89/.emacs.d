;; Modeline Configuration
;; Author: Kiran Gangadharan

(line-number-mode t)
(column-number-mode -1)
(size-indication-mode -1)

;; Set default font for different modeline modes
(defun kg/set-modeline-face ()
  "Set the above font in modeline face."
  (interactive)
  (let ((faces '(mode-line
                 mode-line-buffer-id
                 mode-line-emphasis
                 mode-line-highlight
                 mode-line-inactive)))
    (mapc (lambda (face)
            (set-face-attribute face nil
                                :font "Source Code Pro for Powerline-15:weight=regular"
                                :weight 'normal))
          faces)))

(add-hook 'after-init-hook 'kg/set-modeline-face)

(require 'diminish)
(diminish 'helm-mode)
(diminish 'auto-revert-mode)
(diminish 'auto-fill-mode)
(eval-after-load "abbrev" '(diminish 'abbrev-mode))
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "company" '(diminish 'company-mode))
(eval-after-load "projectile" '(diminish 'projectile-mode))
(eval-after-load "flyspell" '(diminish 'flyspell-mode))
(eval-after-load "sphinx-doc" '(diminish 'sphinx-doc-mode))
(eval-after-load "elpy" '(diminish 'elpy-mode))
(eval-after-load "org-indent" '(diminish 'org-indent-mode))
(eval-after-load "smartparens" '(diminish 'smartparens-mode))
(eval-after-load "flycheck" '(diminish 'flycheck-mode))
(eval-after-load "cider" '(diminish 'cider-mode "Cdr"))
(eval-after-load "subword" '(diminish 'subword-mode))
(eval-after-load "indent-guide" '(diminish 'indent-guide-mode))
(eval-after-load "paredit" '(diminish 'paredit-mode))

(defadvice emacs-lisp-mode (after elisp-rename-modeline activate)
  (setq mode-name "ELisp"))

(defvar mode-line-cleaner-alist
  `(;; (paredit-mode . " π")
    ;; Major modes
    (hi-lock-mode . "")
    (python-mode . "Py")
    (clojure-mode . "λ")
    (markdown-mode . "Md")
    (abbrev-mode . ""))
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

;; Fix for broken seperator colors in modeline as shown in
;; https://imgur.com/7Ldxa97
;; (setq ns-use-srgb-colorspace t)

;; To remove the underline below text in modeline for certain
;; themes do:
;; M-x customize-face mode-line and remove the underline.

;; (use-package spaceline
;;   :config
;;   (use-package spaceline-config)
;;   (spaceline-emacs-theme))

(provide 'init-modeline)
;;; init-modeline.el ends here
