;; undo trees: it's fun

(use-package undo-tree
  :diminish
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t
	undo-tree-visualizer-diff t))
