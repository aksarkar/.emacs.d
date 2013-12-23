(require 'ox-beamer)
(require 'ox-latex)
(require 'org-latex)

(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.pdf\\'" . "mupdf %s")
        ("\\.eps\\'" . "evince %s")))

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
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
   ("\\section{%s}" . "\\section*{%s}")))

(defun aksarkar-beamer-bold (contents backend info)
  (when (eq backend 'beamer)
    (replace-regexp-in-string "\\`\\\\[A-Za-z0-9]+" "\\\\textbf" contents)))
(add-to-list 'org-export-filter-bold-functions 'aksarkar-beamer-bold)

(setq org-latex-pdf-process '("latexmk -silent -xelatex %b"))

(provide 'aksarkar-org)
