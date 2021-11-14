(menu-bar-mode -1) ; turn off menu bar
(tool-bar-mode -1) ; turn off toolbar
(scroll-bar-mode -1) ; turn off scrollbar
(setq visible-bell t) ; i, frankly, don't quite like having loud doots screamed at me all the time.

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(setq backup-by-copying t ; hello mr emacs please do not put your FUCKing trash in my project folders please
      backup-directory-alist '(("." . "~/.saves/"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(use-package monokai-theme
  :config
  (load-theme 'monokai t))

(set-face-attribute 'default nil :height 130)

(use-package ivy
  :config
  (ivy-mode)
  (global-set-key "\C-s" 'swiper))

(use-package swiper)

(use-package helpful
  :config
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key))

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line))

(use-package evil-collection
  :config
  (evil-collection-init))

(use-package avy
  :config
  (global-set-key (kbd "M-g c") 'evil-avy-goto-char)
  (global-set-key (kbd "M-g t") 'evil-avy-goto-char-timer)
  (global-set-key (kbd "M-g f") 'evil-avy-goto-line)
  (global-set-key (kbd "M-g w") 'evil-avy-goto-word-1))

(use-package magit
  (add-to-list 'tramp-methods
	       '("yadm"
		 (tramp-login-program "yadm")
		 (tramp-login-args (("enter")))
		 (tramp-login-env (("SHELL") ("/bin/sh")))
		 (tramp-remote-shell "/bin/sh")
		 (tramp-remote-shell-args ("-c"))))
  (global-set-key (kbd "C-c y") '(lambda () (interactive) (magit-status "/yadm::"))))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package haskell-mode)

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package org
  :config
  (add-hook 'text-mode-hook #'visual-line-mode))

(use-package org-journal
  :init
  (setq org-journal-prefix-key "C-c j ")
  :config
  (setq org-journal-dir "~/org/journal/"
	org-journal-date-format "%Y-%m-%d"
	org-journal-file-type 'monthly))
