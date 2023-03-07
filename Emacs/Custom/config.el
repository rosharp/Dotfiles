;; keybindings
(global-set-key (kbd "C-c C-t") 'shell-pop)
(global-set-key (kbd "C-c r") 'recentf-open-files)
(global-set-key (kbd "C-c g") 'magit)
(global-set-key (kbd "C-c p") 'treemacs)

;; Set default font
(set-face-attribute 'default nil :family "Iosevka NF")
(set-face-attribute 'default nil :height (* 13 10))

;; fancy lambdas
(global-prettify-symbols-mode t)

;; Make TAB act as if it were issued in a buffer of the language’s major mode.
(setq org-src-tab-acts-natively t)

;; org
(setq-default org-enforce-todo-dependencies t)
(setq org-return-follows-link t)

(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

;; org-syntax highlighting
(setq org-src-fontify-natively t)
