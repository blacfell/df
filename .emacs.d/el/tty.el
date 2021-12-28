;; filename is a bit of a misnomer
;; this is for emacs in terminal stuff
(use-package evil-terminal-cursor-changer)

(unless (display-graphic-p)
  (evil-terminal-cursor-changer-activate)
  (menu-bar-mode -1))
