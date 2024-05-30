(use-package lua-mode
  :ensure t
  :mode ("\\.lua\\'" . lua-mode)
  :config
  (setq lua-indent-level 2)
  (add-hook 'lua-mode-hook
            (lambda ()
              (setq tab-width 2)
              (setq indent-tabs-mode nil))))
