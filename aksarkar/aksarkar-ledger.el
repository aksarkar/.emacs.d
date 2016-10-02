(require 'ledger-mode)

(setq ledger-reports
      '(("reg" "ledger -f %(ledger-file) reg checking payable --cleared")
        ("reg-against-budget" "ledger -f  %(ledger-file) reg expenses -p \"this month\" --add-budget --cleared")
        ("budget" "ledger -f %(ledger-file) -p \"this month\" budget")))

(provide 'aksarkar-ledger)
