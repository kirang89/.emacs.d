(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))

;; (unless (and (file-exists-p (concat init-dir "elpa/archives/gnu"))
;;              (file-exists-p (concat init-dir "elpa/archives/melpa"))
;;              (file-exists-p (concat init-dir "elpa/archives/melpa-stable")))
;;   (package-refresh-contents))

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; (unless package-archive-contents
;;   (package-refresh-contents))

(require 'use-package)
(use-package paradox
  :init
  (setq-default paradox-github-token t
                paradox-execute-asynchronously t))

(provide 'init-packages)
;;; init-packages.el ends here
