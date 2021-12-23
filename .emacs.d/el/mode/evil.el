;; vi emulation for emacs

(use-package evil
  :config
  (evil-mode 1)
  (setq evil-undo-system 'undo-tree))

(use-package goto-chg)
