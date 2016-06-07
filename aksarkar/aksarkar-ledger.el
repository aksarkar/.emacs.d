(require 'ledger-mode)

(setq ledger-reports
      '(("month" "ledger -f %(ledger-file) -p \"this month\" reg expenses liabilities")
        ("budget" "ledger -f %(ledger-file) -p \"this month\" budget")))

(provide 'aksarkar-ledger)
