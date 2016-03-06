
;; IBuffer
(global-set-key (kbd "C-x C-b") #'ibuffer)

;; Gnus style grouping for ibuffer
;; Check http://www.emacswiki.org/emacs/IbufferMode
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("PYTHON" (or
                          (mode . python-mode)
                          (mode . elpy-mode)))
               ("CLOJURE" (or
                           (mode . clojure-mode)
                           (mode . cider-mode)
                           (mode . clojurec-mode)
                           (name . ".cljc$")
                           (name . "^\\*cider")
                           (name . "^\\*nrepl")))
               ("ORG" (or
                       (mode . org-mode)
                       (name . "^\\*Deft\\*$")))
               ("DIRED" (mode . dired-mode))
               ("SHELL" (mode . eshell-mode))
               ("MARKDOWN" (mode . markdown-mode))
               ("WEBDEV" (mode . web-mode))
               ("MAGIT" (or
                         (mode . magit-mode)
                         (name . "^\\*magit")))
               ("PLANNER" (or
                           (name . "^\\*Calendar\\*$")
                           (name . "^diary$")
                           (mode . muse-mode)))
               ("EMACS" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ("HELM" (or
                        (mode . helm-mode)
                        (name . "^\\*helm")))))))

(add-hook 'ibuffer-mode-hook
              (lambda ()
                (ibuffer-switch-to-saved-filter-groups "default")))

(provide 'init-ibuffer)
;;; init-ibuffer.el ends here
