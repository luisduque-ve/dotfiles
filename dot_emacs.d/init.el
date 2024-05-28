;; Bootstrap `use-package`
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Install `use-package` if it's not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; Disable the startup screen
(setq inhibit-startup-screen t)

;; Disable the startup message in the echo area
(setq inhibit-startup-echo-area-message t)

;; Disable the initial scratch message
(setq initial-scratch-message nil)

;; Set initial major mode
(setq initial-major-mode 'emacs-lisp-mode)

;; Ensure the initial buffer is the scratch buffer
(setq initial-buffer-choice t)

;; Disable the toolbar
(tool-bar-mode -1)

;; Disable the scrollbar
(scroll-bar-mode -1)

;; Disable the menu bar
(menu-bar-mode -1)

;; Disable cursor blinking
(setq visible-cursor nil)
(blink-cursor-mode -1)

;; Set default font
(set-face-attribute 'default nil :font "FiraCode Nerd Font Mono" :height 190)

;; Set custom-file to a separate file to avoid cluttering init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Create the custom-file if it doesn't exist and load it
(unless (file-exists-p custom-file)
  (with-temp-buffer (write-file custom-file)))
(load custom-file)

;; Set backup directory to the OS temporary directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Load all configuration files from the `lisp` directory
(defvar my-config-dir (expand-file-name "lisp" user-emacs-directory)
  "Directory where additional configuration files are stored.")

(defun load-directory (dir)
  "Load all `.el` files in DIR and its subdirectories."
  (dolist (file (directory-files-recursively dir "\\.el$"))
    (load (file-name-sans-extension file))))

(load-directory my-config-dir)
