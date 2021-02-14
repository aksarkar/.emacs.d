(require 'eshell)
(require 'esh-mode)
(require 'em-term)

(setq eshell-cmpl-cycle-completions nil
      eshell-modules-list 
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
  ;; Important: eshell-mode-map isn't globally defined!
  (define-key eshell-mode-map (kbd "M-r") 'helm-eshell-history)
  (define-key eshell-mode-map (kbd "TAB") 'pcomplete))

(add-hook 'eshell-mode-hook 'aksarkar-eshell-hook)

(provide 'aksarkar-eshell)
