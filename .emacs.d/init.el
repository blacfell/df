;; set up package.el
(load "~/.emacs.d/pacman")

;; i don't use customise at all but for some reason a bunch of nonsense
;; always ends up in my init.el. pretty sure its related to package.el
;; or use-package
(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file)
    (load custom-file))

;; load all .el files in ~/.emacs.d/el
;; but first load the file with the function that lets us do that in the first place
(load "~/.emacs.d/load-directory")
(load-directory "~/.emacs.d/el")
