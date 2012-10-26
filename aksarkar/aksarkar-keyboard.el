(require 'ace-jump-mode)
(require 'expand-region)

(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-z" 'undo)
(global-set-key "\M-%" 'query-replace-regexp)
(global-set-key "\M-&" 'replace-regexp)
(global-set-key "\M-h" 'er/expand-region)
(global-set-key "\M-m" 'ace-jump-mode)

(provide 'aksarkar-keyboard)
