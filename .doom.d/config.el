;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Vitaly Bekshnev"
      user-mail-address "vy.bekshnev@gmail.com")

;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program "firefox")
;; (setq browse-url-browser-function 'browse-url-firefox)

(setq
 browse-url-browser-function 'eww-browse-url ; Use eww as the default browser
 shr-use-fonts  nil                          ; No special fonts
 shr-use-colors nil                          ; No colours
 shr-indentation 2                           ; Left-side margin
 shr-width 70                                ; Fold text to 70 columns
 eww-search-prefix "https://html.duckduckgo.com/?q=")
;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "InconsolataLGC Nerd Font Mono" :size 15)
      doom-big-font (font-spec :family "InconsolataLGC Nerd Font Mono" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;; opacity
(doom/set-frame-opacity 85)

;; Org-bullets
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Dashboard image
(setq fancy-splash-image "/home/rosharp/.doom.d/splashes/emacs/emacs-gnu-logo.png")

;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org-roam")
(setq org-agenda-files '("~/org-roam/daily"))

(add-to-list 'display-buffer-alist
             '("\\*org-roam\\*"
               (display-buffer-in-side-window)
               (side . right)
               (window-width . 0.4)
               (window-height . fit-window-to-buffer)))


(after! org-roam
    :ensure t
    :init
    (setq org-roam-v2-ack t)
    :custom
    (setq org-roam-directory "~/org-roam"
          org-roam-complete-everywhere t
          org-hide-emphasis-markers t)
    (setq org-roam-capture-templates
        '(
            ("d" "Default" plain
             (file "~/org-roam/Templates/ManualTemplate.org")
            :target (file+head "Misc/%<%Y%m%d%H%M%S>-${slug}.org"
                               "#+title: ${title}\n#+filetags: Fleeting Misc %^{Tags}") :unnarrowed t)
            ("m" "Manual" plain
             (file "~/org-roam/Templates/ManualTemplate.org")
            :target (file+head "Manual/%<%Y%m%d%H%M%S>-${slug}.org"
                               "#+title: ${title}\n#+filetags: Fleeting Manual %^{Tags}") :unnarrowed t)
            ("g" "GNU/Linux" plain
             (file "~/org-roam/Templates/LinuxTemplate.org")
            :target (file+head "Linux/%<%Y%m%d%H%M%S>-${slug}.org"
                               "#+title: ${title}\n#+filetags: Fleeting Linux %^{Tags}") :unnarrowed t)
            ("s" "Software engineering" plain
             (file "~/org-roam/Templates/SoftEngTemplate.org")
            :target (file+head "Softeng/%<%Y%m%d%H%M%S>-${slug}.org"
                               "#+title: ${title}\n#+filetags: Fleeting SoftEng %^{Tags}") :unnarrowed t)
            ("t" "Testing" plain
             (file "~/org-roam/Templates/TestingTemplate.org")
            :target (file+head "Testing/%<%Y%m%d%H%M%S>-${slug}.org"
                               "#+title: ${title}\n#+filetags: Fleeting Testing %^{Tags}") :unnarrowed t)
            ;; ("d" "DevOps" plain
            ;; "* Category\n- Class: [[roam:DevOps]] \n- Topic: %?\n\n* Reference: \n\n"
            ;; :target (file+head "DevOps/%<%Y%m%d%H%M%S>-${slug}.org"
            ;;                    "#+title: ${title}\n#+filetags: DevOps Fleeting %^{Tags}") :unnarrowed t)
            ("l" "Lesson" plain
             (file "~/org-roam/Templates/LessonTemplate.org")
            :target (file+head "Tutor/%<%Y%m%d%H%M%S>-${slug}.org"
                               "#+title: ${title}\n#+filetags: Fleeting Lesson %^{Tags}") :unnarrowed t)
            ;; ("m" "Meeting" plain
            ;; "* Category\n- Class: [[roam:Meeting]] \n- Topic: %?\n\n"
            ;; :target (file+head "class/meeting/%<%Y%m%d%H%M%S>-${slug}.org"
            ;;                    "#+title: ${title}\n#+filetags: Meeting") :unnarrowed t)
            ("p" "Project" plain
            "* Goals\n\n%?\n\n\* Tasks\n\n\** TODO Add Initial tasks\n\n* Dates\n\n"
            :if-new (file+head "Project/%<%Y%m%d%H%M%S>-${slug}.org"
                               "#+title: ${title}\n#+filetags: Fleeting Project %^{Tags}") :unnarrowed t)
            ("b" "Book Notes" plain
             (file "~/org-roam/Templates/BookNoteTemplate.org")
            :if-new (file+head "Books/%<%Y%m%d%H%M%S>-${slug}.org"
                               "#+title: ${title}\n#+filetags: Fleeting Book Notes %^{Tags}") :unnarrowed t)

        )
    )
    :config
    (org-roam-db-autosync-enable)
)

;; Ranger
;; (ranger-override-dired-mode t)
;; (setq ranger-hide-cursor nil)
;; (setq ranger-cleanup-on-disable t)
;; (setq ranger-preview-file t)
;; (setq ranger-dont-show-binary t)
;; (setq ranger-excluded-extensions '("mkv" "iso" "mp4"))
;; (setq ranger-max-preview-size 10)

;; Forge
(setq auth-sources '("~/.authinfo.gpg"))

;; Github-Review
(setq github-review-view-comments-in-code-lines t)

;; org-alert
(setq alert-default-style 'libnotify)
(setq org-alert-interval 300
      org-alert-notify-cutoff 10
      org-alert-notify-after-event-cutoff 10)

;; org-ui
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; mu4e headers
(setq mu4e-headers-buffer-name "*mu4e-headers*")

;; elfeed
(global-set-key (kbd "C-x w") 'elfeed)
(add-hook! 'elfeed-search-mode-hook #'elfeed-update)
(setq elfeed-feeds
      '("http://nullprogram.com/feed/"
        "https://planet.emacslife.com/atom.xml"
        "https://lukesmith.xyz/index.xml"
        "https://reddit.com/r/linux.rss"
        "https://lobste.rs/rss"
        "https://news.ycombinator.com/rss"
        "https://lwn.net/headlines/rss"
        "https://youtube.com/feeds/videos.xml?channel_id=UCFBjsYvwX7kWUjQoW7GcJ5A"
        "https://youtube.com/feeds/videos.xml?channel_id=UC7yZ6keOGsvERMp2HaEbbXQ"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCVls1GmFKf6WlTraIb_IaJg"
        "https://youtube.com/feeds/videos.xml?channel_id=UCFq12kPZg4wTNPO7V_g3B-A"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCCU0HzTA9ddqOgtuV-TJ9yw"
        ))
(setf url-queue-timeout 30)



;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
