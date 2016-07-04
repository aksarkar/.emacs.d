(require 'ledger-mode)

(setq ledger-reports
      '(("reg" "ledger -f %(ledger-file) reg checking payable")
        ("budget" "ledger -f %(ledger-file) -p \"this month\" budget")))

(provide 'aksarkar-ledger)
