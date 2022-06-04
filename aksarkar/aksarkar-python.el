(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(setq py-electric-comment-add-space-p nil
      py-shell-name "python3"
      py-shell-switch-buffers-on-execute nil
      py-shell-switch-buffers-on-execute-p nil
      py-shell-toggle-1 "python2"
      py-shell-toggle-2 "python3"
      py-start-run-py-shell nil
      py-verbose-p nil
      python-indent-offset 2)
(setq-default py-split-windows-on-execute-function 'split-window-horizontally)


(provide 'aksarkar-python)
