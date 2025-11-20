;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(setq user-full-name "Dmitry Kvasnikov"
      user-mail-address "dmitry.kvasnikov@gmail.com")

(setq doom-theme 'ef-owl)
(setq custom-safe-themes t)
(add-to-list 'custom-theme-load-path (concat doom-user-dir "themes"))

(setq display-line-numbers-type t)
(setq display-line-numbers-type 'relative)

(setq org-directory "~/org/")

(use-package all-the-icons)

(setq-default initial-scratch-message ";; He who walks alone  ... Always walks uphill but ... Beneath his feet are the ... Broken bones of flawed men ...\n\n")

(setq doom-font (font-spec :family "Aporetic Sans Mono" :size 16))

;; LSP settings
(setq lsp-enable-symbol-highlighting nil)
(setq lsp-lens-enable nil)
(setq lsp-ui-sideline-enable nil)

;; Paddigns with spacious-padding plugin
;; (require 'spacious-padding)
(setq spacious-padding-mode 1)
;; These are the default values, but I keep them here for visibility.
(setq spacious-padding-widths
      '( :internal-border-width 6
         :header-line-width 4
         :mode-line-width 4
         :tab-width 4
         :right-divider-width 20
         :scroll-bar-width 6
         :fringe-width 5))

;; Bookmarks settings
(setq bookmark-default-file "~/.config/doom/bookmarks")
(setq bookmark-sort-flag t)

;; setup clipboard
;; don't put deleted strings to X11 clipboard
(setq select-enable-clipboard nil)

;; cycle through buffers
(map! "C-{" #'bs-cycle-previous)
(map! "C-}" #'bs-cycle-next)

;; Search settings
(setq isearch-allow-scroll t)
(setq isearch-wrap-pause 'no-ding)


;; Screen positioninig
(setq recenter-positions '(middle top))
(setq scroll-preserve-screen-position t)
(setq scroll-conservatively 1000)
(setq scroll-margin 3)
(setq next-screen-context-lines 3)


;; break lines on words
(global-visual-line-mode t)
(setq vc-follow-symlinks nil)
(setq auto-save-default nil)

(setq text-scale-mode-step 1.1)

(use-package ormolu
 :hook (haskell-mode . ormolu-format-on-save-mode)
 :bind
 (:map haskell-mode-map
   ("C-c r" . ormolu-format-buffer)))
(after! lsp-haskell
  (setq lsp-haskell-formatting-provider "ormolu"))
(setq haskell-stylish-on-save t)

(custom-set-faces!
  '(flycheck-error :underline (:color "red2" :style wave)))

;; Key bindings
(map! "<escape>" 'keyboard-escape-quit)


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
