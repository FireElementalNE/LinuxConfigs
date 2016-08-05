;;sudo mv color-theme-tangotango.el /usr/local/share/emacs/site-lisp/color-theme-tangotango.el
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 '(inhibit-startup-screen t)
 '(show-paren-mode t))

;;======== Font =================
;(set-default-font "Inconsolata")
(set-default-font "DejaVu Sans Mono")

;;========= Font Size ===========
(set-face-attribute 'default nil :height 120)

;; ======== CUA mode ===========
(when (display-graphic-p) ;; do not want in terminal mode
  (cua-mode t))

;;========= Disable Bell =========
(setq ring-bell-function 'ignore)

;; ======== tab width ===========

(setq tab-width 4)
(setq indent-tabs-mode nil)

;; ========== Color Theme =========

;; (load-theme 'tangotango t)

(load-theme 'badwolf t)

;; ========= Disable Toolbar ========
(tool-bar-mode -1)

;; ========= Disable Scrollbar ========
(toggle-scroll-bar -1)

;;========== Cursor Blinking =========
(blink-cursor-mode 0)

;; ========= Disable Menubar =========
;;(menu-bar-mode 0)

;; ==== Current Buffer Name in Title Bar ====
(setq frame-title-format "%b")

;; ========== Support Wheel Mouse Scrolling ==========
(mouse-wheel-mode t)

;; ========= Remove Trailing Whitespace ========
(delete-trailing-whitespace)

;; ========== Place Backup Files in Specific Directory ==========
;; Enable backup files.
(setq make-backup-files t)
;; Enable versioning with default values
(setq version-control t)
;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.saves/"))))

;; ===================== Parentheses Settings =====================
;;(setq show-paren-delay 0)           ; how long to wait?
;;(show-paren-mode t)                 ; turn paren-mode on
;;(setq show-paren-style 'expression) ; alternatives are 'parenthesis' and 'mixed'
;;(set-face-background 'show-paren-match-face "#66FF66")
;;(set-face-attribute 'show-paren-match-face nil
;;   :weight 'normal :underline nil :overline nil :slant 'normal)
;;(set-face-foreground 'show-paren-mismatch-face "red")
;;(set-face-attribute 'show-paren-mismatch-face nil
;;                    :weight 'bold :underline t :overline nil :slant 'normal)

;;================= Highlight current line ===============================

(when (display-graphic-p) ;; do not want in terminal mode
  (global-hl-line-mode +1))

;;================ Fix putty nonesense ===================================

(define-key global-map "\M-[1~" 'beginning-of-line)
(define-key global-map [select] 'end-of-line)

;;================= Google Seatch with C-c g =============================

(defun google ()
  "Google the selected region if any, display a query prompt otherwise."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
         (buffer-substring (region-beginning) (region-end))
       (read-string "Google: "))))))

(when (display-graphic-p) ;; do not want in terminal mode
  (global-set-key (kbd "C-c g") 'google))

;;====================== Terminal Buffer ==========================
(defun visit-term-buffer ()

  "Create or visit a terminal buffer."
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (ansi-term (getenv "SHELL")))
    (switch-to-buffer-other-window "*ansi-term*")))

(global-set-key (kbd "C-c t") 'visit-term-buffer)

(setq column-number-mode t)

;;=================== Python Tab Fixer ===========================

;(add-hook 'python-mode-hook
;	  (lambda()
;	    (setq indent-tabs-mode t)
;	    (setq tab-width 2)
;	    (setq python-indent 2)))

;;==================== show line numbers =========================

(when (display-graphic-p)
  (global-linum-mode 1))
