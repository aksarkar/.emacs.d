(package-initialize)
(add-to-list 'load-path "~/.emacs.d/aksarkar")
(add-to-list 'load-path "~/.emacs.d/vendor/")
(let ((default-directory "~/.emacs.d/vendor/"))
  (normal-top-level-add-subdirs-to-load-path))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(require 'aksarkar-keyboard)
(require 'aksarkar-browse)
(require 'aksarkar-elfeed)
(require 'aksarkar-eshell)
(require 'aksarkar-avy)
(require 'aksarkar-git)
(require 'aksarkar-gui)
(require 'aksarkar-haskell)
(require 'aksarkar-helm)
(require 'aksarkar-ibuffer)
(require 'aksarkar-ispell)
(require 'aksarkar-mu4e)
(require 'aksarkar-org)
(require 'aksarkar-rcirc)
(require 'aksarkar-rcirc-auth)
(require 'aksarkar-tex)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-external-programs-associations (quote (("mp4" . "mpv") ("pdf" . "evince"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
