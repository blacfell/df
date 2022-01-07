;; let's improve emacs' look
(tool-bar-mode -1) ;; removes the toolbar
;; i usually remove the menu bar but i feel like keeping it right now
(setq visible-bell t)

(use-package doom-themes
  :config
  ;; this whole thing is needed to make nord work when emacs is a daemon
  (load-theme 'doom-nord t))

(set-face-attribute 'default nil :family "Terminus" :height 200)
