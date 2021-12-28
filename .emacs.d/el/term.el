;; emacs terminal

(defun meow/zsh ()
  "Run a zsh terminal in ansi-term in a new window"
  (interactive)
  (split-window-sensibly)
  (other-window 1)
  (term "/usr/bin/zsh"))

(global-set-key (kbd "C-c t") 'meow/zsh)
