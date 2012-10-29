(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(setq py-electric-comment-add-space-p nil)
(setq py-shell-name "python3")
(setq py-shell-switch-buffers-on-execute nil)
(setq py-shell-switch-buffers-on-execute-p nil)
(setq py-shell-toggle-1 "python2")
(setq py-shell-toggle-2 "python3")
(setq-default py-split-windows-on-execute-function 'split-window-horizontally)
(setq py-start-run-py-shell nil)
(setq py-verbose-p nil)

(provide 'aksarkar-python)
