(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))

;; (unless (and (file-exists-p (concat init-dir "elpa/archives/gnu"))
;;              (file-exists-p (concat init-dir "elpa/archives/melpa"))
;;              (file-exists-p (concat init-dir "elpa/archives/melpa-stable")))
;;   (package-refresh-contents))

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
