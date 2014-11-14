
(defface org-block-begin-line
  '((t (:underline "#8b5a2b" :foreground "#8b7355" :background "#8b7355")))
  "Face used for the line delimiting the begin of source blocks.")

(defface org-block-background
  '((t (:background "#545454")))
  "Face used for the source block background.")

(defface org-block-end-line
  '((t (:overline "#8b5a2b" :foreground "#8b7355" :background "#8b7355")))
  "Face used for the line delimiting the end of source blocks.")

;; org mode
(require 'org)
;; load org-mode markdown export
(eval-after-load "org"
  '(require 'ox-md nil t))
(setq org-directory "~/Box Sync/org-notes")
(setq org-src-fontify-natively t)

(provide 'init-org)
;;; init-org ends here
