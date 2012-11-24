(iswitchb-mode t)
(setq ibuffer-default-sorting-mode 'alphabetic)
(setq ibuffer-display-summary nil)
(setq ibuffer-expert t)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("irc" (mode . rcirc-mode))
               ("git" (name . "^\\*git.*\\*"))
               ("emacs" (name . "^\\*.*\\*$"))))))
(setq ibuffer-show-empty-filter-groups nil)

(defun aksarkar-ibuffer-hook ()
  (ibuffer-switch-to-saved-filter-groups "default"))
(add-hook 'ibuffer-mode-hook 'aksarkar-ibuffer-hook)

(provide 'aksarkar-ibuffer)