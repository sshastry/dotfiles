
;; ~/.emacs.d/elpa$ ls -1
;; archives/
;; cyberpunk-theme-20151115.2035/
;; elscreen-20151025.1800/
;; evil-20151128.1102/
;; evil-tabs-20150127.1346/
;; gnupg/
;; goto-chg-20131228.659/
;; grandshell-theme-readme.txt
;; init-loader-20141030.2333/
;; linum-relative-20151205.1756/
;; molokai-theme-20151016.845/
;; monokai-theme-20151210.307/
;; undo-tree-20140509.522/

(setq inhibit-splash-screen t
      initial-scratch-message nil)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq make-backup-files nil)

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(setq tab-width 2
      indent-tabs-mode nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq column-number-mode t)

;; ??? conflicts with other modes?
;; (require 'auto-complete-config)
;; (ac-config-default)
;; and other goodies at http://aaronbedra.com/emacs.d/

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))
;; http://ergoemacs.org/emacs/emacs_package_system.html

;; :list-packages to install from melpa

(require 'evil)
(evil-mode 1)
(global-evil-tabs-mode t)

;; (global-linum-mode 1)
;; (setq linum-format "%d ")


;; (load-theme 'molokai t)
;; (load-theme 'monokai t)
(load-theme 'cyberpunk t)

(define-key global-map (kbd "RET") 'newline-and-indent) ;; set autoindent

(setq-default indent-tabs-mode nil) ;; set expandtab
(setq tab-width 2)
(setq c-basic-offset 2)
(setq cperl-indent-level 2)
;; to get rid of tabs: select a region and then do :untabify or m-x untabify

(global-hl-line-mode 1)
(load "~/.emacs-include") ;; includes slightly modified versions of vline.el and col-highlight.el

;; (vline-global-mode 1)
;; (setq col-highlight-vline-face-flag t)
;; (defface vline '((t (:background "SlateGray3"))) "foo" :group 'vline)

(column-highlight-mode 1)

(linum-relative-global-mode 1)
(setq linum-relative-format " %3s ")
(setq linum-relative-current-symbol "")

;; date
;; http://stackoverflow.com/questions/251908/how-can-i-insert-current-date-and-time-into-a-file-using-emacs
(defvar current-date-format "%Y-%m-%d")
(defvar current-date-day-format "%Y-%m-%d-%a")

(defun insert-current-date ()
  (interactive)
  (insert (format-time-string current-date-format (current-time)))
  )

(defun insert-current-date-day ()
  (interactive)
  (insert (format-time-string current-date-day-format (current-time)))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evil mappings

(define-key evil-normal-state-map "S" 'save-buffer)
;; (define-key evil-normal-state-map "-" 'kill-whole-line)
(define-key evil-normal-state-map "-" "dd")
;; (define-key evil-normal-state-map "H" 'elscreen-previous)
;; (define-key evil-normal-state-map "L" 'elscreen-next)
(define-key evil-normal-state-map "H" "gT")
(define-key evil-normal-state-map "L" "gt")
(define-key evil-normal-state-map "Q" 'insert-current-date-day)

; make , a Prefix Key so as Key Lookup does not end on the , input alone
(define-key evil-normal-state-map "," nil)
(define-key evil-normal-state-map ",1" "1gt")
(define-key evil-normal-state-map ",2" "2gt")
(define-key evil-normal-state-map ",3" "3gt")
(define-key evil-normal-state-map ",4" "4gt")
(define-key evil-normal-state-map ",5" "5gt")
(define-key evil-normal-state-map ",6" "6gt")
(define-key evil-normal-state-map ",7" "7gt")
(define-key evil-normal-state-map ",8" "8gt")
(define-key evil-normal-state-map ",9" "9gt")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


