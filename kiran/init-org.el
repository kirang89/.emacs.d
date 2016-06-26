
;; org mode
(require 'org)

(setq org-directory "~/Box Sync/org-notes"
      org-default-notes-file (concat org-directory "/scratch1.txt")
      org-agenda-files '("~/Box Sync/org-notes/agenda.org")
      ;; Prefer UTF-8
      org-export-coding-system 'utf-8
      org-startup-indented t
      org-indent-mode t
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

;; The directory where images should be downloaded to, when dragged into
;; an org buffer
(setq-default org-download-image-dir "~/Box Sync/org-notes/resources")

(setq org-todo-keyword-faces
        '(("TODO" :foreground "red" :weight bold)
          ("DOING" :foreground "magenta" :weight bold)
          ("DONE" :foreground "green" :weight bold)))

;; Better bullets
(font-lock-add-keywords 'org-mode
                        '(("^ +\\([-*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; Capture templates
(setq org-capture-templates
      '(
        ("t" "Todo" entry
         (file+headline (concat org-directory "/agenda.org") "Personal")
         "*** TODO %?")

        ("m" "Todo" entry
         (file+headline (concat org-directory "/agenda.org") "Meetups")
         "*** TODO %?\n SCHEDULED: %^{SCHEDULED: }t")

        ("l" "Link" item
         (file+datetree (concat org-directory "/linklog.org")))

        ("v" "Video (Programming)" checkitem
         (file+headline (concat org-directory
                                "/programming_videos_watchlist.org")
                        "Programming Videos Watchlist"))
        ))

(global-set-key (kbd "C-c C-a") 'org-agenda)
(global-set-key (kbd "C-x c") 'org-capture)

;; load org-mode markdown export
(eval-after-load "org"
  '(require 'ox-md nil t))

;; Spellcheck my org mode files.
;;(add-hook 'org-mode-hook 'flyspell-mode)

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

;; Activate babel support for specified languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (clojure . t)
   (sh . t)))

(use-package ob-clojure
  :init
  (setq org-babel-clojure-backend 'cider))

;; don't run stuff automatically on export
;;(setq org-export-babel-evaluate nil)

;; Use unicode chars instead of regular bullets
(use-package org-bullets
  :ensure t
  :commands org-bullets-mode
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(add-hook 'org-mode-hook
	  (lambda () (local-set-key (kbd "C-x p") 'org-cliplink)))

;; Org latex configuration
(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; Deft configuration
(use-package deft
  :bind ("C-x C-g" . deft-find-file)
  :config
  (setq deft-extensions '("txt" "md" "org")
        deft-directory "~/Box Sync/org-notes/"
        deft-recursive t
        deft-use-filename-as-title t
        deft-strip-summary-regexp "\\*"
        deft-auto-save-interval 60))

;; (defface org-block-begin-line
;;   '((t (:underline "#8b5a2b" :foreground "#8b7355" :background "#8b7355")))
;;   "Face used for the line delimiting the begin of source blocks.")

;; (defface org-block-background
;;   '((t (:background "#545454")))
;;   "Face used for the source block background.")

;; (defface org-block-end-line
;;   '((t (:overline "#8b5a2b" :foreground "#8b7355" :background "#8b7355")))
;;   "Face used for the line delimiting the end of source blocks.")


;; Set the list of viewers for Mac OS X
;; The -b displayline option highlights the current line
;; The -g displayline option launches Skim in the background
;;
;; Tex->Pdf - C-c C-v
;; Pdf->Tex - Cmd-Shift-Click
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

(provide 'init-org)
;;; init-org ends here
