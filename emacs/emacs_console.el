
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
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background nil
:foreground nil :inverse-video nil :box nil
:strike-through nil :overline nil :underline nil
:slant normal :weight normal
:height 102 :width normal :foundry "unknown"
:family "DejaVu Sans Mono")))))
(blink-cursor-mode 0)
(delete-trailing-whitespace)
(mouse-wheel-mode t)
;; Enable backup files.
(setq make-backup-files t)
;; Enable versioning with default values
(setq version-control t)
;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.saves/"))))
(define-key global-map "\M-[1~" 'beginning-of-line)
(define-key global-map [select] 'end-of-line)
(setq delete-old-versions t)
