;; install and set up ivy, counsel and swiper.

;; let's set up ivy first, since it is the basis of the others
(use-package ivy
  :diminish
  :config
  (ivy-mode))

;; next is counsel, which makes a lot of emacs commands that use ivy
;; after it's installed nicer.
(use-package counsel
  :diminish
  :config
  (counsel-mode)
  :bind
  (("C-x b" . counsel-switch-buffer)
   ("C-x t" . counsel-load-theme)))

;; swiper is a search tool using ivy.
(use-package swiper
  :bind
  ("C-s" . swiper))

;; ivy-rich makes a few improvements to ivy.
(use-package ivy-rich
  :config
  (ivy-rich-mode)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line))
