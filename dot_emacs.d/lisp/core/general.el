(use-package general
  :config
  (general-evil-setup t)
  (general-create-definer my-leader-def
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (my-leader-def
    "." '(find-file :which-key "find_file")
    "SPC" '(consult-find :which-key "consult_file")
    "s" '(:which-key "search") ;; search prefix
    "sb" '(consult-buffer :which-key "buffers")
    "sc" '(execute-extended-command :which-key "commands")
    "\"" '(split-window-below :which-key "split")
    "%" '(split-window-right :which-key "vsplit")
    "b" '(:which-key "buffers") ;; buffers prefix
    "bc" '(evil-delete-buffer :which-key "close_all")
    "bd" '(kill-this-buffer :which-key "close")
    "bo" '(delete-other-windows :which-key "only")))
