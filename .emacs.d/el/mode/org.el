;; org mode
(use-package org
  :config
  (setq org-adapt-indentation t) ;; i prefer to have my files look nice in other editors
  (add-hook 'org-mode-hook 'visual-line-mode)
  (require 'ox-md)
  (require 'ox-ascii))
