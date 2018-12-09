(use-package org
  :ensure t
  :init
  (setq org-directory "~/Box Sync/org-notes"
        org-default-notes-file (concat org-directory "/notes.txt")
        org-agenda-files '("~/Box Sync/org-notes/agenda.org")
        ;; Prefer UTF-8
        org-export-coding-system 'utf-8
        org-startup-indented t
        ;; Make code pretty
        org-src-fontify-natively t
        ;; change behavior of TAB as per the appropriate major mode
        org-src-tab-acts-natively t
        ;; Preserve the indentation inside of source blocks
        org-src-preserve-indentation t
        ;; week starts on Monday
        org-agenda-start-on-weekday 0
        ;; Org-html export configuration
        org-html-doctype "html5"
        org-html-html5-fancy t
        org-html-postamble nil
        ;; Use speed commands like `t` to change todo status
        org-use-speed-commands t
        ;; Syntax highlighting for org-export
        org-latex-listings 'minted
        org-hide-emphasis-markers t)

  ;; (setq ;;org-ellipsis " ▼ "
  ;;       org-ellipsis "..."
  ;;       )

  ;; The directory where images should be downloaded to, when dragged into
  ;; an org buffer
  (setq-default org-download-image-dir "~/Box Sync/org-notes/resources")

  (setq org-todo-keyword-faces
        '(("TODO" :foreground "blue" :weight bold)
          ("DOING" :foreground "magenta" :weight bold)
          ("HOLD" :foreground "red" :weight bold)
          ("DONE" :foreground "green" :weight bold)))

  ;; Better bullets
  (font-lock-add-keywords 'org-mode
                          '(("^ +\\([-*]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  (setq TeX-view-program-list
        '(("Preview.app" "open -a Preview.app %o")
          ("Skim" "open -a Skim.app %o")
          ("displayline" "/Applications/Skim.app/Contents/SharedSupport/displayline -b %n %o %b")
          ("open" "open %o"))
        ;; Select the viewers for each file type.
        TeX-view-program-selection
        '((output-dvi "open")
          (output-pdf "displayline")
          (output-html "open")))

  (setq org-babel-sh-command "bash")

  :config
  (global-set-key (kbd "C-x c") 'org-capture)
  (add-hook 'org-mode-hook
            (lambda ()
              (setq org-indent-mode t)
              (local-set-key (kbd "C-x p")
                             'org-mac-firefox-insert-frontmost-url)))

  ;; Use unicode chars instead of regular bullets
  (use-package org-bullets
    :ensure t
    :commands org-bullets-mode
    :config
    (add-hook 'org-mode-hook
              (lambda ()
                (org-bullets-mode 1))))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((clojure . t)))

  ;; (use-package ox-latex
  ;;   :defer t
  ;;   :init
  ;;   (add-to-list 'org-latex-packages-alist '("" "minted"))
  ;;   (setq org-latex-pdf-process
  ;;         '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
  ;;           "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
  ;;           "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")))
  )

;; ===========

(defun kg/grep-notes ()
  "Search my notes."
  (interactive)
  (let ((search-string (read-string "Search String: ")))
    (ag search-string "~/Box Sync/org-notes")))

(setq org-capture-templates
      '(("w" "Work" entry
         (file+headline (concat org-directory "/agenda.org") "Work")
         "** TODO %?")))

;; (global-set-key (kbd "C-c C-a") 'org-agenda)

(defun org-archive-tasks ()
  "Archive DONE tasks in org-mode."
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

(defun get-string-from-file (filePath)
  "Return filePath's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

(defvar html-export-headers "
   <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,400italic,700italic&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
   <link href='http://fonts.googleapis.com/css?family=Source+Code+Pro:400,700' rel='stylesheet' type='text/css'>")

(defvar html-export-styles nil
  (concat "<style type='text/css'>"
          (get-string-from-file "~/.emacs.d/kiran/htmlexport.css")
          "</style>"))

;; value of a defvar does not override by default
(setq html-export-styles (concat "<style type='text/css'>"
          (get-string-from-file "~/.emacs.d/kiran/htmlexport.css")
          "</style>"))

;; Add to the exported html's header
(setq org-html-head-extra (concat html-export-headers
                                  html-export-styles))

;; don't run stuff automatically on export
;;(setq org-export-babel-evaluate nil)

(provide 'init-org)
;;; init-org ends here
