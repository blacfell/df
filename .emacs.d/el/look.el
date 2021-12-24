;; let's improve emacs' look
(tool-bar-mode -1) ;; removes the toolbar
;; i usually remove the menu bar but i feel like keeping it right now
(setq visible-bell t)

;; i took this from reddit
(defun meow/load-theme-for-frame (frame)
  "Load theme when new frame is created. Needed for emacsdaemon."
  (select-frame frame)
  (load-theme 'nord t))

(use-package nord-theme
  :config
  ;; this whole thing is needed to make nord work when emacs is a daemon
  (if (daemonp)
      (add-hook 'after-make-frame-functions #'meow/load-theme-for-frame)
    (load-theme 'nord t)))
