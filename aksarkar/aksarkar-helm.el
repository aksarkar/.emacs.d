(require 'helm-config)
(require 'helm-bibtex)

(helm-mode 1)

(global-set-key (kbd "<f5>") 'helm-semantic-or-imenu)
(global-set-key (kbd "<f6>") 'helm-man-woman)
(global-set-key (kbd "<f7>") 'helm-bibtex)
(global-set-key (kbd "C-M-i") 'ac-complete-with-helm)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-`") 'helm-mark-ring)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(define-key comint-mode-map (kbd "M-r") 'helm-comint-input-ring)
(define-key lisp-mode-map (kbd "C-M-i") 'helm-lisp-completion-at-point)

(setq
 helm-M-x-fuzzy-match t
 helm-apropos-fuzzy-match t
 helm-buffers-fuzzy-matching t
 helm-completion-in-region-fuzzy-match t
 helm-file-cache-fuzzy-match t
 helm-lisp-fuzzy-completion t
 helm-locate-fuzzy-match t
 helm-recentf-fuzzy-match t
 helm-bibtex-format-citation-functions '((org-mode . helm-bibtex-format-citation-cite)
                                         (latex-mode . helm-bibtex-format-citation-cite)
                                         (markdown-mode . helm-bibtex-format-citation-pandoc-citeproc)
                                         (default . helm-bibtex-format-citation-default))
 helm-bibtex-pdf-symbol "p"
 helm-bibtex-pdf-open-function 'helm-open-file-with-default-tool
 helm-bibtex-bibliography '("~/research/mit/reading/reading.bib")
 helm-bibtex-library-path '("~/research/mit/reading" "~/misc/books/")
 helm-bibtex-fallback-options
 '(("PubMed" . "http://www.ncbi.nlm.nih.gov/pubmed/?term=%s")
   ("bioRxiv" . "http://biorxiv.org/search/%s")
   ("Google Scholar" . "http://scholar.google.co.uk/scholar?q=%s")
   ("arXiv" . helm-bibtex-arxiv))
 )

(provide 'aksarkar-helm)
