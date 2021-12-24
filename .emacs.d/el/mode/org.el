;; org mode

(defun meow/insert-subheading ()
  "Insert subheading, but go to end of line first."
  (interactive)
  (end-of-line)
  (org-insert-subheading 4))

(use-package org
  :config
  (setq org-adapt-indentation t) ; i prefer to have my files look nice in other editors
  (add-hook 'org-mode-hook 'visual-line-mode)
  (require 'ox-md)
  (require 'ox-ascii)
  (define-key org-mode-map (kbd "C-M-<return>") 'meow/insert-subheading))
