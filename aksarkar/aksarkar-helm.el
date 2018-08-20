(require 'helm-bibtex)
(require 'helm-config)
(require 'projectile)
(projectile-global-mode)

(helm-mode 1)

(global-set-key (kbd "C-2") 'projectile-command-map)
(global-set-key (kbd "C-3") 'helm-man-woman)
(global-set-key (kbd "C-4") 'helm-bibtex)
(global-set-key (kbd "C-M-i") 'ac-complete-with-helm)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-`") 'helm-mark-ring)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(define-key comint-mode-map (kbd "M-r") 'helm-comint-input-ring)
(define-key lisp-mode-map (kbd "C-M-i") 'helm-lisp-completion-at-point)

(setq
 helm-mode-fuzzy-match t
 helm-candidate-number-limit 50
 bibtex-completion-format-citation-functions '((org-mode . bibtex-completion-format-citation-cite)
                                         (latex-mode . bibtex-completion-format-citation-cite)
                                         (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
                                         (default . bibtex-completion-format-citation-default))
 helm-bibtex-pdf-symbol "p"
 helm-bibtex-pdf-open-function 'find-file
 helm-bibtex-bibliography '("~/research/mit/reading/reading.bib")
 helm-bibtex-library-path '("~/research/mit/reading" "~/misc/books/")
 helm-bibtex-fallback-options
 '(("PubMed" . "http://www.ncbi.nlm.nih.gov/pubmed/?term=%s")
   ("bioRxiv" . "http://biorxiv.org/search/%s")
   ("Google Scholar" . "http://scholar.google.co.uk/scholar?q=%s")
   ("arXiv" . helm-bibtex-arxiv))
 )

(provide 'aksarkar-helm)
