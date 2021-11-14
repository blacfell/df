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

(menu-bar-mode -1) ; turn off menu bar
(tool-bar-mode -1) ; turn off toolbar
(scroll-bar-mode -1) ; turn off scrollbar
(setq visible-bell t) ; i, frankly, don't quite like having loud doots screamed at me all the time.

(use-package monokai-theme
  :config
  (load-theme 'monokai t))

(use-package ivy
  :config
  (ivy-mode)
  (global-set-key "\C-s" 'swiper))

(use-package swiper)

(use-package avy
  :config
  (global-set-key (kbd "C-:") 'avy-goto-char)
  (global-set-key (kbd "C-.") 'avy-goto-char-timer)
  (global-set-key (kbd "M-g f") 'avy-goto-line)
  (global-set-key (kbd "M-g w") 'avy-goto-word-1))

(use-package magit)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package haskell-mode)

(use-package org
  :config
  (add-hook 'text-mode-hook #'visual-line-mode))
