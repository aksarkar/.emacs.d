(require 'ox-beamer)
(require 'ox-latex)
(require 'org-bibtex)

; External programs
(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.pdf\\'" . "mupdf %s")
        ("\\.eps\\'" . "evince %s")))

; New link types
(org-add-link-type "pmid" 'aksarkar-org-pmid-open)
(defun aksarkar-org-pmid-open (path)
  (browse-url (concat "https://www.ncbi.nlm.nih.gov/pubmed/" path)))
(org-add-link-type "arxiv" 'aksarkar-org-arxiv-open)
(defun aksarkar-org-arxiv-open (path)
  (browse-url (concat "http://arxiv.org/abs/" path)))

; Latex export
(setq org-latex-default-packages-alist
      '(("" "amsmath" nil)
        ("" "graphicx" t)
        ("" "longtable" nil)
        ("" "float" nil)
        ("" "fontspec" t)
        ("" "xunicode" t)
        ("" "unicode-math")
        ("backend=biber,date=year,doi=false,isbn=false,style=nature,url=false" "biblatex" nil)
        ("xetex" "hyperref" nil)
        ("" "rotating" t))

      org-latex-classes '(("article" "\\documentclass[11pt]{article}\n[DEFAULT-PACKAGES]\n\\usepackage{parskip}\n\\usepackage[letterpaper]{geometry}"
  ("\\section{%s}" . "\\section*{%s}")
  ("\\subsection{%s}" . "\\subsection*{%s}")
  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
  ("\\paragraph{%s}" . "\\paragraph*{%s}")
  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
 ("report" "\\documentclass[11pt]{report}"
  ("\\part{%s}" . "\\part*{%s}")
  ("\\chapter{%s}" . "\\chapter*{%s}")
  ("\\section{%s}" . "\\section*{%s}")
  ("\\subsection{%s}" . "\\subsection*{%s}")
  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
 ("book" "\\documentclass[11pt]{book}"
  ("\\part{%s}" . "\\part*{%s}")
  ("\\chapter{%s}" . "\\chapter*{%s}")
  ("\\section{%s}" . "\\section*{%s}")
  ("\\subsection{%s}" . "\\subsection*{%s}")
  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
 ("aksarkar-beamer" "\\documentclass{beamer}\n\\mode<presentation>\n\\usecolortheme[named=black]{structure}\n\\usefonttheme{serif}\n\\useinnertheme{rectangles}\n\\setbeamertemplate{navigation symbols}{}\n\\setbeamertemplate{footline}[]\n\\usepackage{amsmath}\n\\usepackage{fontspec}\n\\usepackage{unicode-math}\n\\defaultfontfeatures{Scale=MatchLowercase, Mapping=tex-text}\n\\setmainfont{Charis SIL}\n\\setmathfont[Alternate=1]{Asana Math}\n\\usepackage{graphicx}\n\\usepackage[backend=biber,style=authoryear]{biblatex}\n[NO-DEFAULT-PACKAGES]"
  ("\\section{%s}" . "\\section*{%s}"))
 ("aksarkar-article" "\\documentclass{article}\n\\usepackage[letterpaper]{geometry}\n[DEFAULT-PACKAGES]\n\\defaultfontfeatures{Mapping=tex-text}\n\\setmainfont{Palatino Linotype}\n\\setmathfont{Asana Math}\n\\setmonofont{Inconsolata}"
  ("\\section{%s}" . "\\section*{%s}")
  ("\\subsection{%s}" . "\\subsection*{%s}"))
 ("aksarkar-nature" "\\documentclass{article}\n[NO-DEFAULT-PACKAGES]\n\\usepackage{amsmath}\n\\usepackage[margin=1in,letterpaper]{geometry}\n\n\\usepackage[backend=biber,date=year,defernumbers=true,doi=false,isbn=false,style=nature,url=false]{biblatex}\n\\usepackage[xetex]{hyperref}\n\\usepackage{fontspec}\n\\usepackage{parskip}\n\\usepackage{xunicode}\n\\usepackage{unicode-math}\n\\setmainfont{Palatino Linotype}\n\\setmathfont{Asana Math}\n\\setmonofont[Scale=.8]{DejaVu Sans Mono}\n\\renewcommand{\\baselinestretch}{1.1}\n\\addbibresource{/home/asarkar/research/mit/reading/reading.bib}"
   ("\\section{%s}" . "\\section*{%s}")
   ("\\subsection{%s}" . "\\subsection*{%s}"))))

(defun aksarkar-beamer-bold (contents backend info)
  (when (eq backend 'beamer)
    (replace-regexp-in-string "\\`\\\\[A-Za-z0-9]+" "\\\\textbf" contents)))
(add-to-list 'org-export-filter-bold-functions 'aksarkar-beamer-bold)

(setq org-latex-table-scientific-notation "%s\\times 10^{%s}"
      org-latex-pdf-process '("latexmk -silent -xelatex %f"))

(setq org-bibtex-export-arbitrary-fields t
      org-bibtex-prefix "BIB_")

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp t)
   (python . t)))

(defun aksarkar-org-hook ()
  (bibtex-set-dialect 'BibTeX)
  (auto-fill-mode t))

(add-hook 'org-mode-hook 'aksarkar-org-hook)

(provide 'aksarkar-org)
