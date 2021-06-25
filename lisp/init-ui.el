;;----------------------------------------------------------------------------
;; UI setting
;;----------------------------------------------------------------------------
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(setq indicate-empty-lines t)
(setq show-trailing-whitespace t)
(show-paren-mode t)
(tool-bar-mode -1)
(set-scroll-bar-mode nil)
(menu-bar-mode -1)
(column-number-mode t)
(blink-cursor-mode -1)
(setq visible-cursor nil)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Set default font
(cond
 ((string-equal system-type "gnu/linux")
  (set-face-attribute 'default nil
                      :family "Sarasa Mono SC"
                      :height 135
                      :weight 'normal
                      :width 'normal))
 ((string-equal system-type "darwin")
  (set-face-attribute 'default nil
                      :family "SF Mono"
                      :height 160
                      :weight 'normal
                      :width 'normal))
 ((string-equal system-type "windows-nt")
  (set-face-attribute 'default nil
                      :family "Microsoft Yahei Mono"
                      :height 135
                      :weight 'normal
                      :width 'normal))
 )

(use-package modus-themes
  :pin melpa
  :ensure t
  :init
  (modus-themes-load-themes)
  :config
  (setq modus-themes-slanted-constructs t
        modus-themes-bold-constructs t
        modus-themes-no-mixed-fonts t
        modus-themes-subtle-line-numbers nil
        modus-themes-success-deuteranopia t
        modus-themes-inhibit-reload nil

        ;; {nil,'subtle,'intense}
        modus-themes-fringes nil

        ;; Options for `modus-themes-lang-checkers': nil,
        ;; 'straight-underline, 'subtle-foreground,
        ;; 'subtle-foreground-straight-underline, 'intense-foreground,
        ;; 'intense-foreground-straight-underline, 'colored-background
        modus-themes-lang-checkers nil

        ;; modus-themes-mode-line '(3d accented)
        ;; modus-themes-mode-line '(accented borderless 3d)
        modus-themes-mode-line '(borderless 3d accented)

        ;; Options for `modus-themes-syntax': nil, 'faint,
        ;; 'yellow-comments, 'green-strings,
        ;; 'yellow-comments-green-strings, 'alt-syntax,
        ;; 'alt-syntax-yellow-comments, 'faint-yellow-comments
        modus-themes-syntax nil

        ;; Options for `modus-themes-hl-line': nil, 'intense-background,
        ;; 'accented-background, 'underline-neutral,
        ;; 'underline-accented, 'underline-only-neutral,
        ;; 'underline-only-accented
        modus-themes-hl-line 'intense-background

        ;; {nil,'subtle-bold,'intense,'intense-bold}
        modus-themes-paren-match 'subtle-bold

        ;; Options for `modus-themes-links': nil, 'faint,
        ;; 'neutral-underline, 'faint-neutral-underline, 'no-underline,
        ;; 'underline-only, 'neutral-underline-only
        modus-themes-links 'neutral-underline-only


        ;; Options for `modus-themes-prompts': nil, 'subtle-accented,
        ;; 'intense-accented, 'subtle-gray, 'intense-gray
        modus-themes-prompts nil

        modus-themes-completions 'moderate ; {nil,'moderate,'opinionated}

        ;; Options for `modus-themes-region': nil, 'no-extend, 'bg-only,
        ;; 'bg-only-no-extend, 'accent, 'accent-no-extend
        modus-themes-region 'bg-only

        modus-themes-diffs 'fg-only-deuteranopia

        modus-themes-org-blocks 'gray-background ; {nil,'gray-background,'tinted-background}

        modus-themes-headings ; this is an alist: read the manual or its doc string
        '((1 . line)
          (2 . rainbow-line-no-bold)
          (t . no-bold))

        modus-themes-variable-pitch-ui nil
        modus-themes-variable-pitch-headings nil
        modus-themes-scale-headings t
        modus-themes-scale-1 1.1
        modus-themes-scale-2 1.15
        modus-themes-scale-3 1.21
        modus-themes-scale-4 1.27
        modus-themes-scale-title 1.33)
  (modus-themes-load-operandi)
  )

(use-package doom-modeline
  :pin melpa
  :ensure t
  :config
  (set-face-foreground 'doom-modeline-buffer-modified "systemOrangeColorz")
  (set-face-foreground 'doom-modeline-buffer-major-mode "systemBrownColor")
  (set-face-foreground 'doom-modeline-buffer-minor-mode "systemBrownColor")
  (set-face-foreground 'doom-modeline-project-dir "systemBrownColor")
  (set-face-foreground 'doom-modeline-project-root-dir "systemBrownColor")
  (set-face-foreground 'doom-modeline-project-parent-dir "systemBrownColor")
  (set-face-foreground 'doom-modeline-project-dir "systemBrownColor") ;; project name
  (set-face-foreground 'doom-modeline-buffer-file "systemBrownColor")

  (setq doom-modeline-buffer-modification-icon nil)
  (setq doom-modeline-project-detection 'projectile)
  (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
  (setq doom-modeline-lsp t)
  (setq doom-modeline-modal-icon t)
  (setq doom-modeline-env-version t)
  (setq doom-modeline-window-width-limit fill-column)
  (setq doom-modeline-minor-modes nil)
  (setq doom-modeline-indent-info t)

  (doom-modeline-mode 1)
  )

(use-package rainbow-delimiters
  :pin melpa
  :ensure t
  :hook (prog-mode-hook . rainbow-delimiters-mode)
  )

(set-face-foreground 'line-number "darkgrey")

(use-package display-fill-column-indicator
  :pin manual
  :custom
  (display-fill-column-indicator-column 100)
  (display-fill-column-indicator-character ?\u2502)
  ;; :init
  ;; (global-display-fill-column-indicator-mode t)
  )

(use-package beacon
  :pin melpa
  :ensure t
  :init
  (setq beacon-color "sandybrown")
  :config
  (beacon-mode 1)
  )

(provide 'init-ui)
