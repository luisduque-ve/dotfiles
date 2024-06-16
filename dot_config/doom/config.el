;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Full template in: https://github.com/doomemacs/doomemacs/blob/master/templates/config.example.el
;;
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 17 :weight 'semi-bold))
(setq doom-theme 'doom-gruvbox-light)
(setq display-line-numbers-type 'relative)
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;; Set the delay for which-key popup

(use-package chezmoi)

(after! which-key
  (setq which-key-idle-delay 0.1)
  (which-key-add-key-based-replacements
  "C-c !" "flycheck"))

(after! projectile
  (setq projectile-switch-project-action 'projectile-dired))

(after! conda
  (custom-set-variables
 '(conda-anaconda-home "~/opt/miniconda3")))

(after! magit-todos
  :config (magit-todos-mode 1))

(after! vertico
      (setq which-key-use-C-h-commands t))

(after! org
  (map! :localleader
        :map org-mode-map
        :desc "anki-sync-all" "U" #'org-anki-sync-all)
  (map! :localleader
        :map org-mode-map
        :desc "anki-sync-entry" "u" #'org-anki-sync-entry)
  (map! :localleader
        :map org-mode-map
        :desc "structure-template" "S" #'org-insert-structure-template))

