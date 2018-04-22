;;; efuns.el --- Utility Functions
;;;
;;; Commentary:
;;; This file contains a list of useful functions
;;;
;;; Code:

(defun kg/rename-this-buffer-and-file ()
  "Rename current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (cond ((get-buffer new-name)
               (error "A buffer named '%s' already exists!" new-name))
              (t
               (rename-file filename new-name 1)
               (rename-buffer new-name)
               (set-visited-file-name new-name)
               (set-buffer-modified-p nil)
               (message "File '%s' successfully renamed to '%s'"
			name
			(file-name-nondirectory new-name))))))))


(defun kg/delete-this-buffer-and-file ()
  "Remove file connected to current buffer and kill buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))


;; Search for symbol at point
;; (define-key isearch-mode-map (kbd "C-d") 'kg/isearch-yank-symbol)


(defun kg/isearch-yank-symbol ()
  "Yank the symbol at point into the isearch minibuffer.

C-w does something similar in isearch, but it only looks for
the rest of the word. I want to look for the whole string. And
symbol, not word, as I need this for programming the most."
  (interactive)
  (isearch-yank-string
   (save-excursion
     (when (and (not isearch-forward)
                isearch-other-end)
       (goto-char isearch-other-end))
     (thing-at-point 'symbol))))

(defun kg/date-iso ()
  "Insert the current date, ISO format, eg. 2016-12-09."
  (interactive)
  (insert (format-time-string "%F")))

(defun kg/date-iso-with-time ()
  "Insert the current date, ISO format with time, eg. 2016-12-09T14:34:54+0100."
  (interactive)
  (insert (format-time-string "%FT%T%z")))

(defun kg/toggle-frame-split ()
  "If the frame is split vertically, split it horizontally or vice versa.
Assumes that the frame is only split into two."
  (interactive)
  (unless (= (length (window-list)) 2) (error "Can only toggle a frame split in two"))
  (let ((split-vertically-p (window-combined-p)))
    (delete-window)                     ; closes current window
    (if split-vertically-p
        (split-window-horizontally)
      (split-window-vertically))  ; gives us a split with the other window twice
    (switch-to-buffer nil))) ; restore the original window in this part of the frame


(defun kg/dired-open-file ()
  "In dired, open the file named on this line."
  (interactive)
  (let* ((file (dired-get-filename nil t)))
    (message "Opening %s..." file)
    (call-process "open" nil 0 nil file)
    (message "Opening %s done" file)))


;; (defun kg/csv-to-table (beg end)
;;   "Convert a csv file to an `org-mode' table.
;; Requires 'pcsv' package to be installed."
;;   (interactive "r")
;;   (require 'pcsv)
;;   (insert (yf/lisp-table-to-org-table (pcsv-parse-region beg end)))
;;   (delete-region beg end)
;;   (org-table-align))

;; (defun kg/toggle-line-spacing ()
;;   "Toggle line spacing between no extra space to extra half line height."
;;   (interactive)
;;   (if (eq line-spacing nil)
;;       (setq-default line-spacing 0.5) ; add 0.5 height between lines
;;     (setq-default line-spacing nil)))
                                        ; no extra heigh between lines

;; Source: http://www.emacswiki.org/emacs/DuplicateStartOfLineOrRegion
(defun kg/duplicate-start-of-line-or-region ()
  "Duplicate start of line or region."
  (interactive)
  (if mark-active
      (kg/duplicate-region)
    (kg/duplicate-start-of-line)))

(defun kg/duplicate-start-of-line ()
  "Duplicate start of line."
  (let ((text (buffer-substring (point)
                                (beginning-of-thing 'line))))
    (forward-line)
    (push-mark)
    (insert text)
    (open-line 1)))

(defun kg/duplicate-region ()
  "Duplicate start of region."
  (let* ((end (region-end))
         (text (buffer-substring (region-beginning)
                                 end)))
    (goto-char end)
    (insert text)
    (push-mark end)
    (setq deactivate-mark nil)
    (exchange-point-and-mark)))

(global-set-key [(meta shift down)] 'kg/duplicate-start-of-line-or-region)

(defun kg/quick-copy-line ()
  "Copy the whole line that point is on and move to the beginning of the next line.
Consecutive calls to this command append each line to the kill-ring."
      (interactive)
      (let ((beg (line-beginning-position 1))
            (end (line-beginning-position 2)))
        (if (eq last-command 'quick-copy-line)
            (kill-append (buffer-substring beg end) (< end beg))
          (kill-new (buffer-substring beg end))))
      (beginning-of-line 2))

(defun kg/beginning-of-line-dwim ()
  "Toggle between moving point to the first non-whitespace character, and the start of the line."
  (interactive)
  (let ((start-position (point)))
    ;; Move to the first non-whitespace character.
    (back-to-indentation)

    ;; If we haven't moved position, go to start of the line.
    (when (= (point) start-position)
      (move-beginning-of-line nil))))

(global-set-key (kbd "C-a") 'kg/beginning-of-line-dwim)

;; (defun kg/drag-n-drop (event)
;;   "Drag files onto org-mode and insert a link to them"
;;   (interactive "e")
;;   (goto-char (nth 1 (event-start event)))
;;   (x-focus-frame nil)
;;   (let* ((payload (car (last event)))
;;          (type (car payload))
;;          (fname (cadr payload))
;;          (img-regexp "\\(png\\|jp[e]?g\\)\\>"))
;;     (cond
;;      ;; insert image link
;;      ((and  (eq 'drag-n-drop (car event))
;;             (eq 'file type)
;;             (string-match img-regexp fname))
;;       (insert (format "[[%s]]" fname))
;;       (org-display-inline-images t t))
;;      ;; insert image link with caption
;;      ((and  (eq 'C-drag-n-drop (car event))
;;             (eq 'file type)
;;             (string-match img-regexp fname))
;;       (insert "#+ATTR_ORG: :width 300\n")
;;       (insert (concat  "#+CAPTION: " (read-input "Caption: ") "\n"))
;;       (insert (format "[[%s]]" fname))
;;       (org-display-inline-images t t))
;;      ;; C-drag-n-drop to open a file
;;      ((and  (eq 'C-drag-n-drop (car event))
;;             (eq 'file type))
;;       (find-file fname))
;;      ((and (eq 'M-drag-n-drop (car event))
;;            (eq 'file type))
;;       (insert (format "[[attachfile:%s]]" fname)))
;;      ;; regular drag and drop on file
;;      ((eq 'file type)
;;       (insert (format "[[%s]]\n" fname)))
;;      (t
;;       (error "I am not equipped for dnd on %s" payload)))))

;; (define-key org-mode-map (kbd "<drag-n-drop>") 'kg/drag-n-drop)
;; (define-key org-mode-map (kbd "<C-drag-n-drop>") 'kg/drag-n-drop)
;; (define-key org-mode-map (kbd "<M-drag-n-drop>") 'kg/drag-n-drop)

(defun kg/add-watchwords ()
  "Highlight FIXME, TODO, and NOCOMMIT in code TODO"
  (font-lock-add-keywords nil
                          '(("\\<\\(FIXME:?\\|TODO:?\\|NOCOMMIT:?\\)\\>"
                             1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook #'kg/add-watchwords)

(defun kg/narrow-to-region-indirect (start end)
  "Restrict editing to the current region, indirectly(in a new buffer).
Source: http://demonastery.org/2013/04/emacs-narrow-to-region-indirect/"
  (interactive "r")
  (deactivate-mark)
  (let ((buf (clone-indirect-buffer nil nil)))
    (with-current-buffer buf
      (narrow-to-region start end))
    (switch-to-buffer buf)))

;; (defun kg/iterm-here ()
;;   "Open current file location in iTerm."
;;   (interactive)
;;   (dired-smart-shell-command "open -a iTerm $PWD" nil nil))

(defun kg/reset-ui ()
  "Reset some UI components after changing a theme."
  (interactive)
  (fringe-mode 10)
  (kg/set-fringe-background)
  (setq linum-format "%5d ")
  ;; (kg/set-modeline-face)
  ;; (kg/reset-linum)
  )

;; (defun kg/lispy-parens ()
;;   "Setup parens display for Lisp modes."
;;   (interactive)
;;   (setq show-paren-delay 0)
;;   (setq show-paren-style 'parenthesis)
;;   (make-variable-buffer-local 'show-paren-mode)
;;   (show-paren-mode 1)
;;   (set-face-background 'show-paren-match-face (face-background 'default))
;;   (if (boundp 'font-lock-comment-face)
;;       (set-face-foreground 'show-paren-match-face
;;      			   (face-foreground 'font-lock-comment-face))
;;     (set-face-foreground 'show-paren-match-face
;;      			 (face-foreground 'default)))
;;   (set-face-attribute 'show-paren-match-face nil :weight 'extra-bold))


;; http://emacs.stackexchange.com/a/81
(defun kg/switch-to-scratch-and-back (arg)
  "Toggle between *scratch-MODE* buffer and the current buffer.

The mode is specified by ARG.  If a scratch buffer does not
exist, create it with the major mode set to that of the buffer
from where this function is called.

COMMAND -> Open/switch to a scratch buffer in the current buffer's major mode
C-0 COMMAND -> Open/switch to a scratch buffer in `fundamental-mode'
C-u COMMAND -> Open/switch to a scratch buffer in `org-mode'
C-u C-u COMMAND -> Open/switch to a scratch buffer in `emacs-elisp-mode'"
  (interactive "p")
  (if (and (= arg 1) ; no prefix
           (string-match-p "\\*scratch" (buffer-name)))
      (switch-to-buffer (other-buffer))
    (let ((mode-str (cl-case arg
                      (0  "fundamental-mode") ; C-0
                      (4  "org-mode") ; C-u
                      (16 "emacs-lisp-mode") ; C-u C-u
                      (t  (format "%s" major-mode))))) ; no prefix
      (switch-to-buffer (get-buffer-create
                         (concat "*scratch-" mode-str "*")))
      (funcall (intern mode-str)))))


(defun kg/newline-for-code ()
  "Insert a newline character, but from the end of the current line."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "M-RET") 'kg/newline-for-code)

(defun kg/file-reopen-as-root ()
  "Reopen current file as root."
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/sudo:root@localhost:"
             buffer-file-name))))

;; Allow repeated use of ← and → when using previous-buffer and next-buffer.
(defun me/switch-to-buffer-continue ()
  "Activate a sparse keymap:
  <left>   `previous-buffer'
  <right>  `next-buffer'"
  (set-transient-map
   (let ((map (make-sparse-keymap)))
     (define-key map (kbd "<left>") #'previous-buffer)
     (define-key map (kbd "<right>") #'next-buffer)
     map)))
(advice-add 'previous-buffer :after #'me/switch-to-buffer-continue)
(advice-add 'next-buffer :after #'me/switch-to-buffer-continue)

(provide 'init-efuns)
;;; init-efuns.el ends here.
