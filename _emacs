(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(completion-ignored-extensions (quote ("CVS/" ".o" "~" ".bin" ".lbin" ".fasl" ".ufsl" ".a" ".ln" ".blg" ".bbl" ".elc" ".lof" ".glo" ".idx" ".lot" ".dvi" ".fmt" ".tfm" ".pdf" ".class" ".fas" ".lib" ".x86f" ".sparcf" ".lo" ".la" ".toc" ".pyc" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs")))
 '(current-language-environment "utf-8")
 '(cvs-dired-use-hook (quote always))
 '(default-input-method "latin-1-prefix")
 '(delete-selection-mode nil nil (delsel))
 '(display-time-default-load-average nil)
 '(display-time-mail-file (quote none))
 '(ecb-auto-activate t)
 '(ecb-directories-menu-user-extension-function (quote ignore))
 '(ecb-display-image-icons-for-semantic-tags t)
 '(ecb-highlight-tag-with-point (quote highlight-scroll))
 '(ecb-history-item-name (quote buffer-name))
 '(ecb-history-menu-user-extension-function (quote ignore))
 '(ecb-kill-buffer-clears-history (quote auto))
 '(ecb-layout-name "leftmethods")
 '(ecb-layout-window-sizes (quote (("leftmethods" (0.7 . 1.0)))))
 '(ecb-method-non-semantic-face (quote ecb-default-general-face))
 '(ecb-methods-menu-user-extension-function (quote ignore))
 '(ecb-minor-mode-text "")
 '(ecb-non-semantic-exclude-modes (quote (sh-mode fundamental-mode text-mode LaTeX-mode)))
 '(ecb-options-version "2.32")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-process-non-semantic-files t)
 '(ecb-source-file-regexps (quote ((".*" ("\\(^\\(\\.\\|#\\)\\|\\(~$\\|\\.\\(pyc\\|elc\\|obj\\|o\\|class\\|lib\\|dll\\|a\\|so\\|cache\\)$\\)\\)") ("^\\.\\(emacs\\|gnus\\)$")))))
 '(ecb-source-path (quote ("~/devel" "/")))
 '(ecb-sources-menu-user-extension-function (quote ignore))
 '(ecb-sources-sort-method (quote extension))
 '(ecb-split-edit-window-after-start nil)
 '(ecb-tip-of-the-day nil)
 '(ecb-tree-do-not-leave-window-after-select (quote (ecb-methods-buffer-name)))
 '(ecb-tree-expand-symbol-before t)
 '(ecb-tree-image-icons-directories (quote ("/usr/share/emacs/site-lisp/ecb/ecb-images/default/height-17" (ecb-directories-buffer-name . "/usr/share/emacs/site-lisp/ecb/ecb-images/directories/height-17") (ecb-sources-buffer-name . "/usr/share/emacs/site-lisp/ecb/ecb-images/sources/height-14_to_21") (ecb-methods-buffer-name . "/usr/share/emacs/site-lisp/ecb/ecb-images/methods/height-14_to_21"))))
 '(ecb-use-speedbar-instead-native-tree-buffer nil)
 '(ecb-version-check t)
 '(ediff-prefer-iconified-control-frame t)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(erc-autojoin-channels-alist (quote (("sff.net" "#safespace" "#yuletide") ("freenode.net" "#python.de"))))
 '(erc-enable-logging nil)
 '(erc-max-buffer-size 15000)
 '(erc-nick (quote ("rebecca2525" "rebecca252" "rebecca25" "rebecca2")))
 '(erc-text-matched-hook (quote (erc-log-matches erc-beep-on-match)))
 '(global-font-lock-mode t nil (font-lock))
 '(inhibit-startup-screen t)
 '(openwith-associations (quote (("\\.pdf\\'" "xpdf" (file)))))
 '(revert-without-query (quote ("*.log")))
 '(save-place t nil (saveplace))
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t nil (paren))
 '(text-mode-hook (quote (turn-off-auto-fill text-mode-hook-identify)))
 '(transient-mark-mode t)
 '(ucc-flags "-v -c ~/.ucc/pref_vsgc_testgrid")
 '(user-mail-address "r.breu@fz-juelich.de"))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :family "DejaVu Sans Mono")))))


;; Load some own stuff:
;; Add path /home/rbreu/elisp for loading:
(add-to-list 'load-path "~/elisp")
(require 'rbutils)
(require 'fvwm-mode)
(require 'doc-mode)


(require 'groovy-mode)
(add-to-list 'auto-mode-alist '("\\.groovy$" . groovy-mode))

(require 'openwith)
(openwith-mode t)


(add-to-list
 'load-path
 "~/unicore/svn/unicore/ucc/trunk/src/main/extras/emacs-mode")

(require 'ucc-mode)
(add-to-list 'auto-mode-alist '("\\.u$" . ucc-mode))
(add-to-list 'auto-mode-alist '("\\.swf$" . (lambda ()
					      (xml-mode)
					      (ucc-mode t))))


;;General:


;;Emacs code browser

;;Give the methods buffer a buffer-menu like feeling
(add-hook 'ecb-methods-buffer-after-create-hook
	  '(lambda ()
	    (local-set-key (kbd "\C-x\C-r") 'ecb-rebuild-methods-buffer)
	    (local-set-key (kbd "f") 'my-ecb-select-tree-item)
	    (local-set-key (kbd "q") 'my-ecb-quit-window)
	    (local-set-key (kbd "p") 'my-ecb-prev-tree-item)
	    (local-set-key (kbd "n") 'my-ecb-next-tree-item)))

			   
;;(setq visible-bell nil)

;;(ecb-activate)
;;(ecb-toggle-ecb-windows nil)

;; Set the debug option to enable a backtrace when a problem occurs:
;;(setq debug-on-error t)

;;I want man to show me all manpages available for a specific topic:
(setq Man-switches "-a")

;;I want no toolbar:
(tool-bar-mode 0)
;;rather do this in .Xdefaults

;;I want mouse wheel scrolling:
(mouse-wheel-mode t)

;;I want all backupfiles (*~) stored in one directory:
(setq backup-directory-alist '(("." . "~/.emacs_backup")))

(setq save-place-limit 100)

;;I want all semantic files stored in one directory:
(setq semanticdb-default-save-directory "~/.emacs_semantic")

;;I want lines and columns displayed in the modeline:
(setq line-number-mode t)
(setq column-number-mode t)


(setq insert-time-format "%T")
(setq insert-date-format "%e.%m.%Y")

;;Appointments:
(setq appt-disp-window-function 'my-show-appt)
(setq appt-delete-window-function 'my-show-appt-kill) 
(setq appt-message-warning-time 10)
(setq appt-display-duration 10)
(setq appt-display-interval 3)
(setq appt-audible nil)

;; Calendar:
(setq display-time-24hr-format t)
(setq european-calendar-style t)
(setq calendar-longitude 6.4)
(setq calendar-latitude 50.9)
(setq calendar-location-name "Juelich, Germany")
(setq calendar-week-start-day 1)  ; Monday
(setq calendar-time-display-form
      '(24-hours ":" minutes (and time-zone (concat " (" time-zone ")"))))
(display-time)
(appt-activate 1)
;;(add-hook 'diary-hook 'appt-make-list)
;;(setq view-diary-entries-initially t)
;;(diary 0)
(calendar)
;;(other-window 1)

(require 'weekly-view)
(setq weekly-graph-day-end 2200)
;;(add-hook 'diary-display-hook 'fancy-diary-display-week-graph)

(require 'multi-term)
(multi-term-keystroke-setup)
(setq multi-term-program "/bin/bash")


;;Some global keybindings:
(define-key esc-map "n" 'goto-line)
(define-key ctl-x-map "\C-r" 'revert-buffer)
(define-key ctl-x-map "\C-b" 'buffer-menu)
(define-key ctl-x-map "\C-a" 'my-ecb-toggle-windows)
(define-key ctl-x-map "t" 'calendar)
(define-key global-map [C-down] 'View-scroll-line-forward)
(define-key global-map [C-up] 'View-scroll-line-backward)
(define-key global-map [f2] 'multi-term)
(define-key global-map [f3] 'multi-term-next)


		
(windmove-default-keybindings 'meta)

(require 'dired+) 
(toggle-dired-find-file-reuse-dir 1)
(setq dired-listing-switches "-ahlG")
(add-hook 'dired-mode-hook
	  '(lambda () (define-key dired-mode-map
			"\C-c\C-c" 'wdired-change-to-wdired-mode)))

;;reST
;;(add-hook 'text-mode-hook 'rst-text-mode-bindings)

;;(require 'emms-default)
;;          (emms-setup 'advanced "directory-1" "directory 2" ...)


;;latex-mode

;;RefTeX helps with labels, references etc.:
(setq latex-mode-hook 'turn-on-reftex)  

(add-hook 'latex-mode-hook
	  '(lambda () 
	     ;;I want " instead of '' :
	     (define-key latex-mode-map "\"" 'self-insert-command)))


;;c-mode/java-mode
(defun my-c-mode-common-hook ()
  (c-set-style "linux")
  ;;(c-set-offset 'case-label 4)
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil) ;;Don't use tabs
  (define-key c-mode-map "\C-c\t" 'indent-region)
  (define-key c-mode-map "\r" 'newline-and-indent))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
	  


;;Java_mode
;;Define some keybindings:
(add-hook 'java-mode-hook 
	  '(lambda () 
	     (define-key java-mode-map "\C-c\t" 'indent-region)
	     (define-key java-mode-map "\r" 'newline-and-indent)))


;;sgml-mode
(add-hook 'sgml-mode-hook 
	  '(lambda () 
	     (define-key sgml-mode-map "\C-c\C-p" 'insert-html-paragraph)))


;;emacs-lisp-mode

;;Define some keybindings:
(add-hook 'emacs-lisp-mode-hook 
	  '(lambda () 
	     (define-key emacs-lisp-mode-map "\r" 'newline-and-indent)))

(require 'go-write-mode)
(require 'wc-mode)

;;python

;;(require 'python-outline)

(add-hook 'python-mode-hook 
	  '(lambda () 
	     (define-key python-mode-map "\C-c\C-j" 'join-line)
	     (define-key python-mode-map "\r" 'newline-and-indent)
	     (define-key python-mode-map "\C-cc" 'py-comment-region)
	     (define-key python-mode-map "\C-cu" 'py-uncomment-region)))

;;Bicycle Repair Man
;;(pymacs-load "bikeemacs" "brm-")
;;(brm-init)


;; Ruby

(add-hook 'ruby-mode-hook 
	  '(lambda () 
	     (define-key ruby-mode-map "\r" 'newline-and-indent)))
	   

;; Cucumber


(add-to-list 'load-path "~/elisp/feature-mode")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; abbreviations
(setq abbrev-file-name "~/elisp/abbrevs.el")
(read-abbrev-file abbrev-file-name t)
(setq dabbrev-case-replace nil)  ; Preserve case when expanding
(setq abbrev-mode t)



(setq ispell-program-name "aspell") 
(setq ispell-dictionary "en_GB-ise-w_accents")


(setq browse-url-browser-function 'browse-url-epiphany)
(setq browse-url-epiphany-new-window-is-tab t)  

;;; Local Variables: 
;;; mode: emacs-lisp
;;; End:

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
