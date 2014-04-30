(require 'ox-beamer)
(require 'ox-latex)
(require 'org-bibtex)
(require 'org-latex)

(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.pdf\\'" . "mupdf %s")
        ("\\.eps\\'" . "evince %s"))
      org-latex-default-packages-alist
      '(("" "graphicx" t)
        ("" "longtable" nil)
        ("" "float" nil)
        ("" "fontspec" t)
        ("" "xunicode" t)
        ("" "unicode-math")
        ("" "biblatex" nil)
        ("xetex" "hyperref" nil)
        ("" "rotating" t)))

(add-to-list 'org-latex-classes
             '("aksarkar-beamer"
"\\documentclass{beamer}
\\mode<presentation>
\\usecolortheme[named=black]{structure}
\\usefonttheme{serif}
\\useinnertheme{rectangles}
\\setbeamertemplate{navigation symbols}{}
\\setbeamertemplate{footline}[]
\\usepackage{fontspec}
\\usepackage{unicode-math}
\\defaultfontfeatures{Scale=MatchLowercase, Mapping=tex-text}
\\setmainfont{Charis SIL}
\\setmathfont[Alternate=1]{Asana Math}"
   ("\\section{%s}" . "\\section*{%s}")))

(add-to-list 'org-latex-classes
             '("aksarkar-article"
"\\documentclass{article}
\\usepackage[letterpaper]{geometry}
 [DEFAULT-PACKAGES]
\\defaultfontfeatures{Mapping=tex-text}
\\setmainfont{Palatino Linotype}
\\setmathfont{Asana Math}"
   ("\\section{%s}" . "\\section*{%s}")
   ("\\subsection{%s}" . "\\subsection*{%s}")))

(add-to-list 'org-latex-classes
             '("aksarkar-nature"
"\\documentclass{article}
 [NO-DEFAULT-PACKAGES]
\\usepackage{amsmath}
\\usepackage[letterpaper]{geometry}
\\usepackage{graphicx}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{fontspec}
\\usepackage{xunicode}
\\usepackage{unicode-math}
\\usepackage[style=nature]{biblatex}
\\usepackage[xetex]{hyperref}
\\usepackage{rotating}

\\defaultfontfeatures{Mapping=tex-text}
\\setmainfont{Palatino Linotype}
\\setmathfont{Asana Math}
\\setmonofont{Consolas}

\\setlength{\\parindent}{0pt}
\\setlength{\\parskip}{1em}
\\renewcommand{\\baselinestretch}{1.2}

\\addbibresource{/home/asarkar/research/mit/reading/reading.bib}"
   ("\\section{%s}" . "\\section*{%s}")
   ("\\subsection{%s}" . "\\subsection*{%s}")))

(defun aksarkar-beamer-bold (contents backend info)
  (when (eq backend 'beamer)
    (replace-regexp-in-string "\\`\\\\[A-Za-z0-9]+" "\\\\textbf" contents)))
(add-to-list 'org-export-filter-bold-functions 'aksarkar-beamer-bold)

(setq org-latex-pdf-process '("latexmk -silent -xelatex %f"))

(setq org-bibtex-export-arbitrary-fields t
      org-bibtex-prefix "BIB_")

(org-add-link-type "pmid" 'aksarkar-org-pmid-open)
(defun aksarkar-org-pmid-open (path)
  (browse-url (concat "https://www.ncbi.nlm.nih.gov/pubmed/" path)))

(defun aksarkar-org-hook ()
  (bibtex-set-dialect 'BibTeX)
  (auto-fill-mode t))

(add-hook 'org-mode-hook 'aksarkar-org-hook)

(define-key org-mode-map (kbd "H-e") 'org-export-dispatch)
(define-key org-mode-map (kbd "H-r") 'org-bibtex-read-file)
(define-key org-mode-map (kbd "H-w") 'org-bibtex-write)

(provide 'aksarkar-org)
