;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Vitaly Bekshnev"
      user-mail-address "vy.bekshnev@gmail.com")

(setq browse-url-browser-function 'browse-url-default-browser)

;; show scheduled date in org-agenda
(setq org-columns-default-format
      "%FILE %TODO %25ITEM %3PRIORITY %SCHEDULED %DEADLINE %TAGS")

;; enable agenda columns initially
;; (setq org-agenda-view-columns-initially t)

;;(setq
;;  browse-url-browser-function 'eww-browse-url ; Use eww as the default browser
;;  shr-use-fonts  nil                          ; No special fonts
;;  shr-use-colors nil                          ; No colours
;;  shr-indentation 2                           ; Left-side margin
;;  shr-width 70                                ; Fold text to 70 columns
;;  eww-search-prefix "https://html.duckduckgo.com/?q=")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;

(setq doom-font (font-spec :family "Iosevka NF" :size 15)
      doom-variable-pitch-font (font-spec :family "Iosevka NF" :size 15)
      doom-big-font (font-spec :family "Iosevka NF" :size 18))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(add-hook! 'org-mode-hook #'mixed-pitch-mode)
(add-hook! 'org-mode-hook #'solaire-mode)
(setq mixed-pitch-variable-pitch-cursor nil)

  ;; Increase line spacing
  (setq-default line-spacing 6)

;; opacity
(doom/set-frame-opacity 100)

;; Org-bullets
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; markdown faces
(custom-set-faces!
'(markdown-header-delimiter-face :foreground "#616161" :height 0.9)
'(markdown-header-face-1 :height 1.8 :foreground "#A3BE8C" :weight extra-bold :inherit markdown-header-face)
'(markdown-header-face-2 :height 1.4 :foreground "#EBCB8B" :weight extra-bold :inherit markdown-header-face)
'(markdown-header-face-3 :height 1.2 :foreground "#D08770" :weight extra-bold :inherit markdown-header-face)
'(markdown-header-face-4 :height 1.15 :foreground "#BF616A" :weight bold :inherit markdown-header-face)
'(markdown-header-face-5 :height 1.1 :foreground "#b48ead" :weight bold :inherit markdown-header-face)
'(markdown-header-face-6 :height 1.05 :foreground "#5e81ac" :weight semi-bold :inherit markdown-header-face))

;; hide markup & show when editing
(defvar nb/current-line '(0 . 0)
   "(start . end) of current line in current buffer")
 (make-variable-buffer-local 'nb/current-line)

 (defun nb/unhide-current-line (limit)
   "Font-lock function"
   (let ((start (max (point) (car nb/current-line)))
         (end (min limit (cdr nb/current-line))))
     (when (< start end)
       (remove-text-properties start end
                       '(invisible t display "" composition ""))
       (goto-char limit)
       t)))


;;(defun nb/refontify-on-linemove ()
;;   "Post-command-hook"
;;   (let* ((start (line-beginning-position))
;;          (end (line-beginning-position 2))
;;          (needs-update (not (equal start (car nb/current-line)))))
;;     (setq nb/current-line (cons start end))
;;     (when needs-update
;;       (font-lock-fontify-block 3))))
;;
;; (defun nb/markdown-unhighlight ()
;;   "Enable markdown concealling"
;;   (interactive)
;;   (markdown-toggle-markup-hiding 'toggle)
;;   (font-lock-add-keywords nil '((nb/unhide-current-line)) t)
;;   (add-hook 'post-command-hook #'nb/refontify-on-linemove nil t))
;;
;; (add-hook 'markdown-mode-hook #'nb/markdown-unhighlight)

;; Dashboard image
(setq fancy-splash-image "/home/rosharp/.doom.d/splashes/emacs/emacs-gnu-logo.png")

;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

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

;; disable completion in org
(defun zz/adjust-org-company-backends ()
  (remove-hook 'after-change-major-mode-hook '+company-init-backends-h)
  (setq-local company-backends nil))
(add-hook! org-mode (zz/adjust-org-company-backends))

;; visual line in org
(add-hook! org-mode :append
           #'visual-line-mode
           #'variable-pitch-mode)

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
             (file "~/org-roam/Templates/DefaultTemplate.org")
            :target (file+head "Misc/%<%Y%m%d%H%M%S>-${slug}.org"
                               "#+title: ${title}\n#+filetags: Fleeting Misc %^{Tags}") :unnarrowed t)
            ("g" "GNU/Linux" plain
             (file "~/org-roam/Templates/LinuxTemplate.org")
            :target (file+head "Linux/%<%Y%m%d%H%M%S>-${slug}.org"
                               "#+title: ${title}\n#+filetags: Fleeting Linux %^{Tags}") :unnarrowed t)
            ("s" "Software engineering" plain
             (file "~/org-roam/Templates/SoftEngTemplate.org")
            :target (file+head "Softeng/%<%Y%m%d%H%M%S>-${slug}.org"
                               "#+title: ${title}\n#+filetags: Fleeting SoftEng %^{Tags}") :unnarrowed t)
            ("n" "Networking" plain
             (file "~/org-roam/Templates/NetworkingTemplate.org")
            :target (file+head "Networking/%<%Y%m%d%H%M%S>-${slug}.org"
                               "#+title: ${title}\n#+filetags: Fleeting Networking %^{Tags}") :unnarrowed t)
            ("t" "Testing" plain
             (file "~/org-roam/Templates/TestingTemplate.org")
            :target (file+head "Testing/%<%Y%m%d%H%M%S>-${slug}.org"
                               "#+title: ${title}\n#+filetags: Fleeting Testing %^{Tags}") :unnarrowed t)
            ("d" "DevOps" plain
            "* Category\n- Class: [[roam:DevOps]] \n- Topic: %?\n\n* Reference: \n\n"
            :target (file+head "DevOps/%<%Y%m%d%H%M%S>-${slug}.org"
                               "#+title: ${title}\n#+filetags: DevOps Fleeting %^{Tags}") :unnarrowed t)
            ("p" "Presentation" plain
             (file "~/org-roam/Templates/PresentationTemplate.org")
            :target (file+head "Presentation/%<%Y%m%d%H%M%S>-${slug}.org"
                               "#+title: ${title}\n#+filetags: Fleeting Presentation %^{Tags}") :unnarrowed t)

        )
    )
    :config
    (org-roam-db-autosync-enable)
)

;; org-babel-execute ts
;;(require 'ob-js)
;;
;;(defun org-babel-execute:typescript (body params)
;;  (let ((org-babel-js-cmd "npx ts-node < "))
;;    (org-babel-execute:js body params)))

;; mu4e
(use-package mu4e
  :ensure nil
  :load-path "/usr/share/emacs/site-lisp/elpa-src/mu4e-1.8.7/"
  ;; :defer 20 ; Wait until 20 seconds after startup
  :config

  ;; This is set to 't' to avoid mail syncing issues when using mbsync
  (setq mu4e-change-filenames-when-moving t)

  ;; Refresh mail using isync every 10 minutes
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-root-maildir "~/Mail")

  (setq mu4e-drafts-folder "/[Gmail]/Drafts")
  (setq mu4e-sent-folder   "/[Gmail]/Sent Mail")
  (setq mu4e-refile-folder "/[Gmail]/All Mail")
  (setq mu4e-trash-folder  "/[Gmail]/Trash")

(setq mu4e-maildir-shortcuts
    '((:maildir "/Inbox"             :key ?i)
      (:maildir "/[Gmail]/Sent Mail" :key ?s)
      (:maildir "/[Gmail]/Trash"     :key ?t)
      (:maildir "/[Gmail]/Drafts"    :key ?d)
      (:maildir "/[Gmail]/All Mail"  :key ?a))))

;; circe - irc
(map! "C-c i"   #'circe)
(setq circe-network-options
     '(("Libera Chat"
        :tls t
        :nick "ro_sharp"
        :sasl-username "ro_sharp"
        :sasl-password "ahugun45"
        :channels ("#linux")
        )))
;; hide join messages
(setq circe-reduce-lurker-spam t)
;; align messages
(setq circe-format-say "{nick:-16s} {body}")

;; emms
(global-set-key (kbd "C-c e") 'emms-smart-browse)
;; notifications in KDE
(when (and window-system (executable-find "kdialog"))
  (setq emms-player-next-function
        (lambda ()
          (emms-next-noerror)
          (call-process "kdialog" nil nil nil "--title" "Emacs - EMMS"
                        "--passivepopup" (emms-show) "5"))))
;; history
  (setq-default emms-source-file-default-directory "/home/rosharp/Music")

;; org-pomodoro
(global-set-key (kbd "C-c o") 'org-pomodoro)

;; Forge
(setq auth-sources '("~/.authinfo.gpg"))

;; Github-Review
(setq github-review-view-comments-in-code-lines t)

;; org-ui
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; elfeed
(global-set-key (kbd "C-x w") 'elfeed)
;;(add-hook! 'elfeed-search-mode-hook #'elfeed-update)
;;(setq elfeed-add-feed
;;      '(
;;        ("https://news.livedoor.com/topics/rss/top.xml" japan)
;;        ("https://seance.ru/rss/" journal culture)
;;        ("https://samkriss.substack.com/feed" essays culture)
;;        ;;("https://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml" nyt)
;;        ("http://nullprogram.com/feed/" blog)
;;        ("https://rubenerd.com/feed/" blog)
;;        ("https://vkc.sh/feed/" blog)
;;        ("https://yakovfain.com/feed/" blog tech programming)
;;        ("https://iximiuz.com/feed.rss" blog)
;;        ("https://planet.emacslife.com/atom.xml" emacs)
;;        ("https://lukesmith.xyz/index.xml" blog)
;;        ;;("https://reddit.com/r/linux.rss" reddit)
;;        ("https://reddit.com/r/emacs.rss" reddit)
;;        ("https://reddit.com/r/org-mode.rss" reddit)
;;        ("https://lobste.rs/rss" lobster)
;;        ("https://news.ycombinator.com/rss" hn)
;;        ("https://www.redhat.com/sysadmin/rss.xml" redhat)
;;        ("https://lwn.net/headlines/rss")
;;        ("https://youtube.com/feeds/videos.xml?channel_id=UCFBjsYvwX7kWUjQoW7GcJ5A" youtube)
;;        ("https://youtube.com/feeds/videos.xml?channel_id=UC7yZ6keOGsvERMp2HaEbbXQ" youtube)
;;        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCVls1GmFKf6WlTraIb_IaJg" youtube)
;;        ("https://youtube.com/feeds/videos.xml?channel_id=UCFq12kPZg4wTNPO7V_g3B-A" youtube)
;;        ("https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA" youtube)
;;        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCCU0HzTA9ddqOgtuV-TJ9yw" youtube)
;;
;;        ("http://asert.arbornetworks.com/feed/" security)
;;        ("http://feeds.feedburner.com/feedburner/Talos?format=xml" security)
;;        ("http://feeds.trendmicro.com/Anti-MalwareBlog/" security)
;;        ("http://researchcenter.paloaltonetworks.com/unit42/feed/" security)
;;        ("https://www.proofpoint.com/rss.xml" security)
;;        ("https://www.bellingcat.com/feed/" security)
;;        ("https://nomasters.io/index.xml" blog tech)
;;        ("http://www.reddit.com/r/ReverseEngineering/.rss" security reddit)
;;        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCWZ3HFiJkxG1K8C4HVnyBvQ" youtube) ;; Vic Berger
;;        ("https://www.youtube.com/feeds/videos.xml?channel_id=UC--DwaiMV-jtO-6EvmKOnqg" youtube) ;; OA Labs
;;        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCbpMy0Fg74eXXkvxJrtEn3w" youtube) ;; Bon Apetit
;;        ("https://www.youtube.com/feeds/videos.xml?channel_id=UC5fdssPqmmGhkhsJi4VcckA" youtube) ;; Innuendo Studios
;;        ("https://usesthis.com/feed.atom")
;;        ("https://greenbay.craigslist.org/search/sss?format=rss&query=accordion&sort=rel" hunt)
;;        ("http://rss.acast.com/nature" podcast) ;; Nature
;;        ("http://feeds.feedburner.com/birdnote/OYfP" podcast) ;; Bird Note
;;        ("https://www.kcrw.com/culture/shows/nocturne/rss.xml" podcast) ;; Nocturne
;;        ("http://feeds.wnyc.org/onthemedia" podcast) ;; On The Media
;;        ("https://www.npr.org/rss/podcast.php?id=510289" podcast) ;; Planet Money
;;        ("https://www.ftc.gov/feeds/press-release-consumer-protection.xml" gov first ftc)
;;        ("https://api2.fcc.gov/edocs/public/api/v1/rss/" gov first fcc)
;;        ("https://api2.fcc.gov/edocs/public/api/v1/rss/docTypes/Cit" gov first fcc)
;;        ("http://licensing.fcc.gov/myibfs/yesterdaysFilingsFeed.do" gov first fcc)
;;        ("http://licensing.fcc.gov/myibfs/yesterdaysActionsFeed.do" gov first fcc)
;;        ))
;;(setf url-queue-timeout 30)

;; calibre
(global-set-key (kbd "C-x c") 'calibredb)

;; pdf-tools
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-source-correlate-start-server t)
(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)
(pdf-tools-install)

;; eslint
(setq lsp-eslint-server-command
   '("node"
     "/home/rosharp/.vscode/extensions/dbaeumer.vscode-eslint-2.0.11/server/out/eslintServer.js"
     "--stdio"))
