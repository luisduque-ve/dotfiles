(use-package evil-terminal-cursor-changer
  :config
  (unless (display-graphic-p)
   (require 'evil-terminal-cursor-changer)
   (evil-terminal-cursor-changer-activate)))
