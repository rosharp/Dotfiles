;; Define the init file
(setq custom-file (expand-file-name "config.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Set default font
(set-frame-font "Iosevka NF-14" nil t)

;; Remove startup message and enable the bell
(setq inhibit-startup-message t
      visible-bell t)

;; Wrap text
(global-visual-line-mode t)

;; Show line numbers
(global-display-line-numbers-mode t)

;; Disable scroll bar
(scroll-bar-mode -1)

;; Recent & history
(recentf-mode 1)
(setq history-length 25)
(savehist-mode 1)

;; Save place in files
(save-place-mode 1)

;; Revert file changes 
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

;; Keyboard-centric user interface
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Move customization variables
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)