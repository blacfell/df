;; magit is a "git porcelain"
(use-package magit)

;; yadm is the tool i use to manage my dotfiles.
;; the yadm man page provides some elisp to use it w/ magit
(require 'tramp)
(add-to-list 'tramp-methods
	     '("yadm"
	       (tramp-login-program "yadm")
	       (tramp-login-args (("enter")))
	       (tramp-login-env (("SHELL") ("/bin/sh")))
	       (tramp-remote-shell "/bin/sh")
	       (tramp-remote-shell-args ("-c"))))

(defun yadm-status ()
  (interactive)
  (magit-status "/yadm::"))

(global-set-key (kbd "C-c y") 'yadm-status)
