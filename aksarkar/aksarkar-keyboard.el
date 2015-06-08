(require 'ace-jump-mode)
(require 'expand-region)
(require 'misc)
(require 'shell)

(defun aksarkar-shr-shell-command ()
  (interactive)
  (let ((url (get-text-property (point) 'shr-url)))
    (when url
      (let* ((command (read-shell-command "Shell command on URL: "))
             (buffer (generate-new-buffer "*shr-process*"))
             (proc (start-process "shr-process" buffer command url)))
        (with-current-buffer buffer
          (shell-mode)
          (set-process-filter proc 'comint-output-filter)
          (set-process-sentinel proc 'shell-command-sentinel))))))

(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-xk" 'kill-this-buffer)
(global-set-key "\C-z" 'undo)
(global-set-key "\M-%" 'query-replace-regexp)
(global-set-key "\M-&" 'replace-regexp)
(global-set-key "\M-h" 'er/expand-region)
(global-set-key "\M-m" 'ace-jump-mode)
(global-set-key "\M-z" 'zap-up-to-char)
(global-set-key (kbd "C-M-`") '(lambda () (interactive) (exchange-point-and-mark t)))
(global-set-key (kbd "C-`") '(lambda () (interactive) (push-mark)))
(global-set-key (kbd "H-b") 'bibtex-convert-alien)
(global-set-key (kbd "H-d") 'aksarkar-day)
(global-set-key (kbd "H-e") 'eshell)
(global-set-key (kbd "H-f") 'find-file-at-point)
(global-set-key (kbd "H-i") 'irc)
(global-set-key (kbd "H-m") 'magit-status)
(global-set-key (kbd "H-n") 'aksarkar-night)
(global-set-key (kbd "H-q") 'previous-buffer)
(global-set-key (kbd "H-r") 'elfeed)
(global-set-key (kbd "H-s") 'shell)
(global-set-key (kbd "H-t") '(lambda () (interactive) (eshell 2)))
(global-set-key (kbd "H-v") 'org-bibtex-write)
(global-set-key (kbd "H-w") 'next-buffer)
(global-set-key (kbd "H-x") 'org-bibtex-read)
(global-set-key (kbd "M-`") '(lambda () (interactive) (set-mark-command t)))

(define-key shr-map "x" 'aksarkar-shr-shell-command)
(provide 'aksarkar-keyboard)
