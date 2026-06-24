;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; General configuration
(setq user-full-name "Dmitry Kvasnikov"
      user-mail-address "dmitry.kvasnikov@gmail.com")
(use-package all-the-icons)
(setq-default initial-scratch-message ";; He who walks alone  ... Always walks uphill but ... Beneath his feet are the ... Broken bones of flawed men ...\n\n")
(setq doom-font (font-spec :family "Aporetic Sans Mono" :size 16))
(add-to-list 'load-path "~/.config/doom/themes/")

;; Theme settings
(use-package ef-themes)
(setq custom-safe-themes t)
(setq doom-theme 'gruber-darker)

;; UI settings
(setq display-line-numbers-type t)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq recenter-positions '(middle top))
(setq scroll-preserve-screen-position t)
(setq scroll-conservatively 1000)
(setq scroll-margin 5)
(setq next-screen-context-lines 5)
(xterm-mouse-mode)
(display-time-mode)
(global-visual-line-mode t)
(setq vc-follow-symlinks nil)
(setq auto-save-default nil)
(setq text-scale-mode-step 1.1)
(global-subword-mode)

;; Code
(setq-hook! 'haskell-mode-hook +format-with-lsp t)

;; Org mode
(setq org-directory "~/org/")

;; Keyboard bindings
(map! "<escape>" #'keyboard-escape-quit)
(map! "C-h C-h" #'helpful-at-point)
(map! "C-\\" #'er/expand-region)
(map! "C-S-<left>" #'bs-cycle-previous)
(map! "C-S-<right>" #'bs-cycle-next)
(after! evil
  (define-key evil-motion-state-map (kbd "M-.") nil)
  (define-key evil-normal-state-map (kbd "M-.") nil)
  (define-key evil-insert-state-map (kbd "M-.") nil)
  (define-key evil-visual-state-map (kbd "M-.") nil))
(define-key evil-motion-state-map (kbd "M-.") #'xref-find-definitions)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
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
