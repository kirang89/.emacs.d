
;; org mode
(require 'org)

;; (defface org-block-begin-line
;;   '((t (:underline "#8b5a2b" :foreground "#8b7355" :background "#8b7355")))
;;   "Face used for the line delimiting the begin of source blocks.")

;; (defface org-block-background
;;   '((t (:background "#545454")))
;;   "Face used for the source block background.")

;; (defface org-block-end-line
;;   '((t (:overline "#8b5a2b" :foreground "#8b7355" :background "#8b7355")))
;;   "Face used for the line delimiting the end of source blocks.")


;; (defface org-block-begin-line
;;   '((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF")))
;;   "Face used for the line delimiting the begin of source blocks.")

;; (defface org-block-background
;;   '((t (:background "#FFFFEA")))
;;   "Face used for the source block background.")

;; (defface org-block-end-line
;;   '((t (:overline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF")))
;;   "Face used for the line delimiting the end of source blocks.")

;; Indent for clarity
(setq org-startup-indented t)
(setq org-indent-mode t)

;; load org-mode markdown export
(eval-after-load "org"
  '(require 'ox-md nil t))

(setq org-directory "~/Box Sync/org-notes")

;; Make code pretty
(setq org-src-fontify-natively t)

;; Spellcheck my org mode files.
(add-hook 'org-mode-hook 'flyspell-mode)

;; Prefer UTF-8
(setq org-export-coding-system 'utf-8)

;; Preserve the indentation inside of source blocks
(setq org-src-preserve-indentation t)

;; Retrieve agenda from this directory
(setq org-agenda-files '("~/Box Sync/org-notes/agenda.org"))

;; Week starts on Monday
(setq org-agenda-start-on-weekday 0)

(defun org-archive-tasks ()
  "Archive DONE tasks in org-mode."
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

;; Remove html postamble
(setq org-html-postamble nil)

;; Add to the exported html's header
(setq org-html-head-extra "
   <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,400italic,700italic&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
   <link href='http://fonts.googleapis.com/css?family=Source+Code+Pro:400,700' rel='stylesheet' type='text/css'>
   <style type='text/css'>
      body {
         font-family: 'Source Sans Pro', sans-serif;
         padding-left: '60px';
         padding-right: '60px';
      }
      pre, code {
         font-family: 'Source Code Pro', monospace;
      }
   </style>")


;; Activate babel support for specified languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (clojure . t)
   (sh . t)))

(setq org-babel-clojure-backend 'cider)
(require 'cider)

;; don't run stuff automatically on export
(setq org-export-babel-evaluate nil)

;; Use unicode chars instead of regular bullets
(require 'org-bullets)
(add-hook 'org-mode-hook
	  (lambda ()
        (org-bullets-mode 1)
        (local-set-key (kbd "C-x p") 'org-cliplink)))


(global-set-key (kbd "C-c C-a") 'org-agenda)
(global-set-key (kbd "C-x c") 'org-capture)

;; The directory where images should be downloaded to, when dragged into
;; an org buffer
(setq-default org-download-image-dir "~/Box Sync/org-notes/resources")


(setq org-default-notes-file (concat org-directory "/scratch1.txt"))

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
        ))

(provide 'init-org)
;;; init-org ends here
