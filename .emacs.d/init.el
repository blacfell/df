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

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t
	auto-package-update-interval 7)
  (auto-package-update-maybe))

(use-package diminish)

(setq backup-by-copying t ; hello mr emacs please do not put your FUCKing trash in my project folders please
      backup-directory-alist '(("." . "~/.saves/"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(use-package base16-theme)

(use-package nord-theme
  :config
  (load-theme 'nord t))

(set-face-attribute 'default nil :height 200)

(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "DejaVu Sans" :height 200))))
 '(fixed-pitch ((t (:family "DejaVu Sans Mono" :height 200)))))

(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'Info-mode-hook 'variable-pitch-mode)

(use-package ivy
  :diminish
  :config
  (ivy-mode)
  (global-set-key "\C-s" 'swiper))

(use-package counsel
  :diminish
  :config
  (counsel-mode)
  (global-set-key (kbd "C-x b") #'counsel-switch-buffer)
  (global-set-key (kbd "C-c t") #'counsel-load-theme))

(use-package ivy-rich
  :config
  (ivy-rich-mode 1)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line))

(use-package swiper)

(use-package helpful
  :config
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key))

(use-package undo-tree
  :diminish
  :config
  (global-undo-tree-mode))

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (evil-set-undo-system 'undo-tree))

(use-package evil-collection
  :after evil
  :diminish evil-collection-unimpaired-mode
  :config
  (evil-collection-init))

(use-package avy
  :config
  (global-set-key (kbd "M-g c") 'evil-avy-goto-char)
  (global-set-key (kbd "M-g t") 'evil-avy-goto-char-timer)
  (global-set-key (kbd "M-g f") 'evil-avy-goto-line)
  (global-set-key (kbd "M-g w") 'evil-avy-goto-word-1))

(use-package which-key
  :diminish
  :config
  (which-key-mode))

(use-package magit
  :config
  (require 'tramp)
  (add-to-list 'tramp-methods
	       '("yadm"
		 (tramp-login-program "yadm")
		 (tramp-login-args (("enter")))
		 (tramp-login-env (("SHELL") ("/bin/sh")))
		 (tramp-remote-shell "/bin/sh")
		 (tramp-remote-shell-args ("-c"))))
  (global-set-key (kbd "C-c y") '(lambda () (interactive) (magit-status "/yadm::"))))

(use-package projectile
  :diminish
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package haskell-mode)

(setq c-default-style "linux")

(use-package slime
  :config
  (setq inferior-lisp-program "sbcl"))

(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1))

(use-package org
  :config
  (dolist (face '((org-level-1 . 1.2)
		  (org-level-2 . 1.1)
		  (org-level-3 . 1.05)))
    (set-face-attribute (car face) nil :font "DejaVu Sans Mono" :weight 'regular :height (cdr face)))
  (setq org-adapt-indentation t))

(use-package org-superstar
  :config
  (add-hook 'org-mode-hook (lambda ()
			     (org-superstar-mode 1))))

(use-package org-journal
  :init
  (setq org-journal-prefix-key "C-c j ")
  :config
  (setq org-journal-dir "~/org/journal/"
	org-journal-date-format "%Y-%m-%d"
	org-journal-file-type 'monthly))

(use-package company
  :diminish
  :config
  (add-hook 'prog-mode-hook 'global-company-mode))

(use-package pdf-tools
  :config
  (pdf-tools-install))

(global-set-key (kbd "C-c c") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

(use-package exwm
  :config
  (setq exwm-workspace-number 5)

  (add-hook 'exwm-update-class-hook
	    (lambda ()
	      (exwm-workspace-rename-buffer exwm-class-name)))

  (require 'exwm-randr)
  (exwm-randr-enable)

  (require 'exwm-systemtray)
  (exwm-systemtray-enable)

  (setq exwm-input-prefix-keys
	'(?\C-x
	  ?\C-u
	  ?\C-h
	  ?\M-x
	  ?\M-`
	  ?\M-&
	  ?\M-:))
  (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)
  (setq exwm-input-global-keys
	`((,(kbd "s-r") . exwm-reset)
	  (,(kbd "s-h") . windmove-left)
	  (,(kbd "s-s") . windmove-right)
	  (,(kbd "s-n") . windmove-up)
	  (,(kbd "s-t") . windmove-down)
	  (,(kbd "s-o") . (lambda (command)
		       (interactive (list (read-shell-command "$ ")))
		       (start-process-shell-command command nil command)))
	  (,(kbd "s-w") . exwm-workspace-switch)
	  (,(kbd "s-`") . (lambda () (interactive) (exwm-workspace-switch-create 0)))
	  ,@(mapcar (lambda (i)
		      `(,(kbd (format "s-%d" i)) .
			(lambda ()
			  (interactive)
			  (exwm-workspace-switch-create ,i))))
		    (number-sequence 0 9))))
  (display-battery-mode 1)
  (setq display-time-day-and-date t)
  (display-time-mode 1)
  (exwm-enable))

(use-package desktop-environment
  :diminish
  :config
  (setq desktop-environment-volume-toggle-command
	"amixer -D pulse set Master toggle"
	desktop-environment-volume-set-command
	"amixer -D pulse set Master %s"
	desktop-environment-volume-get-command
	"amixer -D pulse get Master")
  (desktop-environment-mode))
