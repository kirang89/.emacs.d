
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

;; (when (not package-archive-contents)
;;   (package-refresh-contents))

(defvar required-packages
  '(ace-jump-mode
    ace-window
    ag
    autopair
    avy
    bash-completion
    company
    company-jedi
    company-quickhelp
    company-restclient
    company-web
    concurrent
    connection
    ctable
    deferred
    dictionary
    diminish
    dired-details
    discover-my-major
    elpy
    emmet-mode
    epc
    epl
    expand-region
    find-file-in-project
    flx
    flx-ido
    flycheck
    fullscreen-mode
    gh
    gist
    helm
    highlight-current-line
    ido-vertical-mode
    jedi-core
    json-reformat
    json-snatcher
    key-chord
    leuven-theme
    link
    magit
    magit-popup
    markdown-mode
    multiple-cursors
    org
    org-bullets
    pkg-info
    popup
    pos-tip
    powerline
    pydoc
    pyvenv
    restclient
    smartparens
    subatomic-theme
    sx
    ujelly-theme
    web-beautify
    web-completion-data
    web-mode
    websocket
    window-numbering
    writegood-mode
    yasnippet
    zenburn-theme)
  "Packages to be installed upon launch")

;; (dolist (package required-packages)
;;   (unless (package-installed-p package)
;;     (package-install package)))

(provide 'init-packages)
;;; init-packages.el ends here
