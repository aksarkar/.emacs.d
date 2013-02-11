(require 'comint)

(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

(provide 'aksarkar-shell)
