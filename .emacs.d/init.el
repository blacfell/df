;; set up package.el
(load "~/.emacs.d/pacman")

;; load all .el files in ~/.emacs.d/el
;; but first load the file with the function that lets us do that in the first place
(load "~/.emacs.d/load-directory")
(load-directory "~/.emacs.d/el")
