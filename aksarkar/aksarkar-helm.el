(require 'helm-config)
(require 'ac-helm)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-`") 'helm-mark-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "H-x f") 'helm-locate-library)
(global-set-key (kbd "C-M-i") 'ac-complete-with-helm)
(global-set-key (kbd "H-/") 'helm-semantic-or-imenu)
(define-key comint-mode-map (kbd "M-r") 'helm-comint-input-ring)
(define-key lisp-mode-map (kbd "C-M-i") 'helm-lisp-completion-at-point)

(setq helm-M-x-fuzzy-match t
      helm-apropos-fuzzy-match t
      helm-buffers-fuzzy-matching t
      helm-completion-in-region-fuzzy-match t
      helm-file-cache-fuzzy-match t
      helm-lisp-fuzzy-completion t
      helm-locate-fuzzy-match t
      helm-recentf-fuzzy-match t
      )

(provide 'aksarkar-helm)
