(require 'reftex)
(require 'tex-mode)

(defun aksarkar-tex-hook ()
  (flyspell-mode 1)
  (auto-fill-mode 1)
  (reftex-mode 1))

(setq bibtex-dialect 'BibTeX
      reftex-default-bibliography "~/research/mit/reading/reading.bib"
      tex-fontify-script nil)

(add-hook 'tex-mode-hook 'aksarkar-tex-hook)

(provide 'aksarkar-tex)
