(package-initialize)
(add-to-list 'load-path "~/.emacs.d/aksarkar")
(add-to-list 'load-path "~/.emacs.d/vendor/")
(let ((default-directory "~/.emacs.d/vendor/"))
  (normal-top-level-add-subdirs-to-load-path))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(require 'aksarkar-browse)
(require 'aksarkar-elfeed)
(require 'aksarkar-eshell)
(require 'aksarkar-avy)
(require 'aksarkar-git)
(require 'aksarkar-gui)
(require 'aksarkar-haskell)
(require 'aksarkar-ibuffer)
(require 'aksarkar-ispell)
(require 'aksarkar-keyboard)
;; This needs to be here since aksarkar-keyboard unsets some keys
(require 'aksarkar-helm)
(require 'aksarkar-mu4e)
(require 'aksarkar-org)
(require 'aksarkar-rcirc)
(require 'aksarkar-tex)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-external-programs-associations
   (quote
    (("svg" . "inkscape")
     ("pdf" . "mupdf")
     ("jpg" . "feh -Fz")
     ("PDF" . "mupdf")
     ("png" . "feh")
     ("flv" . "mpv")
     ("m2t" . "mpv")
     ("avi" . "mpv")
     ("mp4" . "mpv")
     ("mkv" . "mpv"))))
 '(ledger-reports
   (quote
    (("bal" "ledger bal")
     ("reg" "ledger -f %(ledger-file) reg checking payable --cleared")
     ("reg-against-budget" "ledger -f  %(ledger-file) reg expenses -p \"this month\" --add-budget --cleared")
     ("budget" "ledger -f %(ledger-file) -p \"this month\" budget"))))
 '(org-agenda-files
   (quote
    ("~/misc/move/move.org" "~/research/notebook.org" "~/research/todo.org")))
 '(org-latex-table-scientific-notation "\\(%s\\times 10^{%s}\\)")
 '(package-selected-packages
   (quote
    (org markdown-mode magit helm-projectile helm-bibtex google-c-style fuzzy expand-region elfeed avy)))
 '(rcirc-track-minor-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
