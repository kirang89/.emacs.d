
;; org mode
(require 'org)

(defface org-block-begin-line
  '((t (:underline "#8b5a2b" :foreground "#8b7355" :background "#8b7355")))
  "Face used for the line delimiting the begin of source blocks.")

(defface org-block-background
  '((t (:background "#545454")))
  "Face used for the source block background.")

(defface org-block-end-line
  '((t (:overline "#8b5a2b" :foreground "#8b7355" :background "#8b7355")))
  "Face used for the line delimiting the end of source blocks.")

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
   (scheme . t)
   (sh . t)))

;; Use unicode chars instead of regular bullets
(require 'org-bullets)
(add-hook 'org-mode-hook
	  (lambda () (org-bullets-mode 1)))


(global-set-key (kbd "C-c C-a") 'org-agenda)

(provide 'init-org)
;;; init-org ends here
