
;; Read mail from emacs
(require 'mu4e)
(setq mu4e-maildir "~/.Mail"
      mu4e-drafts-folder "/[Gmail].Drafts"
      mu4e-sent-folder   "/[Gmail].Sent Mail"
      mu4e-attachment-dir "~/Downloads"
      mu4e-confirm-quit nil
      mu4e-headers-skip-duplicates t
      mu4e-headers-leave-behavior 'apply
      message-kill-buffer-on-exit t
      mu4e-sent-messages-behavior 'delete
      mu4e-get-mail-command "offlineimap"
      mu4e-show-images t
      mu4e-update-interval 600
)

;; shortcuts
(setq mu4e-maildir-shortcuts
    '( ("/INBOX"               . ?i)
       ("/[Gmail].Sent Mail"   . ?s)))

;; something about ourselves
(setq
   user-mail-address "kiran.daredevil@gmail.com"
   user-full-name  "Kiran Gangadharan"
   mu4e-compose-signature
    (concat
      "Cheers,\n"
      "Kiran Gangadharan\n"
      "http://kirang.in\n"))

;; configuration for sending mail
(setq message-send-mail-function 'smtpmail-send-it
     smtpmail-stream-type 'starttls
     smtpmail-default-smtp-server "smtp.gmail.com"
     smtpmail-smtp-server "smtp.gmail.com"
     smtpmail-smtp-service 587)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; convert html emails properly
;; Possible options:
;;   - html2text -utf8 -width 72
;;   - textutil -stdin -format html -convert txt -stdout
;;   - html2markdown | grep -v '&nbsp_place_holder;' (Requires html2text pypi)
;;   - w3m -dump -cols 80 -T text/html
;;   - view in browser (provided below)
;;   - shr html renderer mu4e-shr2text
(require 'mu4e-contrib)
(setq mu4e-html2text-command 'mu4e-shr2text)

;; spell check
(add-hook 'mu4e-compose-mode-hook
        (defun my-do-compose-stuff ()
           "My settings for message composition."
           (set-fill-column 72)
           (flyspell-mode)))

;; add option to view html message in a browser
;; `aV` in view to activate
(add-to-list 'mu4e-view-actions
  '("ViewInBrowser" . mu4e-action-view-in-browser) t)

(provide 'init-mu4e)
;;; init-mu4e.el ends here
