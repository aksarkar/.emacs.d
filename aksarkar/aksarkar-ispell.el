(setq ispell-personal-dictionary "~/.hunspell_en_US")
(setq ispell-program-name "hunspell")
(defadvice ispell-get-coding-system (after ispell-always-pick-utf8 activate)
  (setq ad-return-value 'utf-8))

(provide 'aksarkar-ispell)
