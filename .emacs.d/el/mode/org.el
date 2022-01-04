;; org mode

(defun meow/insert-subheading ()
  "Insert subheading, but go to end of line first."
  (interactive)
  (end-of-line)
  (org-insert-subheading 4))

(use-package org
  :config
  (setq org-adapt-indentation t) ; i prefer to have my files look nice in other editors
  (add-hook 'org-mode-hook 'auto-fill-mode)
  (require 'ox-md)
  (require 'ox-ascii)
  (require 'ox-man)
  (define-key org-mode-map (kbd "C-M-<return>") 'meow/insert-subheading))

;; i'm just copying this. i can do what i want
(use-package org-roam
  :init
  (setq org-roam-v2-ack t ;i can't find this variable in C-h v, is this still necessary?
	org-roam-completion-everywhere t)
  :custom
  (org-roam-directory "~/.roam")
  (org-roam-dailies-capture-templates
   '(("d" "default" entry "* %<%H:%M>: %?"
      :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 :map org-mode-map
	 ("C-M-i"   . completion-at-point)
	 :map org-roam-dailies-map
	 ("Y" . org-roam-dailies-capture-yesterday)
	 ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies)
  (org-roam-setup))
  
