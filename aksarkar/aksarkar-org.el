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
        ("xetex" "hyperref" nil)
        ("" "rotating" t))
      org-latex-classes '(("article" "\\documentclass{article}\n[DEFAULT-PACKAGES]\n\\usepackage{parskip}\n\\usepackage[letterpaper,margin=1in]{geometry}\n\\renewcommand\\cite{\\supercite}\n\\addbibresource{/home/asarkar/research/mit/reading/reading.bib}\n\\setmainfont[Extension=.otf,UprightFont=*-regular,BoldFont=*-bold,ItalicFont=*-italic,BoldItalicFont=*-bolditalic]{texgyrepagella}\n\\setmathfont[bold-style=TeX]{texgyrepagella-math.otf}"
  ("\\section{%s}" . "\\section*{%s}")
  ("\\subsection{%s}" . "\\subsection*{%s}")
  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
  ("\\paragraph{%s}" . "\\paragraph*{%s}")
  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
                          ("nips" "\\documentclass{article}\n[DEFAULT-PACKAGES]\n\\usepackage[nonatbib]{nips_2016}\n\\renewcommand\\cite{\\supercite}\n\\addbibresource{/home/asarkar/research/mit/reading/reading.bib}"
  ("\\section{%s}" . "\\section*{%s}")
  ("\\subsection{%s}" . "\\subsection*{%s}")
  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
  ("\\paragraph{%s}" . "\\paragraph*{%s}")
  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
 ("book" "\\documentclass[11pt]{book}\n[DEFAULT-PACKAGES]\n\\usepackage{parskip}\n\\usepackage[margin=1in]{geometry}\n\\renewcommand\\cite{\\supercite}\n\\addbibresource{/home/asarkar/research/mit/reading/reading.bib}\n\\setmainfont[Extension=.otf,UprightFont=*-regular,BoldFont=*-bold,ItalicFont=*-italic,BoldItalicFont=*-bolditalic]{texgyrepagella}\n\\setmathfont[bold-style=TeX]{texgyrepagella-math.otf}"
  ("\\chapter{%s}" . "\\chapter*{%s}")
  ("\\section{%s}" . "\\section*{%s}")
  ("\\subsection{%s}" . "\\subsection*{%s}")
  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
 ("aksarkar-beamer" "\\documentclass[aspectratio=1610,hyperref={},table]{beamer}\n\\mode<presentation>\n\\usefonttheme[onlymath]{serif}\n\\usecolortheme[named=black]{structure}\n\\useinnertheme{rectangles}\n\\setbeamertemplate{navigation symbols}{}\n\\setbeamertemplate{footline}[]\n[NO-DEFAULT-PACKAGES]\n\\usepackage{fontspec}\n\\usepackage{xunicode}\n\\usepackage{unicode-math}\n\n\\setmathfont[bold-style=TeX]{texgyrepagella-math.otf}\\usepackage[backend=biber,date=year,doi=false,isbn=false,style=authoryear,url=false]{biblatex}\n\\addbibresource{/home/asarkar/research/mit/reading/reading.bib}"
  ("\\section{%s}" . "\\section*{%s}")))
      org-export-dispatch-use-expert-ui t)
(setq org-latex-caption-above nil)

(setq org-capture-templates
      '(("n" "Lab notebook" entry (file+datetree "~/research/notebook.org") nil :jump-to-captured t :clock-in t :clock-keep t)
        ("t" "Task" entry (file "~/research/todo.org") "* TODO")
        ("i" "Interrupt" entry (file+datetree "~/research/notebook.org") nil :jump-to-captured t :clock-in t :clock-resume t)
        ("p" "Paper" entry (file+datetree "~/research/notebook.org") nil :jump-to-captured t :clock-in t :clock-keep nil :clock-resume t)
        ("d" "Debit" plain (file "~/misc/account.txt") "%(org-read-date) %^{payee}
    expenses:%^{account}  %^{amount}
    assets:checking" :kill-buffer t)
        ("c" "Credit" plain (file "~/misc/account.txt") "%(org-read-date) %^{payee}
    expenses:%^{account}  %^{amount}
    liabilities:visa" :kill-buffer t))
      org-refile-targets '(("/home/asarkar/research/notebook.org" . (:maxlevel . 3))
                           ("/home/asarkar/research/todo.org" . (:maxlevel . 3))
                           ("/home/asarkar/misc/move/move.org" . (:maxlevel . 3)))
      org-refile-allow-creating-parent-nodes 'confirm)

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

(setq org-agenda-files '("~/research/notebook.org" "~/research/todo.org" "~/misc/move/move.org")
      org-agenda-span 'day
      org-todo-keywords '((sequence "TODO" "|" "DONE" "WONTFIX(w)"))
      org-latex-table-scientific-notation "\\(%s\\times 10^{%s}\\)"
      )

(provide 'aksarkar-org)
