;; avy is a way of jumping to places

(use-package avy
  :bind
  (("M-g M-c" . avy-goto-char)
   ("M-g M-t" . avy-goto-char-timer)
   ("M-g M-g" . avy-goto-line) ;; goto-line is still accessible from M-g g
   ("M-g M-w" . avy-goto-word-1))
  :config
  (setq avy-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?n ?s))) ;; dvorak home row
