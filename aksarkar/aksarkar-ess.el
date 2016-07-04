(require 'ess-site)

(ess-toggle-underscore nil)
(setq inferior-R-program-name "bsub")
(setq inferior-R-args "-q interactive -Is R --vanilla --quiet")
(setq ess-default-style 'OWN
      ess-eval-visibly nil
      ess-eval-visibly-p nil
      ess-first-continued-statement-offset 0
      ess-continued-statement-offset 0)
(define-key ess-mode-map (kbd "<f8>") 'ess-r-devtools-load-package)
(define-key ess-mode-map (kbd "<f9>") 'ess-debug-flag-for-debugging)

(provide 'aksarkar-ess)
