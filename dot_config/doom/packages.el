;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.
;;
;; full example can be found in https://github.com/doomemacs/doomemacs/blob/master/templates/packages.example.el

(package! evil-snipe :disable t)

(package! chezmoi)

(package! conda)

(package! org-anki)

(package! evil-quickscope
  :recipe (:host github :repo "blorbx/evil-quickscope"))

