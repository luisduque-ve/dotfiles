;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Full template in: https://github.com/doomemacs/doomemacs/blob/master/templates/config.example.el
;;
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 17 :weight 'semi-light))
(setq doom-theme 'doom-gruvbox-light)
(setq display-line-numbers-type 'relative)
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;; Set the delay for which-key popup
(after! which-key
  (setq which-key-idle-delay 0.1))

(use-package chezmoi)
