;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;;(setq doom-font (font-spec :family "Hack" :size 16))
(setq doom-font (font-spec :family "Iosevka Term" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
;;
;; BLACK THEMES THAT I LIKED: doom-city-lights, doom-nord,
;; doom-palenight, doom-wilmersdorf, zenburn, plain-dark
;; WHITE THEMES THAT I LIKED: doom-nord-light, plain
(setq doom-theme 'doom-nord)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;

;; PROJECTS SETUP
(setq projectile-project-search-path '("~/code/"))
(setq display-line-numbers-type 'relative)

;; DEFT SETUP
(setq deft-directory "~/ROOT/documents/notes"
      deft-extensions '("org")
      deft-recursive t)

;; ORG OPTIONS
(with-eval-after-load 'org (progn (require 'ox)))
(after! org (plist-put org-format-latex-options :scale 2))

(setq org-startup-with-inline-images t)
(setq org-startup-with-latex-preview t)

;; ORG-ROAM SETUP
(setq org-roam-directory "~/ROOT/documents/roam")
(setq org-roam-capture-templates
      '(("d" "default" plain
         "%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
         :unnarrowed t)
        ("p" "project" plain
         (file "~/ROOT/documents/roam/templates/roam_project_template.org")
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Project")
         :unnarrowed t)
        ("b" "book notes" plain
         (file "~/ROOT/documents/roam/templates/roam_book_template.org")
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
         :unnarrowed t)
        ))

;; insert immediate for roam2
(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

;; agenda todos from certain nodes
(defun my/org-roam-filter-by-tag (tag-name)
  (lambda (node)
    (member tag-name (org-roam-node-tags node))))

(defun my/org-roam-list-notes-by-tag (tag-name)
  (mapcar #'org-roam-node-file
          (seq-filter
           (my/org-roam-filter-by-tag tag-name)
           (org-roam-node-list))))

(defun my/org-roam-refresh-agenda-list ()
  (interactive)
  (setq org-agenda-files (my/org-roam-list-notes-by-tag "Project")))

;; ORG-ROAM-UI SETUP
(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
    :after org-roam
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; LATEX SETUP
(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
             '("org-plain-latex"
               "\\documentclass{article}
           [NO-DEFAULT-PACKAGES]
           [PACKAGES]
           [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(setq org-latex-listings 'minted
    org-latex-packages-alist '(("newfloat" "minted"))
    org-latex-pdf-process
    '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
      "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))


(defun doom-dashboard-draw-ascii-emacs-banner-fn ()
  (let* ((banner
          '("                                    "
            "         .*@@*+++++++++*@@+.        "
            "       .*+:%.*+      .*+.@.+*.      "
            "     .*+  .%  .*+  .*+.  @  .+*.    "
            "   .*+    .%    .##*.    @    .+*.  "
            ".**.     :@   :*+:*+.  .@      .**."
            "@@*======+@===@*. :#@===@=======*@@"
            "@.+*.    .%   @.#%*:%   @     .*+ @"
            "@   +*. .*#@++@%+++@@=*@#+. :*+   @"
            "@     *%*  .%%@    :@##. .##*     @"
            "@   .*+.+*-#+-@+. .*@:**-*+.+*.   @"
            "@ .++.   :@===@=#@*+@===@    .++. @"
            "@**.     .%   @*+:**%   @      .**@"
            "+@*======+@===**. :#+==+@=======*@+"
            "  .+*.    .%    .##*     @     .*+. "
            "    .*+.  .%   .*+:*+.   @   .+*.   "
            "      .*+ .% .*+    .++. @ .++.     "
            "        .**@*+        .+*@*+.       "))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat
                 line (make-string (max 0 (- longest-line (length line)))
                                   32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-functions
      '(doom-dashboard-draw-ascii-emacs-banner-fn
        doom-dashboard-widget-shortmenu))

;; CUSTOM SHORTCUTS
(map! :leader
      :desc "Toggle writeroom-mode"
      "t W" #'writeroom-mode)
(map! :leader
      :desc "Show Org Roam UI"
      "n r G" #'org-roam-ui-mode)
(map! :leader
      :desc "Add org-roam alias to node"
      "n r A" #'org-roam-alias-add)
(map! :leader
      :desc "Toggle Org Inline Images"
      "O i" #'org-toggle-inline-images)
(map! :leader
      :desc "Toggle Org Latex Preview"
      "O l" #'org-latex-preview)
(map! :leader
      :desc "Org Roam Node Insert Immediate"
      "n r I" #'org-roam-node-insert-immediate)
