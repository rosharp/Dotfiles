;; keybindings
(global-set-key (kbd "C-c t") 'vterm)
(global-set-key (kbd "C-x t") 'vtermtoggle)
(global-set-key (kbd "C-c r") 'recentf-open-files)
(global-set-key (kbd "C-x p") 'treemacs)

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

;; Configure the Modus Themes' appearance
(setq modus-themes-mode-line '(accented borderless)
      modus-themes-bold-constructs t
      modus-themes-italic-constructs t
      modus-themes-fringes 'subtle
      modus-themes-tabs-accented t
      modus-themes-paren-match '(bold intense)
      modus-themes-prompts '(bold intense)
      modus-themes-completions 'opinionated
      modus-themes-org-blocks 'tinted-background
      modus-themes-scale-headings t
      modus-themes-region '(bg-only)
      modus-themes-headings
      '((1 . (rainbow overline background 1.4))
        (2 . (rainbow background 1.3))
        (3 . (rainbow bold 1.2))
        (t . (semilight 1.1))))

;; Load the dark theme by default
(load-theme 'modus-vivendi t)
