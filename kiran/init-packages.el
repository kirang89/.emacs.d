(require 'package)

;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(setq load-prefer-newer t
      ;; package--init-file-ensured t
      package-enable-at-startup nil)

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose t)
(setq-default use-package-always-ensure t)

(use-package paradox
  :ensure t
  :init
  (setq-default paradox-github-token t
                paradox-display-star-count nil
                paradox-automatically-star nil
                paradox-execute-asynchronously t))

(provide 'init-packages)
;;; init-packages.el ends here
