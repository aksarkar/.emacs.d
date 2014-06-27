(require 'ess-site)

(ess-toggle-underscore nil)
(setq inferior-R-program-name "bsub")
(setq inferior-R-args "-q interactive -Is R --vanilla --quiet")

(provide 'aksarkar-ess)
