(require 'eshell)
(require 'em-term)

(setq eshell-cmpl-cycle-completions nil)
(setq eshell-modules-list 
      '(eshell-alias
        eshell-basic
        eshell-cmpl
        eshell-dirs
        eshell-glob
        eshell-hist
        eshell-ls
        eshell-pred
        eshell-prompt
        eshell-script
        eshell-term
        eshell-unix))
(add-to-list 'eshell-visual-commands "journalctl")

(defun aksarkar-eshell-hook ()
  (local-set-key (kbd "C-c C-v") 'browse-url-at-point)
  (define-key eshell-mode-map (kbd "M-r") 'helm-eshell-history))

(add-hook 'eshell-mode-hook 'aksarkar-eshell-hook)

(provide 'aksarkar-eshell)
