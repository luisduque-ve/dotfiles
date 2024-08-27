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
    180))

(setq-default fill-column 70)
(global-display-fill-column-indicator-mode)
(global-hl-line-mode 1)
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
    :states '(normal visual emacs)
    :keymaps '(global magit-mode-map)
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

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package evil-numbers)

(general-define-key
 :states 'normal
 "C-a" 'evil-numbers/inc-at-pt
 "C-x" 'evil-numbers/dec-at-pt)

(general-define-key
 :states 'visual
 "g C-a" 'evil-numbers/inc-at-pt-incremental
 "g C-x" 'evil-numbers/dec-at-pt-incremental)

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(use-package evil-goggles
  :config
  (evil-goggles-mode)
  (setq evil-goggles-duration 0.100)

  ;; optionally use diff-mode's faces; as a result, deleted text
  ;; will be highlighed with `diff-removed` face which is typically
  ;; some red color (as defined by the color theme)
  ;; other faces such as `diff-added` will be used for other actions
  (evil-goggles-use-diff-faces))

(use-package evil-quickscope
  :after evil
  :config
  (global-evil-quickscope-always-mode 1))

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

(setq visible-cursor nil)
(blink-cursor-mode -1)

(use-package evil-terminal-cursor-changer
:config
 (unless (display-graphic-p)
 (require 'evil-terminal-cursor-changer)
 (evil-terminal-cursor-changer-activate)))

(use-package evil-nerd-commenter
  :config
  :bind (:map evil-normal-state-map
            ("gcc" . evilnc-comment-or-uncomment-lines)
            ("gc" . evilnc-comment-operator)))

(my-leader-def
  "b"  '(:ignore t :which-key "buffer")
  "s"  '(:ignore t :which-key "search")
  "sb" '(switch-to-buffer :which-key "buffer")
  "%" '(evil-window-vsplit :which-key "vsplit")
  "\"" '(evil-window-split :which-key "split"))

(evil-define-key 'normal 'global
(kbd "C-l") 'evil-window-right
(kbd "C-h") 'evil-window-left
(kbd "C-k") 'evil-window-up
(kbd "C-j") 'evil-window-down)

(setq org-todo-keywords
      '((sequence "TODO" "IN PROGRESS" "DONE")))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning)
        ("IN PROGRESS" . "green")  ;; Bright Yellow for IN PROGRESS
        ("DONE" . "gray")))

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

(use-package magit-todos
  :config (magit-todos-mode 1))

(my-leader-def
  "g" '(magit-status :which-key "magit"))

(use-package zoxide)

(my-leader-def
  "sz" '(zoxide-cd :which-key "zoxide"))

(use-package hydra)

(defhydra hydra-buffer-scale (:timeout 10)
  "scale buffer"
  ("i" evil-window-increase-width "+horizontal")
  ("d" evil-window-decrease-width "-horizontal")
  ("I" evil-window-increase-height "+vertical")
  ("D" evil-window-decrease-height "-vertical")
  ("f" nil "finished" :exit t))

(my-leader-def
  "bs" '(hydra-buffer-scale/body :which-key "scale"))

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

(use-package consult)

(my-leader-def
  "sB" '(consult-bookmark :which-key "bookmark")
  "sh" '(consult-org-heading :which-key "org-heading"))

(use-package perspective
:init
(persp-mode))

(my-leader-def
"p"  '(:ignore t :which-key "perspective")
"ps" '(persp-switch :which-key "switch")
"pn" '(persp-next :which-key "next")
"pp" '(persp-prev :which-key "previous")
"pc" '(persp-kill-other-buffers :which-key "close-buffers")
"pk" '(persp-kill :which-key "kill")
"pr" '(persp-rename :which-key "rename")
"bd" '(persp-kill-buffer* :which-key "close"))

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
(exec-path-from-shell-initialize)))

(use-package pyenv-mode
  :config
  (pyenv-mode))

(use-package flycheck
:init (global-flycheck-mode))

(use-package flycheck-posframe
  :after flycheck
  :config (add-hook 'flycheck-mode-hook #'flycheck-posframe-mode))

(use-package markdown-mode)

(use-package yasnippet
:config
(yas-global-mode 1))

(use-package lsp-bridge
 :load-path "~/.emacs.d/lsp-bridge" ;; or any directory where you want to clone it
 :init
 ;; Clone the repository if it doesn't exist
 (unless (file-directory-p "~/.emacs.d/lsp-bridge")
   (shell-command "git clone https://github.com/manateelazycat/lsp-bridge.git ~/.emacs.d/lsp-bridge"))
 :config
 (setq lsp-bridge-python-lsp-server "pylsp")
 (global-lsp-bridge-mode)
 (general-define-key
:states '(insert) ;; Bind these keys in insert mode
:keymaps 'lsp-bridge-mode-map
"C-j" 'acm-select-next
"C-k" 'acm-select-prev
"C-e" 'acm-hide
[return] 'acm-complete))
