;; package management - unrelated to arch's pacman

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t) ;; add melpa to repositories
(package-initialize)

;; use-package makes things way easier
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
