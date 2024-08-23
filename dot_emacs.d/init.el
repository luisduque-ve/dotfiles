(setq custom-file "~/.emacs.d/custom.el")

(unless (file-exists-p custom-file)
  (with-temp-buffer (write-file custom-file)))

(load custom-file)

(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(require 'use-package)
(setq use-package-always-ensure t)

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-gruvbox-light t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package doom-modeline
  :init (doom-modeline-mode 1))

(defun my/get-font-size ()
  "Return 140 if in a WSL environment, otherwise 170."
  (if (getenv "WSL_DISTRO_NAME")
      140
    170))

(set-face-attribute 'default nil
                    :font "FiraCode Nerd Font Mono"
                    :height (my/get-font-size)
                    :weight 'semi-bold)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq org-directory "~/org/")

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

(use-package general
  :after (evil which-key)
  :config
  (general-evil-setup t)
  (general-create-definer my-leader-def
    :keymaps '(normal visual)
    :prefix "SPC"))

(use-package evil
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  ;; Define key mappings to include recentering
(evil-define-key 'normal 'global
  (kbd "C-d") (lambda () (interactive) (evil-scroll-down nil) (recenter))
  (kbd "C-u") (lambda () (interactive) (evil-scroll-up nil) (recenter))
  (kbd "n") (lambda () (interactive) (evil-search-next) (recenter))
  (kbd "N") (lambda () (interactive) (evil-search-previous) (recenter))
  (kbd "G") (lambda () (interactive) (evil-goto-line) (recenter))))

(use-package evil-org
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(my-leader-def
  "b"  '(:ignore t :which-key "buffer")
  "bd" '(evil-delete-buffer :which-key "close"))

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

(use-package magit-todos
  :config (magit-todos-mode 1))

(my-leader-def
  "g" '(magit-status :which-key "magit"))
