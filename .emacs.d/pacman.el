;; package management - unrelated to arch's pacman

;; natively compile packages when using emacs >=28
;; currently i am using emacs-native-comp-git-enhanced from the AUR
(setq package-native-compile t)

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

;; let us ignore silly nonsense in the minor mode list
(use-package diminish)

;; enable autoupdates
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t))
