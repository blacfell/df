;; there's no need for a save prompt if using emacsclient
(if (daemonp)
    (global-set-key (kbd "C-x C-c") #'delete-frame))
