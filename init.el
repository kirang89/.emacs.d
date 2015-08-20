;; Author: Kiran Gangadharan

;; Record the start time
(setq *emacs-load-start* (current-time))

;; language
(setq current-language-environment "English")

;; Prefer unicode encoding everywhere
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; do not make backup files
(setq make-backup-files nil)
;; Don't litter fs with backup files
;;(setq backup-directory-alist '((".", "~/.saves")))

(add-to-list 'load-path "~/.emacs.d/kiran/")

(require 'init-looks)
(require 'init-kbd)
(require 'init-packages)
(require 'init-company)
(require 'init-python)
(require 'init-markdown)
(require 'init-org)
(require 'init-yasnippet)
(require 'init-shell)
(require 'efuns)
(require 'init-magit)
(require 'init-modeline)
;;(require 'init-mu4e)
(require 'init-news)
(require 'init-web)

;; autocomplete
(require 'auto-complete)
(global-auto-complete-mode -1)
;;(require 'auto-complete-config)
;;(ac-config-default)
;;(setq ac-ignore-case nil)
;;(add-to-list 'ac-modes 'python-mode)

;; Smart parenthesis
(require 'smartparens-config)
(smartparens-global-mode)

;; Enable ido (Interactively Do Things) mode
(require 'ido)
(ido-mode t)

;; ido vertical mode
(require 'ido-vertical-mode)
(ido-vertical-mode 1)

;; ido with fuzzy search
(require 'flx-ido)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(add-to-list 'ido-ignore-files "\\.pyc")
(add-to-list 'ido-ignore-files ".DS_STORE")
(setq ido-use-faces nil)
;(setq flx-ido-use-faces nil)


; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode t)

;; require final newlines in files when they are saved
(setq require-final-newline t)

;; use shift to move around windows
(windmove-default-keybindings 'shift)

;; turn beep off
(setq visible-bell nil)

;; disable backup
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

;; and 4 char wide for TAB
(setq tab-width 4)

;; use spaces instead of tabs
(setq indent-tabs-mode nil)

;; update the buffuer if a file has change on disk
(global-auto-revert-mode)

;; delete trailing whitespace on file save
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; Create intermediate directories
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
                  (make-directory dir t))))))

;; ace-jump aka avy
(require 'avy)
(define-key global-map (kbd "C-`") 'avy-goto-word-or-subword-1)

;; Move b/w windows ace-jump style
(require 'ace-window)
(define-key global-map (kbd "M-p") 'ace-window)

;; Toggle frame split (see efuns.el)
(global-set-key (kbd "C-x |") 'toggle-frame-split)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-;") 'er/expand-region)

;; remote-editing ftw!
(require 'tramp)
(setq tramp-default-method "scp")

;; move buffers around
(require 'buffer-move)
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; Run MIT Scheme with Emacs
;(require 'xscheme)
;(setenv "MITSCHEME_LIBRARY_PATH" "/usr/local/lib/mit-scheme-x86-64")

(add-to-list 'auto-mode-alist '("\\.pp\\'" . pascal-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

;;; Make files and folders in dired-mode neater
(require 'dired-details)
(dired-details-install)

;; nifty documentation at point for lisp files
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)

;; Requires aspell to be installed
;; Install on OSX by running `brew install aspell --with-lang-en`
(autoload 'flyspell-mode "flyspell" "Spell checker" t)
(setq-default ispell-program-name "aspell")

;; multiple cursors!
;; To quit mc mode hit C-g or RET
;; TO insert newline hit C-j
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Bind actions to repeated key presses!
(key-chord-mode t)
(key-chord-define-global "aa"
			 (lambda ()
			   (interactive)
			   (find-file "~/Box Sync/org-notes/agenda.org")))
(key-chord-define-global "bb" #'helm-mini)
(key-chord-define-global "ff" 'ido-find-file)
(key-chord-define-global "jj" 'avy-goto-word-or-subword-1)
(key-chord-define-global "yy"
			 (lambda ()
			   (interactive)
			   (find-file "~/.emacs.d/init.el")))

;; Clean view of major mode keybindings
(global-set-key (kbd "C-h C-m") 'discover-my-major)

;;; =====================================
;;; Experimental Stuff
;;; =====================================

;;(require 'cask)
;;(cask-initialize)

;; Keeps ~Cask~ file in sync with the packages
;; that you install/uninstall via ~M-x list-packages~
;; https://github.com/rdallasgray/pallet
;;(require 'pallet)

;; autopair
;;(require 'autopair)
;;(autopair-global-mode)

(require 'helm-config)
(helm-mode 1)
(setq helm-buffers-fuzzy-matching t)

;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(global-set-key (kbd "C-x b") #'helm-mini)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "M-y") #'helm-show-kill-ring)
;; (global-set-key (kbd "C-x C-b") #'helm-buffers-list)
;; (global-set-key (kbd "C-x C-f") #'helm-find-files)
;; (global-set-key (kbd "C-x C-r") #'helm-recentf)

;; Join current line to previous and fix whitespace at join
(global-set-key (kbd "M-j")
                (lambda () (interactive) (join-line -1)))

;; Always newline-and-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Default formatting style for C based modes
(setq c-default-style "java")
(setq-default c-basic-offset 2)

;;; =================================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(ansi-term-color-vector
   [unspecified "#14191f" "#d15120" "#81af34" "#deae3e" "#7e9fc9" "#a878b5" "#7e9fc9" "#dcdddd"] t)
 '(background-color "#002b36")
 '(background-mode dark)
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(completion-prompt-speed-threshold 3600)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-color "#839496")
 '(custom-enabled-themes (quote (subatomic)))
 '(custom-safe-themes
   (quote
    ("83e584d74b0faea99a414a06dae12f11cd3176fdd4eba6674422539951bcfaa8" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "cd032f7af4d0a6219bc9decab7fe557944449cb2252696acb69d013db8d3c697" "0ed983facae99849805b2f7be926561cb58474eb18e5296d9bb3ad7f9b088a5b" "7b7ef508f9241c01edaaff3e0d6f03588a6f4fddb1407a995a7a333b29e327b5" "18a33cdb764e4baf99b23dcd5abdbf1249670d412c6d3a8092ae1a7b211613d5" "ba9be9caf9aa91eb34cf11ad9e8c61e54db68d2d474f99a52ba7e87097fa27f5" "12722541c8998f056b761bf63a92216aaf4610e4eb1afe7991842a31fa28b6d8" "90d329edc17c6f4e43dbc67709067ccd6c0a3caa355f305de2041755986548f2" "c56d90af9285708041991bbc780a073182cbe91721de17c6e7a8aac1380336b3" "8f1cedf54f137f71382e3367e1843d10e173add99abe3a5f7d3285f5cc18f1a9" "f1af57ed9c239a5db90a312de03741e703f712355417662c18e3f66787f94cbe" "2a86b339554590eb681ecf866b64ce4814d58e6d093966b1bf5a184acf78874d" "8022cea21aa4daca569aee5c1b875fbb3f3248a5debc6fc8cf5833f2936fbb22" "95f954ce018bbff3107b357bd87d060db195a2d5c6b70411587223597fde171d" "33bb2c9b6e965f9c3366c57f8d08a94152954d4e2124dc621953f5a8d7e9ca41" "e3c90203acbde2cf8016c6ba3f9c5300c97ddc63fcb78d84ca0a144d402eedc6" "6ccab6e1692e9e5486239125a88c452d656636a9392e2ace204340dea3db62dc" "a0fdc9976885513b03b000b57ddde04621d94c3a08f3042d1f6e2dbc336d25c7" "f15a7ce08b9e13553c1f230678e9ceb5b372f8da26c9fb815eb20df3492253b7" "c537bf460334a1eca099e05a662699415f3971b438972bed499c5efeb821086b" "353861e69d6510a824905208f7290f90248f0b9354ee034fd4562b962790bdfc" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" "bc40f613df8e0d8f31c5eb3380b61f587e1b5bc439212e03d4ea44b26b4f408a" "49a981154962c8e21b9f38b64da9d531c456027c157d0fee0bfcfed3add1c631" "8abee8a14e028101f90a2d314f1b03bed1cde7fd3f1eb945ada6ffc15b1d7d65" "9cb6358979981949d1ae9da907a5d38fb6cde1776e8956a1db150925f2dad6c1" "34e7163479ef3669943b3b9b1fabe639d6e0a0453e0de79cea2c52cb520d3bc4" "51e228ffd6c4fff9b5168b31d5927c27734e82ec61f414970fc6bcce23bc140d" "1297a022df4228b81bc0436230f211bad168a117282c20ddcba2db8c6a200743" "31a01668c84d03862a970c471edbd377b2430868eccf5e8a9aec6831f1a0908d" "a1f3b7e4fcd298ff1c9d1370f023b5ae7c802cb7373bda9051be3f2a6328d71c" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "46c9b8430ff328f39420a02b510467877231100c622f5b07dc4c57b17d4e92b8" "2b1a0863f7226f9c7fe4a9755ba3bbcfcc18bcac86e5c6a3cf8acd51b26755bf" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "f5bd8485ec9ba65551bf9b9fcaa6af6bcbaebaa4591c0f30d3e512b1d77b3481" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "08efabe5a8f3827508634a3ceed33fa06b9daeef9c70a24218b70494acdf7855" "49eea2857afb24808915643b1b5bd093eefb35424c758f502e98a03d0d3df4b1" "aa0cff9f0399a01e35a884bebe67039e3f8890dbe69ebaaa6e8d307dce50dfcd" "e24180589c0267df991cf54bf1a795c07d00b24169206106624bb844292807b9" "4aafea32abe07a9658d20aadcae066e9c7a53f8e3dfbd18d8fa0b26c24f9082c" "1011be33e9843afd22d8d26b031fbbb59036b1ce537d0b250347c19e1bd959d0" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "e6d83e70d2955e374e821e6785cd661ec363091edf56a463d0018dc49fbc92dd" "5ea20171762b3f9682fbf507ee4b4018ce7b6cc65415fa99799a125f112b2cdb" "0744f61189c62ed6d1f8fa69f6883d5772fe8577310b09e623c62c040f208cd4" "53e29ea3d0251198924328fd943d6ead860e9f47af8d22f0b764d11168455a8e" "57f8801351e8b7677923c9fe547f7e19f38c99b80d68c34da6fa9b94dc6d3297" "ad9fc392386f4859d28fe4ef3803585b51557838dbc072762117adad37e83585" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "f0a99f53cbf7b004ba0c1760aa14fd70f2eabafe4e62a2b3cf5cabae8203113b" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "1a85b8ade3d7cf76897b338ff3b20409cb5a5fbed4e45c6f38c98eee7b025ad4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "bf5c528840f163f77a831a2b070310c6be15cc0dda546601edaf8a7156af7306" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "8f7e1668dd3a097964e6016c26d36822ab2e48fc3e9a3a2e2634224a5ca728c8" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "a233249cc6f90098e13e555f5f5bf6f8461563a8043c7502fb0474be02affeea" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "42ac06835f95bc0a734c21c61aeca4286ddd881793364b4e9bc2e7bb8b6cf848" "1e194b1010c026b1401146e24a85e4b7c545276845fc38b8c4b371c8338172ad" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "5d9351cd410bff7119978f8e69e4315fd1339aa7b3af6d398c5ca6fac7fd53c7" default)))
 '(dired-details-hidden-string "")
 '(display-time-mode nil)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults)))
 '(ensime-sem-high-faces
   (quote
    ((var :foreground "#9876aa" :underline
          (:style wave :color "yellow"))
     (val :foreground "#9876aa")
     (varField :slant italic)
     (valField :foreground "#9876aa" :slant italic)
     (functionCall :foreground "#a9b7c6")
     (operator :foreground "#cc7832")
     (param :foreground "#a9b7c6")
     (class :foreground "#4e807d")
     (trait :foreground "#4e807d" :slant italic)
     (object :foreground "#6897bb" :slant italic)
     (package :foreground "#cc7832"))))
 '(fci-rule-character-color "#192028")
 '(fci-rule-color "#192028")
 '(foreground-color "#839496")
 '(fringe-mode 4 nil (fringe))
 '(fullscreen-mode nil)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(line-number-mode nil)
 '(linum-format " %5i ")
 '(magit-use-overlays nil)
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style (quote chamfer))
 '(markdown-command "/usr/local/bin/pandoc")
 '(menu-bar-mode nil)
 '(org-hide-leading-stars t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail org-w3m org-mac-link)))
 '(org-todo-keywords (quote ((sequence "TODO" "DONE"))))
 '(pallet-mode t)
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(quack-programs
   (quote
    ("petite" "bigloo" "csi" "csi -hygienic" "gosh" "gracket" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "mzscheme" "racket" "racket -il typed/racket" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi")))
 '(quack-remap-find-file-bindings-p nil)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(show-trailing-whitespace nil)
 '(size-indication-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(syslog-debug-face
   (quote
    ((t :background unspecified :foreground "#A1EFE4" :weight bold))))
 '(syslog-error-face
   (quote
    ((t :background unspecified :foreground "#F92672" :weight bold))))
 '(syslog-hour-face (quote ((t :background unspecified :foreground "#A6E22E"))))
 '(syslog-info-face
   (quote
    ((t :background unspecified :foreground "#66D9EF" :weight bold))))
 '(syslog-ip-face (quote ((t :background unspecified :foreground "#E6DB74"))))
 '(syslog-su-face (quote ((t :background unspecified :foreground "#FD5FF0"))))
 '(syslog-warn-face
   (quote
    ((t :background unspecified :foreground "#FD971F" :weight bold))))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
 '(when (not (facep (aref ansi-term-color-vector 0)))))

;; Start emacs server
(server-start)

;; Write out a message indicating how long it took to process the init script
(message "init.el loaded in %ds"
         (destructuring-bind (hi lo ms ps) (current-time)
           (- (+ hi lo)
              (+ (first *emacs-load-start*)
                 (second *emacs-load-start*)))))

(provide `.emacs)

;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "#232533" :foreground "#ffffff" :box (:line-width 1 :style released-button) :weight normal))))
 '(org-block ((t (:inherit shadow))))
 '(org-block-background ((t (:background "#2e3043"))))
 '(org-code ((t (:inherit shadow))))
 '(org-done ((t (:foreground "#a9dc69" :slant italic :weight bold))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.4))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-link ((t (:inherit link :weight normal))))
 '(org-list-dt ((t (:weight normal))))
 '(org-tag ((t (:weight light))))
 '(org-todo ((t (:foreground "#feccd4" :weight bold)))))
