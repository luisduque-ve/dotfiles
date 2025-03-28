(global-set-key (kbd "C-c x") 'execute-extended-command)

(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(defun recenter-advice (&rest _args)
  "Advice to recenter the screen this only calls recenter
  I use this to use in advice implementations in a clear way,
  is used in several functions evil and not evil"
  (recenter))

(advice-add 'isearch-repeat-forward :after #'recenter-advice)
(advice-add 'isearch-repeat-backward :after #'recenter-advice)

(setq custom-file "~/.emacs.d/custom.el")

(unless (file-exists-p custom-file)
  (with-temp-buffer (write-file custom-file)))

(load custom-file)

(when (string= system-type "darwin")
(setq dired-use-ls-dired nil))

(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(require 'use-package)
(setq use-package-always-ensure t)

(use-package xclip
  :config (xclip-mode 1))

(setq ring-bell-function 'ignore)
(global-visual-line-mode 1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq shr-width 70)

;; RUN nerd-icons-install-fonts
;; THIS IS NECESSARY
(use-package nerd-icons)

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-gruvbox t)

  (doom-themes-org-config))

(use-package doom-modeline
  :init (doom-modeline-mode 1))

(global-display-fill-column-indicator-mode)
(global-hl-line-mode 1)
(set-face-attribute 'default nil
		    :font "DejaVuSansM Nerd Font Mono"
		    :height 190)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; Disable the splash screen and open a scratch buffer
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; Remove GUI elements always, even in terminal
(scroll-bar-mode -1)     ;; Disable the scroll bar
(tool-bar-mode -1)       ;; Disable the tool bar
(menu-bar-mode -1)       ;; Disable the menu bar
(setq use-file-dialog nil)    ;; Disable the file dialog
(setq use-dialog-box nil)     ;; Disable dialog boxes
(setq inhibit-startup-buffer-menu t) ;; Disable buffer menu at startup

;; Suppress warnings at startup
(setq warning-minimum-level :error)
(setq inhibit-startup-warnings t)

(use-package which-key
  :config
  (setq which-key-idle-delay 0.1)
  (which-key-mode))

(use-package pdf-tools
  :config (pdf-tools-install))
(use-package saveplace-pdf-view
  :config (save-place-mode 1))

(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-directory "~/org/")

(setq org-todo-keywords
    '((sequence "TODO" "IN PROGRESS" "DONE")))

;; (setq org-log-done "time")

(setq org-hide-emphasis-markers t)

(use-package org-anki)

(use-package toc-org
  :hook (org-mode . toc-org-mode))

(use-package org-superstar
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

(use-package org-fancy-priorities
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))

(use-package magit
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package vertico
  :init
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :after vertico
  :init
  (marginalia-mode))

(use-package consult
  :config
  (global-set-key (kbd "C-x r b") #'consult-bookmark))

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
(exec-path-from-shell-initialize)))

(use-package vundo)

(use-package evil
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump t)
  (setq evil-undo-system 'undo-redo)
  (setq evil-search-module 'evil-search)

  ;; Evil advices
  (advice-add 'evil-search-next :after #'recenter-advice)
  (advice-add 'evil-scroll-down :after #'recenter-advice)
  (advice-add 'evil-scroll-up :after #'recenter-advice)
  (advice-add 'evil-search-previous :after #'recenter-advice)
  (advice-add 'evil-goto-line :after #'recenter-advice)

  :config
  (evil-mode 1)

  ;; mappings
  (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
  (with-eval-after-load 'evil
    (define-key evil-normal-state-map (kbd "C-n") nil)
    (define-key evil-normal-state-map (kbd "C-p") nil))

  ;; default states
  (evil-set-initial-state 'magit-mode 'emacs)
  (evil-set-initial-state 'Info-mode 'emacs)
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'eww-mode 'emacs)
  (evil-set-initial-state 'vterm-mode 'emacs))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(setq visible-cursor nil)
(blink-cursor-mode -1)
(use-package evil-terminal-cursor-changer
:config
 (unless (display-graphic-p)
 (require 'evil-terminal-cursor-changer)
 (evil-terminal-cursor-changer-activate)))

(use-package chezmoi)
