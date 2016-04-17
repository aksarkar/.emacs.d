(require 'ledger-mode)

(setq ledger-reports
      '(("month" "ledger -f %(ledger-file) -p \"this month\" reg expenses liabilities")
        ("ledger -f %(ledger-file) -p \"this month\" budget")))
