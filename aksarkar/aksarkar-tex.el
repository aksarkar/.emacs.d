(add-to-list 'tex-compile-commands 
             '("xelatex --papersize=letter %r" "%r.tex" "%r.pdf"))

(defun 'aksarkar-tex-hook
  (flyspell-mode 1)
  (auto-fill-mode 1))

(add-hook 'tex-mode-hook aksarkar-tex-hook)

(provide 'aksarkar-tex)
