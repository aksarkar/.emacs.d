(package-initialize)
(add-to-list 'load-path "~/.emacs.d/aksarkar")
(add-to-list 'load-path "~/.emacs.d/vendor/")
(let ((default-directory "~/.emacs.d/vendor/"))
  (normal-top-level-add-subdirs-to-load-path))

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.milkbox.net/packages/")))

(require 'aksarkar-avy)
(require 'aksarkar-git)
(require 'aksarkar-gui)
(require 'aksarkar-ibuffer)
(require 'aksarkar-ispell)
(require 'aksarkar-keyboard)
(require 'aksarkar-helm)
(require 'aksarkar-org)
(require 'aksarkar-python)
(require 'aksarkar-shell)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(delete-selection-mode nil)
 '(electric-pair-mode t)
 '(org-export-dispatch-use-expert-ui t)
 '(org-html-htmlize-output-type (quote css))
 '(package-selected-packages
   (quote
    (graphviz-dot-mode json-mode snakemake-mode ess yaml-mode vlf htmlize ob-ipython markdown-mode s org ipython python-mode magit helm-projectile expand-region avy)))
 '(projectile-mode t nil (projectile))
 '(python-indent-offset 2)
 '(safe-local-variable-values
   (quote
    ((org-publish-project-alist
      ("singlecell-ideas-org" :base-directory "/scratch/midway2/aksarkar/singlecell-ideas/org" :publishing-directory "/scratch/midway2/aksarkar/singlecell-ideas/docs" :publishing-function org-html-publish-to-html :exclude "setup.org")
      ("singlecell-ideas-fig" :base-directory "/scratch/midway2/aksarkar/singlecell-ideas/org" :publishing-directory "/scratch/midway2/aksarkar/singlecell-ideas/docs" :base-extension "png\\|\\|svg" :publishing-function org-publish-attachment :recursive t)
      ("singlecell-ideas" :components
       ("singlecell-ideas-org" "singlecell-ideas-fig")))
     (org-publish-project-alist
      ("ideas-org" :base-directory "/project2/mstephens/aksarkar/projects/ideas/org" :publishing-directory "/project2/mstephens/aksarkar/projects/ideas/docs" :publishing-function org-html-publish-to-html :exclude "setup.org")
      ("ideas-fig" :base-directory "/project2/mstephens/aksarkar/projects/ideas/org" :publishing-directory "/project2/mstephens/aksarkar/projects/ideas/docs" :base-extension "png\\|\\|svg" :publishing-function org-publish-attachment :recursive t)
      ("ideas" :components
       ("ideas-org" "ideas-fig")))
     (org-publish-project-alist
      ("fqtl-org" :base-directory "/project2/mstephens/aksarkar/projects/gtex-fqtl/org" :publishing-directory "/project2/mstephens/aksarkar/projects/gtex-fqtl/docs" :publishing-function org-html-publish-to-html :exclude "setup.org" :htmlized-source t)
      ("fqtl-fig" :base-directory "/project2/mstephens/aksarkar/projects/gtex-fqtl/org" :publishing-directory "/project2/mstephens/aksarkar/projects/gtex-fqtl/docs" :publishing-function org-publish-attachment :base-extension "png" :recursive t)
      ("fqtl" :components
       ("fqtl-org" "fqtl-fig")))
     (org-publish-project-alist
      ("gtex-pred-org" :base-directory "/project2/mstephens/aksarkar/projects/gtex-pred/org" :publishing-directory "/project2/mstephens/aksarkar/projects/gtex-pred/docs" :publishing-function org-html-publish-to-html :exclude "setup.org" :htmlized-source t)
      ("gtex-pred-fig" :base-directory "/project2/mstephens/aksarkar/projects/gtex-pred/org" :publishing-directory "/project2/mstephens/aksarkar/projects/gtex-pred/docs" :publishing-function org-publish-attachment :base-extension "png" :recursive t)
      ("gtex-pred" :components
       ("gtex-pred-org" "gtex-pred-fig")))
     (org-publish-project-alist
      ("fqtl-org" :base-directory "/project2/mstephens/aksarkar/projects/gtex_fqtl_2018/org" :publishing-directory "/project2/mstephens/aksarkar/projects/gtex_fqtl_2018/docs" :publishing-function org-html-publish-to-html :exclude "setup.org" :htmlized-source t)
      ("fqtl-fig" :base-directory "/project2/mstephens/aksarkar/projects/gtex_fqtl_2018/org" :publishing-directory "/project2/mstephens/aksarkar/projects/gtex_fqtl_2018/docs" :publishing-function org-publish-attachment :base-extension "png" :recursive t)
      ("fqtl" :components
       ("fqtl-org" "fqtl-fig")))
     (org-publish-project-alist
      ("fqtl-org" :base-directory "/project2/mstephens/aksarkar/projects/fqtl/org" :publishing-directory "/project2/mstephens/aksarkar/projects/fqtl/docs" :publishing-function org-html-publish-to-html :exclude "setup.org" :htmlized-source t)
      ("fqtl-fig" :base-directory "/project2/mstephens/aksarkar/projects/fqtl/org" :publishing-directory "/project2/mstephens/aksarkar/projects/fqtl/docs" :publishing-function org-publish-attachment :base-extension "png" :recursive t)
      ("fqtl" :components
       ("fqtl-org" "fqtl-fig")))
     (org-publish-project-alist
      ("hypoxia-org" :base-directory "/project2/mstephens/aksarkar/projects/hypoxia/org" :publishing-directory "/project2/mstephens/aksarkar/projects/hypoxia/docs" :publishing-function org-html-publish-to-html :exclude "setup.org" :htmlized-source t)
      ("hypoxia-fig" :base-directory "/project2/mstephens/aksarkar/projects/hypoxia/org" :publishing-directory "/project2/mstephens/aksarkar/projects/hypoxia/docs" :publishing-function org-publish-attachment :base-extension "png" :recursive t)
      ("hypoxia" :components
       ("hypoxia-org" "hypoxia-fig")))
     (org-publish-project-alist
      ("singlecell-ideas-org" :base-directory "/project2/mstephens/aksarkar/projects/singlecell-ideas/org" :publishing-directory "/project2/mstephens/aksarkar/projects/singlecell-ideas/docs" :publishing-function org-html-publish-to-html :exclude "setup.org")
      ("singlecell-ideas-fig" :base-directory "/project2/mstephens/aksarkar/projects/singlecell-ideas/org" :publishing-directory "/project2/mstephens/aksarkar/projects/singlecell-ideas/docs" :base-extension "png\\|\\|svg" :publishing-function org-publish-attachment :recursive t)
      ("singlecell-ideas" :components
       ("singlecell-ideas-org" "singlecell-ideas-fig")))
     (org-publish-project-alist
      ("trans-ethnic-prediction-org" :base-directory "/project2/mstephens/aksarkar/projects/trans-ethnic-prediction/org" :publishing-directory "/project2/mstephens/aksarkar/projects/trans-ethnic-prediction/docs" :publishing-function org-html-publish-to-html :exclude "setup.org")
      ("trans-ethnic-prediction-fig" :base-directory "/project2/mstephens/aksarkar/projects/trans-ethnic-prediction/org" :publishing-directory "/project2/mstephens/aksarkar/projects/trans-ethnic-prediction/docs" :publishing-function org-publish-attachment :base-extension "png" :recursive t)
      ("trans-ethnic-prediction" :components
       ("trans-ethnic-prediction-org" "trans-ethnic-prediction-fig")))
     (org-publish-project-alist
      ("trans-ethnic-prediction-org" :base-directory "/project2/mstephens/aksarkar/projects/trans-ethnic-prediction/org" :publishing-directory "/project2/mstephens/aksarkar/projects/trans-ethnic-prediction/docs" :publishing-function org-html-publish-to-html)
      ("trans-ethnic-prediction-fig" :base-directory "/project2/mstephens/aksarkar/projects/trans-ethnic-prediction/org" :publishing-directory "/project2/mstephens/aksarkar/projects/trans-ethnic-prediction/docs" :publishing-function org-publish-attachment :base-extension "png" :recursive t)
      ("trans-ethnic-prediction" :components
       ("trans-ethnic-prediction-org" "trans-ethnic-prediction-fig")))
     (org-publish-project-alist quote
                                (("trans-ethnic-prediction-org" :base-directory "/project2/mstephens/aksarkar/projects/trans-ethnic-prediction/org" :publishing-directory "/project2/mstephens/aksarkar/projects/trans-ethnic-prediction/docs" :publishing-function org-html-publish-to-html)
                                 ("trans-ethnic-prediction-fig" :base-directory "/project2/mstephens/aksarkar/projects/trans-ethnic-prediction/org" :publishing-directory "/project2/mstephens/aksarkar/projects/trans-ethnic-prediction/docs" :publishing-function org-publish-attachment :base-extension "png" :recursive t)
                                 ("trans-ethnic-prediction" :components
                                  ("trans-ethnic-prediction-org" "trans-ethnic-prediction-fig"))))
     (org-publish-project-alist
      ("singlecell-modes-org" :base-directory "/project2/mstephens/aksarkar/projects/singlecell-modes/org" :publishing-directory "/project2/mstephens/aksarkar/projects/singlecell-modes/docs" :publishing-function org-html-publish-to-html :exclude "setup.org" :sitemap-title "Single cell analysis of singlecell-modesune cases" :htmlized-source t)
      ("singlecell-modes-fig" :base-directory "/project2/mstephens/aksarkar/projects/singlecell-modes/org" :publishing-directory "/project2/mstephens/aksarkar/projects/singlecell-modes/docs" :publishing-function org-publish-attachment :base-extension "png\\|\\|svg" :recursive t)
      ("singlecell-modes" :components
       ("singlecell-modes-org" "singlecell-modes-fig")))
     (org-publish-project-alist
      ("autoimm-org" :base-directory "/project2/mstephens/aksarkar/projects/autoimm/org" :publishing-directory "/project2/mstephens/aksarkar/projects/autoimm/docs" :publishing-function org-html-publish-to-html :auto-sitemap t :sitemap-filename "index.org" :exclude "setup.org" :sitemap-title "Single cell analysis of autoimmune cases" :htmlized-source t)
      ("autoimm-fig" :base-directory "/project2/mstephens/aksarkar/projects/autoimm/org" :publishing-directory "/project2/mstephens/aksarkar/projects/autoimm/docs" :publishing-function org-publish-attachment :base-extension "png\\|\\|svg" :recursive t)
      ("autoimm" :components
       ("autoimm-org" "autoimm-fig")))
     (org-publish-project-alist
      ("autoimm-org" :base-directory "/project2/mstephens/aksarkar/projects/autoimm/org" :publishing-directory "/project2/mstephens/aksarkar/projects/autoimm/docs" :publishing-function org-html-publish-to-html :auto-sitemap t :exclude "setup.org" :sitemap-title "Single cell")
      ("autoimm-fig" :base-directory "/project2/mstephens/aksarkar/projects/autoimm/org" :publishing-directory "/project2/mstephens/aksarkar/projects/autoimm/docs" :publishing-function org-publish-attachment :base-extension "png\\|\\|svg" :recursive t)
      ("autoimm" :components
       ("autoimm-org" "autoimm-fig")))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'set-goal-column 'disabled nil)
