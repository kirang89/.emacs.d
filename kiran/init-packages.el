
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar required-packages
  '(ace-jump-mode ample-theme autopair bash-completion
		  cyberpunk-theme dictionary connection emmet-mode
		  expand-region flycheck fullscreen-mode highlight-current-line
		  ipython jedi auto-complete epc ctable concurrent leuven-theme link
		  magit git-rebase-mode git-commit-mode markdown-mode multiple-cursors
		  org pkg-info epl popup powerline python-environment deferred
		  python-mode tangotango-theme ujelly-theme yasnippet)
  "Packages to be installed upon launch")

(dolist (package required-packages)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'init-packages)
;;; init-packages.el ends here
