(require 'ispell)
(add-to-list 'ispell-dictionary-alist
      '("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" t ("-d" "en_US") nil "utf-8"))
(setq ispell-personal-dictionary "~/.hunspell_en_US"
      ispell-program-name "hunspell"
      ispell-dictionary "en_US")
(defadvice ispell-get-coding-system (after ispell-always-pick-utf8 activate)
  (setq ad-return-value 'utf-8))

(provide 'aksarkar-ispell)
