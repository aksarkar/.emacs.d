(require 'misc)
(require 'expand-region)

(defun aksarkar-save-buffer-and-swap (arg)
  (interactive "P")
  (if (derived-mode-p 'prog-mode 'text-mode)
    (basic-save-buffer))
  (switch-to-buffer nil)
  (if (and arg
           (derived-mode-p 'comint-mode))
      (comint-previous-input 0)))

(defun aksarkar/completion-in-region (start end collection &optional predicate)
  (with-wrapper-hook
      completion-in-region-functions (start end collection predicate)
    (let ((minibuffer-completion-table collection)
          (minibuffer-completion-predicate predicate))
      (ivy-completing-read "Completion:" collection predicate))))

(dotimes (n 10)
  (global-unset-key (kbd (format "C-%d" n)))
  (global-unset-key (kbd (format "M-%d" n))))

(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-xk" 'kill-this-buffer)
(global-set-key "\C-z" 'undo)
(global-set-key "\M-%" 'query-replace-regexp)
(global-set-key "\M-&" 'replace-regexp)
(global-set-key "\M-h" 'er/expand-region)
(global-set-key "\M-z" 'zap-up-to-char)
(global-set-key (kbd "M-1") 'shell)
(global-set-key (kbd "<f2>") 'aksarkar-save-buffer-and-swap)

(provide 'aksarkar-keyboard)
