(require 'ox-beamer)
(require 'ox-ipynb)
(require 'ox-latex)
(require 'org-install)

; Set up languages for evaluation
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (ipython . t)
   (shell . t)
   (R . t)))
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
(defun aksarkar-org-arvix-open (path)
  (browse-url (concat ("http://arxiv.org/abs/" path))))

; Latex export
(setq org-latex-default-packages-alist
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
\\setmathfont[Alternate=1]{Asana Math}
\\usepackage{graphicx}
\\usepackage[style=authoryear]{biblatex}
 [NO-DEFAULT-PACKAGES]"
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

(setq org-latex-table-scientific-notation "%s\\times 10^{%s}"
      org-latex-pdf-process '("latexmk -silent -xelatex %f"))

(setq org-bibtex-export-arbitrary-fields t
      org-bibtex-prefix "BIB_")

(defun aksarkar-org-hook ()
  (bibtex-set-dialect 'BibTeX)
  (auto-fill-mode t))

(add-hook 'org-mode-hook 'aksarkar-org-hook)

(setq org-publish-project-alist
      '(("nwas-org" . (:base-directory "/project2/mstephens/aksarkar/projects/nwas/analysis"
                                   :publishing-directory "/project2/mstephens/aksarkar/projects/nwas/docs"
                                   :publishing-function org-html-publish-to-html
                                   ))
        ("nwas-fig" . (:base-directory "/project2/mstephens/aksarkar/projects/nwas/analysis"
                                   :publishing-directory "/project2/mstephens/aksarkar/projects/nwas/docs"
                                   :publishing-function org-publish-attachment
                                   :base-extension "png\\|\\|svg"
                                   :recursive t
                                   ))
        ("nwas" . (:components ("nwas-org" "nwas-fig")))
        ("singlecell-qtl-analysis" . (:base-directory "/project2/mstephens/aksarkar/projects/singlecell-qtl/analysis/"
                                             :publishing-directory "/project2/mstephens/aksarkar/projects/singlecell-qtl/docs/"
                                             :publishing-function org-html-publish-to-html
                                             :exclude "setup.org"
                                             :htmlized-source t))
        ("singlecell-qtl-fig" . (:base-directory "/project2/mstephens/aksarkar/projects/singlecell-qtl/analysis/"
                                                 :publishing-directory "/project2/mstephens/aksarkar/projects/singlecell-qtl/docs/"
                                                 :base-extension "png\\|\\|svg"
                                                 :publishing-function org-publish-attachment
                                                 :recursive t))
        ("singlecell-qtl" . (:components ("singlecell-qtl-analysis" "singlecell-qtl-fig")))
        ("sse-org" . (:base-directory "/project2/mstephens/aksarkar/projects/sse/org"
                                      :publishing-directory "/project2/mstephens/aksarkar/projects/sse/docs"
                                      :publishing-function org-html-publish-to-html
                                      :htmlized-source t))
        ("sse-fig" . (:base-directory "/project2/mstephens/aksarkar/projects/sse/org"
                                      :publishing-directory "/project2/mstephens/aksarkar/projects/sse/docs"
                                      :publishing-function org-publish-attachment
                                      :base-extension "png"))
        ("sse" . (:components ("sse-org" "sse-fig")))
        ))

(add-to-list 'org-structure-template-alist
             '("S" "* Setup
  :PROPERTIES:
  :CUSTOM_ID: setup
  :END:

  #+BEGIN_SRC emacs-lisp :exports none
    (add-to-list 'python-shell-completion-native-disabled-interpreters \"jupyter\")
    (org-babel-lob-ingest \"/home/aksarkar/.emacs.d/org-templates/library.org\")
  #+END_SRC

  #+RESULTS:

  #+CALL: ipython3() :exports none :dir /scratch/midway2/aksarkar

  #+BEGIN_SRC ipython
    import matplotlib
    import matplotlib.pyplot as plt
  #+END_SRC
"))

(add-to-list 'org-structure-template-alist
             '("r" "#+BEGIN_SRC ipython
  import rpy2.robjects.packages
  import rpy2.robjects.pandas2ri
  rpy2.robjects.pandas2ri.activate()
#+END_SRC
"))

(defun ob-ipython-unjam ()
  (interactive)
  (prin1-to-string (ob-ipython--dequeue 'ob-ipython--async-queue)))

(provide 'aksarkar-org)
