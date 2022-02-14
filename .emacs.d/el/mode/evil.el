;; vi emulation for emacs

(use-package evil
  :init
  (setq evil-want-keybinding nil) ;this stuff is handled by evil-collection
  :config
  (evil-mode 1)
  ;; visual lines make more sense in most situations i think
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (define-key evil-normal-state-map "u" 'undo-tree-undo)
  (define-key evil-normal-state-map (kbd "C-r") 'undo-tree-redo)
  (setq evil-undo-system 'undo-tree
	evil-shift-width '8))

;; for repeating
(use-package goto-chg)

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

