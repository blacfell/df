;; emacs terminal

(defun meow/run-zsh-term-in-new-window ()
  "Run a zsh terminal in ansi-term in a new window."
  (interactive)
  (split-window-sensibly)
  (other-window 1)
  (ansi-term (executable-find "zsh")))

(global-set-key (kbd "C-c t") 'meow/run-zsh-term-in-new-window)
