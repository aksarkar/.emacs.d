(require 'ibuffer)

(setq ibuffer-default-sorting-mode 'alphabetic
      ibuffer-display-summary nil
      ibuffer-expert t
      ibuffer-saved-filter-groups
      (quote
       (("default"
         ("elfeed" (name . "elfeed"))
         ("helm" (name . "helm"))
         ("irc" (mode . rcirc-mode))
         ("magit" (derived-mode . magit-mode))
         ("shell" (or (mode . eshell-mode)
                      (mode . shell-mode)))
         ("emacs" (name . "^\\*.*\\*$")))))
      ibuffer-show-empty-filter-groups nil)

(defun aksarkar-ibuffer-hook ()
  (ibuffer-switch-to-saved-filter-groups "default"))
(add-hook 'ibuffer-mode-hook 'aksarkar-ibuffer-hook)

(provide 'aksarkar-ibuffer)
