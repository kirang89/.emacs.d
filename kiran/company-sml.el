;;; company-sml --- Emacs completion support for SML using company-mode

;; Author: Noah Peart <noah.v.peart@gmail.com>
;; URL: https://github.com/nverno/company-sml
;; Copyright (C) 2016, Noah Peart, all rights reserved.
;; Created: 28 July 2016
;; Package-Requires ((emacs "24.1") (cl-lib "0.5") (company "0.8.0"))

;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary:

;; Emacs completion support for SML using company mode

;; Install: 

;; You will need to install `company-mode' and to add this file to your `load-path', ie

;; ```lisp
;; (add-to-list 'load-path path/to/this/file)
;; ```

;; Then either create autoloads/compile with make file and load
;; the autoloads or just add to your .emacs

;; ```lisp
;; (require 'company-sml)
;; (add-hook 'company-sml 'company-sml-setup)
;; ```

;; Example:

;; ![example](example.png)

;;; Code:

(require 'company)
(require 'company-keywords)

(defgroup company-sml nil
  "Completion for SML scripting files."
  :group 'languages
  :group 'company
  :prefix "company-sml-")

;; ------------------------------------------------------------
;;* User Variables

;; doesn't seem to been any completion-at-point support
;; for `sml-mode', so most backends won't be useful
(defcustom company-sml-backends
  '((company-keywords company-dabbrev-code) company-dabbrev)
  "Default company completion backends for SML. If non-nil, setup
these in `company-sml-setup' as local `company-backends' for sml files."
  :group 'company-sml
  :type `(choice nil sexp))

;; ------------------------------------------------------------
;;* Keywords
(defvar company-keywords-alist)
(defvar company-sml-keywords
  '(
    "abstraction" "abstype" "and" "andalso" "as" "before" "case"
    "datatype" "div" "do" "else" "end" "eqtype" "exception" "false"
    "fn" "fun" "functor" "handle" "if" "in" "include" "infix" "infixr"
    "let" "local" "mod" "nonfix" "o" "of" "op" "open" "orelse" "overload"
    "raise" "rec" "sharing" "sig" "signature" "struct" "structure"
    "then" "true" "type" "use" "val" "withtype" "with" "where" "while"
    )
  "SML keywords taken from `sml-mode'.")

(defun company-sml-keywords-setup ()
  "Add SML keywords to `company-keywords-alist'."
  (setcdr
   (nthcdr (1- (length company-keywords-alist)) company-keywords-alist)
   `(,(append '(sml-mode) company-sml-keywords))))

;; ------------------------------------------------------------
;;* Setup

(defun company-sml-check (backend backends)
  (cond
   ((atom backends) (eq backend backends))
   ((listp (car backends)) (or (company-sml-check backend (car backends))
                          (company-sml-check backend (cdr backends))))
   (t (or (eq backend (car backends))
          (company-sml-check backend (cdr backends))))))

;;;###autoload
(defun company-sml-setup ()
  "Set up company backends for `sml-mode'. Suitable for a hook."
  (when (and (not (assq 'sml-mode company-keywords-alist))
             (company-sml-check 'company-keywords
                                company-sml-backends))
    (company-sml-keywords-setup))
  (when company-sml-backends
    (set (make-local-variable 'company-backends)
         company-sml-backends)))

(provide 'company-sml)

;;; company-sml.el ends here
