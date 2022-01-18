;; cc-mode provides editing modes for c, c++ and similar languages.
;; i currently mainly use c so i will use that functionality mainly.
(setq c-default-style "linux") ; the default is gnu style, which is an affront to humanity

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (local-set-key (kbd "C-c o") 'ff-find-other-file)))

;; these are from from emacs wiki
(defun meow/move-function-up ()
  "Move function at point up."
  (interactive)
  (save-excursion
    (c-mark-function)
    (let ((fun-beg (point))
	  (fun-end (mark)))
      (transpose-regions (progn
			   (c-beginning-of-defun 1)
			   (point))
			 (progn
			   (c-end-of-defun 1)
			   (point))
			 fun-beg fun-end))))

(defun meow/move-function-down ()
  "Move function at point down."
  (interactive)
  (save-excursion
    (c-mark-function)
    (let ((fun-beg (point))
	  (fun-end (mark)))
      (transpose-regions fun-beg fun-end
			 (progn
			   (c-beginning-of-defun -1)
			   (point))
			 (progn
			   (c-end-of-defun -1)
			   (point))))))
