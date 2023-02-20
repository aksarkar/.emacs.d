(require 'ox-beamer)
(require 'ox-latex)

; External programs
(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.pdf\\'" . "evince %s")
        ("\\.eps\\'" . "evince %s")))

; New link types
(org-add-link-type "pmid" 'aksarkar-org-pmid-open)
(defun aksarkar-org-pmid-open (path)
  (browse-url (concat "https://www.ncbi.nlm.nih.gov/pubmed/" path)))
(org-add-link-type "arxiv" 'aksarkar-org-arxiv-open)
(defun aksarkar-org-arxiv-open (path)
  (browse-url (concat "http://arxiv.org/abs/" path)))
(org-add-link-type "biorxiv"
                   '((path)
                     (browse-url (concat "https://www.biorxiv.org/content/" path))))

; Latex export
(setq org-latex-default-packages-alist
      '(
        ("" "graphicx" t)
        ("" "longtable" nil)
        ("" "float" nil)
        ("no-math" "fontspec" t)
        ("" "xunicode" t)
        ("" "unicode-math" t)
        ("" "amsmath" nil)
        ("backend=biber,date=year,defernumbers=true,doi=false,isbn=false,style=nature,url=false" "biblatex" nil)
        ("" "tikz" t)
        ("xetex,hidelinks=true,colorlinks=true,allcolors=blue" "hyperref" nil)
        ("" "rotating" t))
      org-latex-classes '(("article" "\\documentclass{article}\n[DEFAULT-PACKAGES]\n\\usepackage{parskip}\n\\usepackage[letterpaper,margin=1in]{geometry}\n\\renewcommand\\cite{\\supercite}\n\\addbibresource{/home/aksarkar/research/mit/reading/reading.bib}\n\\setmainfont[Extension=.otf,UprightFont=*-regular,BoldFont=*-bold,ItalicFont=*-italic,BoldItalicFont=*-bolditalic]{texgyretermes}\n\\setmathfont[bold-style=TeX]{texgyretermes-math.otf}"
  ("\\section{%s}" . "\\section*{%s}")
  ("\\subsection{%s}" . "\\subsection*{%s}")
  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
  ("\\paragraph{%s}" . "\\paragraph*{%s}")
  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
                          ("nips" "\\documentclass{article}\n[DEFAULT-PACKAGES]\n\\usepackage[nonatbib]{nips_2016}\n\\renewcommand\\cite{\\supercite}\n\\addbibresource{/home/aksarkar/research/mit/reading/reading.bib}"
  ("\\section{%s}" . "\\section*{%s}")
  ("\\subsection{%s}" . "\\subsection*{%s}")
  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
  ("\\paragraph{%s}" . "\\paragraph*{%s}")
  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
 ("book" "\\documentclass[11pt]{book}\n[DEFAULT-PACKAGES]\n\\usepackage{parskip}\n\\usepackage[margin=1in]{geometry}\n\\renewcommand\\cite{\\supercite}\n\\addbibresource{/home/aksarkar/research/mit/reading/reading.bib}\n\\setmainfont[Extension=.otf,UprightFont=*-regular,BoldFont=*-bold,ItalicFont=*-italic,BoldItalicFont=*-bolditalic]{texgyrepagella}\n\\setmathfont[bold-style=TeX]{texgyrepagella-math.otf}"
  ("\\chapter{%s}" . "\\chapter*{%s}")
  ("\\section{%s}" . "\\section*{%s}")
  ("\\subsection{%s}" . "\\subsection*{%s}")
  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
 ("aksarkar-beamer" "\\documentclass[aspectratio=1610,hyperref={},table]{beamer}\n\\mode<presentation>\n\\usecolortheme[named=black]{structure}\n\\useinnertheme{rectangles}\n\\setbeamertemplate{navigation symbols}{}\n\\setbeamertemplate{footline}[]\n[NO-DEFAULT-PACKAGES]\n\\usepackage[backend=biber,date=year,doi=false,isbn=false,style=authoryear,url=false]{biblatex}\n\\addbibresource{/home/aksarkar/research/mit/reading/reading.bib}"
  ("\\section{%s}" . "\\section*{%s}")))
      org-export-dispatch-use-expert-ui t)
(setq org-latex-caption-above nil)

(setq org-capture-templates
      '(("n" "Lab notebook" entry (file+olp+datetree "~/research/notebook.org") nil :jump-to-captured t :clock-in t :clock-keep t)
        ("t" "Task" entry (file "~/research/todo.org") "* TODO")
        ("i" "Interrupt" entry (file+olp+datetree "~/research/notebook.org") nil :jump-to-captured t :clock-in t :clock-resume t)
        ("p" "Paper" entry (file+olp+datetree "~/research/notebook.org") nil :jump-to-captured t :clock-in t :clock-keep nil :clock-resume t)
        )
      org-refile-targets '(("~/research/notebook.org" . (:maxlevel . 3))
                           ("~/research/todo.org" . (:maxlevel . 3))
                           ("~/misc/move/move.org" . (:maxlevel . 3)))
      org-refile-allow-creating-parent-nodes 'confirm)

(defun aksarkar-beamer-bold (contents backend info)
  (when (eq backend 'beamer)
    (replace-regexp-in-string "\\`\\\\[A-Za-z0-9]+" "\\\\textbf" contents)))
(add-to-list 'org-export-filter-bold-functions 'aksarkar-beamer-bold)

(setq org-latex-table-scientific-notation "\\(%s\\times 10^{%s}\\)"
      org-latex-pdf-process '("latexmk -silent -xelatex %f"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp t)
   (python . t)))

(defun aksarkar-org-hook ()
  (bibtex-set-dialect 'BibTeX)
  (auto-fill-mode t))

(add-hook 'org-mode-hook 'aksarkar-org-hook)

(setq org-agenda-files '("~/research/notebook.org" "~/research/todo.org" "~/misc/move/move.org" "~/misc/money/money.org")
      org-agenda-span 'day
      org-todo-keywords '((sequence "TODO" "WAIT" "|" "DONE" "WONTFIX(w)"))
      )

(setq org-descriptive-links nil
      org-adapt-indentation t)

(provide 'aksarkar-org)
