;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(javascript
     vimscript
     (rust :variables
           rust-format-on-save t)
     ;;crystal
     (haskell :variables haskell-enable-hindent t)
     semantic
     (c-c++ :variables c-c++-enable-clang-support t)
     html
     python
     chrome
     (scala :variables
            scala-auto-insert-asterisk-in-comments t
            scala-use-unicode-arrows t
            scala-auto-insert-asterisk-in-comments t)
     autohotkey
     kotlin
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t) ;; doesn't work with the mac port version of emacs.
     ;; better-defaults
     emacs-lisp
     (ibuffer :variables ibuffer-group-buffers-by 'modes)
     ;; games
     ;; colors
     ;; themes-megapack
     coq
     emoji
     (unicode-fonts :variables unicode-fonts-force-multi-color-on-mac t)
     git
     (java :variables java-backend 'ensime)
     markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     (syntax-checking :variables
                      syntax-checking-enable-tooltips t)
     (elm :variables elm-sort-imports-on-save t
          elm-format-on-save t)
     version-control
     osx
     racket
     clojure
     ;; (keyboard-layout :variables kl-layout 'dvorak-right-handed)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(typed-clojure-mode adaptive-wrap persp-projectile key-chord solarized-theme  color-theme-sanityinc-tomorrow doom-themes moe-theme zenburn-theme)
   ;; persp-projectile switch-window company-childframe 

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  ;; (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
  ;; (push '(helm . "melpa-stable") package-pinned-packages)
  ;; (push '(info+ . "melpa-stable") package-pinned-packages)

  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the lastest
   ;; version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil
   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory 'emacs-version
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;;dotspacemacs-mode-line-theme is 'spacemacs, 'all-the-icons, 'custom, 'vim-powerline or 'vanilla or a list with `car' one of the previous values and properties one of the following: `:separator' or `:separator-scale'
   dotspacemacs-mode-line-theme 'spacemacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-light zenburn
                                         ) ;;spacemacs-light
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 25
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; (add-to-list 'exec-path "/usr/local/bin") ;; Needed for Clojure REPL.
  ;; (setq configuration-layer-elpa-archives
  ;;       '(("melpa"    . "melpa.org/packages/")
  ;;         ("org"      . "orgmode.org/elpa/")
  ;;         ("gnu"      . "elpa.gnu.org/packages/")))
  (setq frame-resize-pixelwise t)
  (when (memq window-system '(mac ns))
    (add-to-list 'default-frame-alist '(ns-appearance . 'nil))
    (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))
  ;;(setq default-frame-alist '((ns-transparent-titlebar . t) (ns-appearance . 'nil)))

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; (global-set-key (kbd "<f7> <f8>") 'recentf-open-files)
  (load-theme 'zenburn t t)
  (load-theme 'solarized-light t t)
  ;; (defun activate-zenburn ()  (if (not (or (display-graphic-p)))
  ;;                                 (progn
  ;;                                   (disable-theme 'solarized-light)
  ;;                                   (enable-theme 'zenburn))
  ;;                               ;;(enable-theme 'solarized-light)
  ;;                                 ;;(progn
  ;;                                   ;;(load-theme 'zenburn t))
  ;;                               ;;(load-theme 'solarized-light t)
  ;;                                  ;;(+ 2 2)
  ;;                               ))
  ;; (add-hook 'tty-setup-hook 'activate-zenburn)

  (add-hook 'Man-mode-hook
            (lambda () (local-set-key (kbd "q") 'Man-kill)))
  (spacemacs/set-leader-keys "oo" 'recentf-open-files)
  (spacemacs/set-leader-keys "oms" 'evil-set-marker)
  (spacemacs/set-leader-keys "omg" 'evil-goto-mark)
  (spacemacs/set-leader-keys "oa" 'write-file)
  (spacemacs/set-leader-keys "os" 'save-some-buffers)
  (spacemacs/set-leader-keys "of" 'toggle-frame-fullscreen) ;;'spacemacs/toggle-fullscreen)
  (spacemacs/set-leader-keys "op" 'projectile-persp-switch-project)
  (spacemacs/set-leader-keys "oi" (lambda () (interactive "")  (do-applescript "tell application \"IntelliJ IDEA 2018.1 EAP\" to activate"))
    )
  (define-key key-translation-map (kbd "SPC o x") (kbd "C-x #"))
  (global-set-key (kbd "H-<right>") 'end-of-line)
  (global-set-key (kbd "H-<left>") 'back-to-indentation)
  (global-set-key (kbd "H-M-<left>") 'beginning-of-line)
  ;; (setq edit-server-url-major-mode-alist
  ;; '(("quora\\.com" . text-mode)))
  (add-hook 'edit-server-done-hook (lambda () (shell-command "open -a \"Google Chrome\"")))
  (defun ssh-win ()
    (interactive)
    (dired "/ssh:Evar@10.211.55.3:/"))
  (defun ssh-eOS ()
    (interactive)
    (dired "/ssh:errantes@10.211.55.9:/"))
  (setq password-cache-expiry nil)
  (setq projectile-mode-line "Projectile")
  (setq ns-right-command-modifier 'super)
  ;; (purpose-mode -1)
  ;; (require 'company-childframe)
  ;; (company-childframe-mode 1)


  (define-key evil-normal-state-map (kbd "[ o") 'evil-unimpaired/next-frame)
  (define-key evil-normal-state-map (kbd "] o") 'evil-unimpaired/previous-frame)

  ;; (require 'persp-projectile)
  ;; Default value for :pin in each use-package.
  ;;(setq use-package-always-bin "melpa-stable")
  (setq evil-want-abbrev-expand-on-insert-exit nil)
  (setq-default evil-escape-key-sequence "ii")
  (setq-default evil-escape-delay 0.3)
  ;; (setq special-display-buffer-names
  ;; ‘(“*sbt*” “*Help*”)) ;;Stops splitting the window for sbt buffers.
  (setq ensime-startup-notification `nil)
  (setq exec-path-from-shell-check-startup-files nil)
  (setq pop-up-frames nil) ;;Default is true.

  (defvar-local previous-binding-for-q nil)
  ;; (add-hook 'read-only-mode-hook '(lambda ()
  ;;                                   (if buffer-read-only
  ;;                                       (progn
  ;;                                         (setq previous-binding-for-q (local-key-binding "q"))
  ;;                                         (local-set-key "q" '(lambda ()
  ;;                                                               (quit-window "KILL")))
  ;;                                         (message "q remapped to kill buffer."))
  ;;                                     (progn
  ;;                                       (message "q restored to original mapping.")
  ;;                                       (local-set-key "q" previous-binding-for-q)))))
  (require 'view)
  (setq view-read-only t)     ; enter view-mode for read-only files
  (defun kill-window ()
    (interactive)
    (quit-window "KILL"))
  (define-key view-mode-map "x" 'kill-window)
  (defun set-x-to-kill ()
    (local-set-key "x" 'kill-window))
  (add-hook 'help-mode-hook 'set-x-to-kill)
  (add-hook 'dired-mode-hook 'set-x-to-kill)

  (setq-default adaptive-wrap-extra-indent 2)
  (add-hook 'visual-line-mode-hook #'adaptive-wrap-prefix-mode)

  ;; These 3 lines are supposed to make Scala layer work with Java.
  ;; (setq exec-path (append exec-path '("/usr/local/bin")))
  ;;(add-hook 'java-mode-hook 'scala/configure-ensime)
  ;;(add-hook 'java-mode-hook 'scala/maybe-start-ensime)


  ;; (setq eclim-eclipse-dirs '("~/eclipse/jee-oxygen2/Eclipse.app/Contents/Eclipse")
  ;; eclim-executable "~/.p2/pool/plugins/org.eclim_2.7.2/bin/eclim"
  ;; eclimd-default-workspace "/Base/- Code/Eclipse")
  ;; (require 'eclim)
  ;; (setq eclimd-autostart t)

  ;; (defun my-java-mode-hook ()
  ;;   (eclim-mode t))

  ;; (add-hook 'java-mode-hook 'my-java-mode-hook)

  (setenv "SHELL" "/bin/bash")
  (setq shell-file-name "/bin/bash")
  (setq explicit-shell-file-name "/bin/bash") ;;Set emacs shell to bash.
  (setenv "PAGER" "cat") ;;Required for shell mode.
  (add-to-list 'custom-theme-load-path "~/.emacs.d/private/themes/")
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/private/myPackages/"))
  ;; (setenv "WORKON_HOME" "~/anaconda/envs")
  ;; (pyvenv-mode 1)
  ;; (require 'webkit)
  ;; (require 'bookmark+)
  ;; (load-theme 'solarized-light t)

  ;; GUI Settings for YAMAMOTO Mitsuharu's Mac port of GNU Emacs.
  ;; https://github.com/railwaycat/homebrew-emacsmacport
  (when (and (spacemacs/system-is-mac) (display-graphic-p))
    ;; Disable pixel-by-pixel scrolling, since it's extremely choppy.
    (setq mac-mouse-wheel-smooth-scroll nil))

  ;; Keyboard smooth scrolling: Prevent the awkward "snap to re-center" when
  ;; the text cursor moves off-screen. Instead, only scroll the minimum amount
  ;; necessary to show the new line. (A number of 101+ disables re-centering.)
  (setq scroll-conservatively 101)

  ;; Optimize mouse wheel scrolling for smooth-scrolling trackpad use.
  ;; Trackpads send a lot more scroll events than regular mouse wheels,
  ;; so the scroll amount and acceleration must be tuned to smooth it out.
  (setq
   ;; If the frame contains multiple windows, scroll the one under the cursor
   ;; instead of the one that currently has keyboard focus.
   mouse-wheel-follow-mouse 't
   ;; Completely disable mouse wheel acceleration to avoid speeding away.
   mouse-wheel-progressive-speed nil
   ;; The most important setting of all! Make each scroll-event move 2 lines at
   ;; a time (instead of 5 at default). Simply hold down shift to move twice as
   ;; fast, or hold down control to move 3x as fast. Perfect for trackpads.
   mouse-wheel-scroll-amount '(2 ((shift) . 4) ((control) . 6)))

  (fset 'evil-visual-update-x-selection 'ignore)
  (delete-selection-mode 1)
  ;; (set-default 'server-socket-dir "~/.emacs.d/server")
  ;; (if (functionp 'window-system)
  ;;     (when (and (window-system)
  ;;                (>= emacs-major-version 24))
  ;;       (if (server-running-p)(server-start))))
  (require 'helm-bookmark)
  (require 'cider)
  (save-place-mode 1)
  ;; (require 'smooth-scrolling)
  ;; (require 'smooth-scroll                        ) ;; Smooth scroll
  ;; (smooth-scroll-mode 1                          ) ;; Enable it
  ;; (setq smooth-scroll/vscroll-step-size 5        ) ;; Set the speed right
  ;;(setq geiser-racket-binary "/Applications/Racket v6.10.1/bin/racket")
  (setq clojure-enable-fancify-symbols t)
  (key-chord-mode 1)
  ;; (key-chord-define evil-insert-state-map "fd" 'evil-escape)
  (key-chord-define evil-insert-state-map "jj" 'evil-delete-backward-char)
  (key-chord-define evil-insert-state-map "kk" 'delete-forward-char)
  ;;(defun add-key-cider-doc () (key-chord-define evil-insert-state-map "hh" 'cider-doc))
  (key-chord-define-global "fd" '(lambda () (interactive "")
                                 (cond
                                  ((or (eq evil-state 'normal) (eq evil-state 'visual)) (execute-kbd-macro (kbd "<escape> , h h")))
                                  ((eq evil-state 'insert) (execute-kbd-macro(kbd "<escape> l , h h i"))))))
  (add-hook 'clojure-mode-hook 'add-key-cider-doc)
  (add-hook 'cider-repl-mode-hook 'add-key-cider-doc)

  (add-hook 'clojure-mode-hook 'typed-clojure-mode)


  ;; (require 'ac-cider)
  ;; (add-hook 'clojure-mode-hook 'ac-flyspell-workaround)
  ;; (add-hook 'clojure-mode-hook 'ac-cider-setup)
  ;; (add-hook 'clojure-mode-hook 'auto-complete-mode)
  ;; (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
  ;; (eval-after-load "auto-complete"
  ;;   '(progn
  ;;      (add-to-list 'ac-modes 'clojure-mode)
  ;;      (add-to-list 'ac-modes 'cider-mode)
  ;;      (add-to-list 'ac-modes 'cider-repl-mode)))
  ;; (defun set-auto-complete-as-completion-at-point-function ()
  ;;   (setq completion-at-point-functions '(auto-complete)))

  ;; (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
  ;; (add-hook 'clojure-mode-hook 'se
  ;; t-auto-complete-as-completion-at-point-function)
  ;; (spacemacs/toggle-line-numbers-on)
  (add-hook 'prog-mode-hook 'linum-mode)
  (global-visual-line-mode)
  (global-undo-tree-mode)
  (evil-define-minor-mode-key 'motion 'visual-line-mode "j" 'evil-next-visual-line)
  (evil-define-minor-mode-key 'motion 'visual-line-mode "k" 'evil-previous-visual-line)
  ;; (setq flycheck-scalastyle-jar
  ;;       "/Base/- Code/Resources/scalastyle_2.12-1.1.0-20171004.080250-1-batch.jar")
  ;; (setq flycheck-scalastylerc
  ;;       "/Base/- Code/Resources/scalastyle_config.xml")
  ;;(line-number-mode t)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#343d46" t)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (company-emacs-eclim eclim yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic doom-themes all-the-icons memoize nyan-mode proof-general company-coq company-math math-symbol-lists ibuffer-projectile zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme rainbow-mode rainbow-identifiers color-identifiers-mode selectric-mode typit mmt sudoku pacmacs dash-functional 2048-game emoji-cheat-sheet-plus company-emoji iedit scroll-restore play-crystal inf-crystal flycheck-crystal crystal-mode helm-company helm-c-yasnippet fuzzy company-web web-completion-data company-statistics clojure-snippets auto-yasnippet ac-ispell xterm-color shell-pop org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download multi-term htmlize gnuplot eshell-z eshell-prompt-extras esh-help powerline bind-key smartparens highlight f evil goto-chg projectile epl avy ghub let-alist async hydra dash s noflet ensime company sbt-mode scala-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode ahk-mode mips-mode ac-cider auto-complete smooth-scroll key-chord clj-refactor inflections edn multiple-cursors paredit yasnippet peg cider-eval-sexp-fu cider seq queue clojure-mode helm helm-core racket-mode faceup smeargle reveal-in-osx-finder pbcopy osx-trash osx-dictionary orgit mmm-mode markdown-toc markdown-mode magit-gitflow launchctl helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor diff-hl auto-dictionary ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#bf616a")
     (40 . "#DCA432")
     (60 . "#ebcb8b")
     (80 . "#B4EB89")
     (100 . "#89EBCA")
     (120 . "#89AAEB")
     (140 . "#C189EB")
     (160 . "#bf616a")
     (180 . "#DCA432")
     (200 . "#ebcb8b")
     (220 . "#B4EB89")
     (240 . "#89EBCA")
     (260 . "#89AAEB")
     (280 . "#C189EB")
     (300 . "#bf616a")
     (320 . "#DCA432")
     (340 . "#ebcb8b")
     (360 . "#B4EB89"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) nil) (((class color) (min-colors 89)) (:background "#1c1c1c" :foreground "#eeeeee")))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#343d46" t)
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(org-brain js2-refactor intero groovy-mode flycheck-rust counsel-projectile swiper ivy packed company-emacs-eclim eclim yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic doom-themes all-the-icons memoize nyan-mode proof-general company-coq company-math math-symbol-lists ibuffer-projectile zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme rainbow-mode rainbow-identifiers color-identifiers-mode selectric-mode typit mmt sudoku pacmacs dash-functional 2048-game emoji-cheat-sheet-plus company-emoji iedit scroll-restore play-crystal inf-crystal flycheck-crystal crystal-mode helm-company helm-c-yasnippet fuzzy company-web web-completion-data company-statistics clojure-snippets auto-yasnippet ac-ispell xterm-color shell-pop org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download multi-term htmlize gnuplot eshell-z eshell-prompt-extras esh-help powerline bind-key smartparens highlight f evil goto-chg projectile epl avy ghub let-alist async hydra dash s noflet ensime company sbt-mode scala-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode ahk-mode mips-mode ac-cider auto-complete smooth-scroll key-chord clj-refactor inflections edn multiple-cursors paredit yasnippet peg cider-eval-sexp-fu cider seq queue clojure-mode helm helm-core racket-mode faceup smeargle reveal-in-osx-finder pbcopy osx-trash osx-dictionary orgit mmm-mode markdown-toc markdown-mode magit-gitflow launchctl helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor diff-hl auto-dictionary ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#bf616a")
     (40 . "#DCA432")
     (60 . "#ebcb8b")
     (80 . "#B4EB89")
     (100 . "#89EBCA")
     (120 . "#89AAEB")
     (140 . "#C189EB")
     (160 . "#bf616a")
     (180 . "#DCA432")
     (200 . "#ebcb8b")
     (220 . "#B4EB89")
     (240 . "#89EBCA")
     (260 . "#89AAEB")
     (280 . "#C189EB")
     (300 . "#bf616a")
     (320 . "#DCA432")
     (340 . "#ebcb8b")
     (360 . "#B4EB89")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
