
;; Read mail from emacs
(require 'mu4e)
(require 'org-mu4e)

(setq mu4e-maildir "~/.Mail"
      mu4e-drafts-folder "/me@kirang.in/INBOX.Drafts"
      mu4e-sent-folder   "/me@kirang.in/INBOX.Sent Items"
      mu4e-attachment-dir "/me@kirang.in/Attachments"
      mu4e-confirm-quit nil
      mu4e-headers-skip-duplicates t
      mu4e-headers-leave-behavior 'apply
      message-kill-buffer-on-exit t
      mu4e-sent-messages-behavior 'delete
      mu4e-get-mail-command "offlineimap"
      mu4e-show-images t
      mu4e-update-interval 600
)

;; the headers to show in the headers list -- a pair of a field
;; and its width, with `nil' meaning 'unlimited'
;; (better only use that for the last field.
(setq mu4e-headers-fields
    '( (:date          .  10)    ;; alternatively, use :human-date
       (:from          .  20)
       (:subject       .  nil))) ;; alternatively, use :thread-subject

;; shortcuts
;; (setq mu4e-maildir-shortcuts
;;     '( ("/INBOX"               . ?i)
;;        ("/[Gmail].Sent Mail"   . ?s)))

;; something about ourselves
(setq
   user-mail-address "me@kirang.in"
   user-full-name  "Kiran Gangadharan"
   mu4e-reply-to-address "me@kirang.in"
   mu4e-compose-signature
    (concat
      "Cheers,\n"
      "Kiran Gangadharan\n"
      "http://kirang.in\n"))

;; configuration for sending mail
(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
     smtpmail-stream-type 'starttls
     smtpmail-default-smtp-server "mail.messagingengine.com"
     smtpmail-smtp-server "mail.messagingengine.com"
     smtpmail-smtp-service 465)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

;; show images
(setq mu4e-show-images t)
(setq mu4e-view-show-images t)
;;(setq mu4e-view-image-max-width 600)
;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; convert org mode to HTML automatically
(setq org-mu4e-convert-to-html t)

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

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

(defalias 'org-mail 'org-mu4e-compose-org-mode)

;; Resources
;; http://kirang.in/2014/11/13/emacs-as-email-client-with-offlineimap-and-mu4e-on-osx/
;; http://www.brool.com/index.php/using-mu4e
;; http://vxlabs.com/2015/01/28/sending-emails-with-math-and-source-code/
;; http://www.macs.hw.ac.uk/~rs46/posts/2014-01-13-mu4e-email-client.html
(provide 'init-mu4e)
;;; init-mu4e.el ends here
