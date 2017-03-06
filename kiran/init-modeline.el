;; (line-number-mode t)
;; (column-number-mode -1)
;; (size-indication-mode -1)

;; Fix for broken seperator colors on the modeline
(setq ns-use-srgb-colorspace nil)

(require 'spaceline-config)
(spaceline-emacs-theme)


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
                                :font "Hasklig-13"
                                :weight 'bold))
          faces)))

(add-hook 'after-init-hook #'kg/set-modeline-face)


(require 'diminish)
(diminish 'auto-revert-mode)
(diminish 'auto-fill-mode)
(eval-after-load "abbrev" '(diminish 'abbrev-mode))
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "company" '(diminish 'company-mode))
(eval-after-load "projectile" '(diminish 'projectile-mode))
;; (eval-after-load "flyspell" '(diminish 'flyspell-mode))
(eval-after-load "sphinx-doc" '(diminish 'sphinx-doc-mode))
(eval-after-load "org-indent" '(diminish 'org-indent-mode))
(eval-after-load "smartparens" '(diminish 'smartparens-mode))
(eval-after-load "flycheck" '(diminish 'flycheck-mode))
(eval-after-load "cider" '(diminish 'cider-mode "Cider"))
(eval-after-load "subword" '(diminish 'subword-mode))
(eval-after-load "indent-guide" '(diminish 'indent-guide-mode))
(eval-after-load "paredit" '(diminish 'paredit-mode "Par"))
(eval-after-load "helm" '(diminish 'helm-mode))
(eval-after-load "outline" '(diminish 'outline-minor-mode))
(eval-after-load "ivy" '(diminish 'ivy-mode))
(eval-after-load "google-this" '(diminish 'google-this-mode))
(eval-after-load "aggressive-indent" '(diminish 'aggressive-indent-mode "Ai"))
(eval-after-load "clj-refactor" '(diminish 'clj-refactor-mode))

(defadvice emacs-lisp-mode (after elisp-rename-modeline activate)
  (setq mode-name "ELisp"))

(defvar mode-line-cleaner-alist
  `(;; (paredit-mode . " π")
    ;; Major modes
    (hi-lock-mode . "")
    (python-mode . "Py")
    (clojure-mode . "Clj") ;; λ
    (markdown-mode . "Md"))
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


;; To remove the underline below text in modeline for certain
;; themes do:
;; M-x customize-face mode-line and remove the underline.

;; (use-package spaceline
;;   :config
;;   (use-package spaceline-config)
;;   (spaceline-emacs-theme))

;; ======================================
;; (setq mode-line-format
;;       (list
;;        "%e" mode-line-front-space
;;        mode-line-modified
;;        "%e" mode-line-front-space
;;        ;; the buffer name; the file name as a tool tip
;;        '(:eval (propertize "%b " 'face 'font-lock-keyword-face
;;                            'help-echo (buffer-file-name)))

;;        "["
;;        ;; line and column
;;        ;; '%02' to set to 2 chars at least; prevents flickering
;;        (propertize "%02l" 'face 'font-lock-type-face)
;;        ", "
;;        ;; relative position, size of file
;;        (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
;;        "] "

;;        " "
;;        ;; the current major mode for the buffer.
;;        "["

;;        '(:eval (propertize "%m" 'face 'font-lock-string-face
;;                            'help-echo buffer-file-coding-system))
;;        "] "

;;        " "
;;        "[" ;; insert vs overwrite mode, input-method in a tooltip

;;        ;; is this buffer read-only?
;;        '(:eval (when buffer-read-only
;;                  (concat ","  (propertize "RO"
;;                                           'face 'font-lock-type-face
;;                                           'help-echo "Buffer is read-only"))))
;;        "] "

;;        " --"
;;        ;; i don't want to see minor-modes; but if you want, uncomment this:
;;        minor-mode-alist  ;; list of minor modes
;;        "%-" ;; fill with '-'
;;        ))
;; ======================================
(provide 'init-modeline)
;;; init-modeline.el ends here
