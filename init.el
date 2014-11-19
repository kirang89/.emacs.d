
;; language
(setq current-language-environment "English")

(add-to-list 'load-path "~/.emacs.d/kiran/")

(require 'init-looks)
(require 'init-kbd)
(require 'init-packages)
(require 'init-python)
(require 'init-markdown)
(require 'init-org)
(require 'init-yasnippet)
(require 'init-shell)
(require 'efuns)
(require 'init-mu4e)
(require 'init-news)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; do not make backup files
(setq make-backup-files nil)

;; autocomplete
(require 'auto-complete-config)
(ac-config-default)

;; Enable ido (Interactively Do Things) mode
(require 'ido)
(ido-mode t)

;; ido vertical mode
(require 'ido-vertical-mode)
(ido-vertical-mode 1)

; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode t)

;; powerline
(require 'powerline)
;;(powerline-default-theme)
(powerline-center-theme)

; require final newlines in files when they are saved
(setq require-final-newline t)

;; use shift to move around windows
(windmove-default-keybindings 'shift)

;; turn beep off
(setq visible-bell nil)

;disable backup
(setq backup-inhibited t)

;; auto fill for text mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; turn auto-save off
(setq-default auto-save-default -1)

;; don't show trailing whitespace
(setq-default show-trailing-whitespace nil)

; indents 4 chars
(setq c-basic-offset 4)
(setq standard-indent 4)

; and 4 char wide for TAB
(setq tab-width 4)

;; use spaces instead of tabs
(setq indent-tabs-mode nil)

;; set unique names for two similar buffers
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; update the buffuer if a file has change on disk
(global-auto-revert-mode)

;; trailing whitespace on file save
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; Create intermediate directories
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
                  (make-directory dir t))))))

;; ace-jump
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c a") 'ace-jump-mode)

; toggle frame split
(defun toggle-frame-split ()
  "If the frame is split vertically, split it horizontally or vice versa.
Assumes that the frame is only split into two."
  (interactive)
  (unless (= (length (window-list)) 2) (error "Can only toggle a frame split in two"))
  (let ((split-vertically-p (window-combined-p)))
    (delete-window) ; closes current window
    (if split-vertically-p
        (split-window-horizontally)
      (split-window-vertically)) ; gives us a split with the other window twice
    (switch-to-buffer nil))) ; restore the original window in this part of the frame

(global-set-key (kbd "C-x |") 'toggle-frame-split)

;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)

;; autopair
(require 'autopair)
(autopair-global-mode)

;; font
;;(set-face-font 'default "Consolas-13.0:antialias=subpixel")

;; Maximum Colors
(setq font-lock-maximum-decoration t)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-;") 'er/expand-region)

;; multiple cursors!
;; To quit mc mode hit C-g or RET
;; TO insert newline hit C-j
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; git-awesome-mode
(require 'magit)

;; remote-editing ftw!
(require 'tramp)
(setq tramp-default-method "scp")

;; move buffers around
(require 'buffer-move)
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector ["#454545" "#cd7542" "#6aaf50" "#baba36" "#5180b3" "#ab75c3" "#bdbc61" "#bdbdb3"])
 '(ansi-term-color-vector [unspecified "#14191f" "#d15120" "#81af34" "#deae3e" "#7e9fc9" "#a878b5" "#7e9fc9" "#dcdddd"])
 '(background-color "#002b36")
 '(background-mode dark)
 '(compilation-message-face (quote default))
 '(completion-prompt-speed-threshold 3600)
 '(cursor-color "#839496")
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes (quote ("3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "e6d83e70d2955e374e821e6785cd661ec363091edf56a463d0018dc49fbc92dd" "5ea20171762b3f9682fbf507ee4b4018ce7b6cc65415fa99799a125f112b2cdb" "0744f61189c62ed6d1f8fa69f6883d5772fe8577310b09e623c62c040f208cd4" "53e29ea3d0251198924328fd943d6ead860e9f47af8d22f0b764d11168455a8e" "57f8801351e8b7677923c9fe547f7e19f38c99b80d68c34da6fa9b94dc6d3297" "ad9fc392386f4859d28fe4ef3803585b51557838dbc072762117adad37e83585" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "f0a99f53cbf7b004ba0c1760aa14fd70f2eabafe4e62a2b3cf5cabae8203113b" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "1a85b8ade3d7cf76897b338ff3b20409cb5a5fbed4e45c6f38c98eee7b025ad4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "bf5c528840f163f77a831a2b070310c6be15cc0dda546601edaf8a7156af7306" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "8f7e1668dd3a097964e6016c26d36822ab2e48fc3e9a3a2e2634224a5ca728c8" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "a233249cc6f90098e13e555f5f5bf6f8461563a8043c7502fb0474be02affeea" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "42ac06835f95bc0a734c21c61aeca4286ddd881793364b4e9bc2e7bb8b6cf848" "1e194b1010c026b1401146e24a85e4b7c545276845fc38b8c4b371c8338172ad" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "5d9351cd410bff7119978f8e69e4315fd1339aa7b3af6d398c5ca6fac7fd53c7" default)))
 '(fci-rule-character-color "#192028")
 '(fci-rule-color "#d6d6d6")
 '(foreground-color "#839496")
 '(fullscreen-mode nil)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors (quote (("#49483E" . 0) ("#67930F" . 20) ("#349B8D" . 30) ("#21889B" . 50) ("#968B26" . 60) ("#A45E0A" . 70) ("#A41F99" . 85) ("#49483E" . 100))))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(magit-use-overlays nil)
 '(markdown-command "/usr/local/bin/pandoc")
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(show-trailing-whitespace nil)
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(syslog-debug-face (quote ((t :background unspecified :foreground "#A1EFE4" :weight bold))))
 '(syslog-error-face (quote ((t :background unspecified :foreground "#F92672" :weight bold))))
 '(syslog-hour-face (quote ((t :background unspecified :foreground "#A6E22E"))))
 '(syslog-info-face (quote ((t :background unspecified :foreground "#66D9EF" :weight bold))))
 '(syslog-ip-face (quote ((t :background unspecified :foreground "#E6DB74"))))
 '(syslog-su-face (quote ((t :background unspecified :foreground "#FD5FF0"))))
 '(syslog-warn-face (quote ((t :background unspecified :foreground "#FD971F" :weight bold))))
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#c82829") (40 . "#f5871f") (60 . "#eab700") (80 . "#718c00") (100 . "#3e999f") (120 . "#4271ae") (140 . "#8959a8") (160 . "#c82829") (180 . "#f5871f") (200 . "#eab700") (220 . "#718c00") (240 . "#3e999f") (260 . "#4271ae") (280 . "#8959a8") (300 . "#c82829") (320 . "#f5871f") (340 . "#eab700") (360 . "#718c00"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list (quote (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Start emacs server
(server-start)

(provide `.emacs)
;;; .emacs ends here
