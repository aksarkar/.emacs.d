(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
(require 'mu4e)

(setq mu4e-get-mail-command "mbsync -aq --maildir=~/mail"
      mu4e-maildir "~/mail/"
      mu4e-my-email-addresses '("aksarkar@mit.edu"
                                "aksarkar@csail.mit.edu"
                                "asarkar@cs.unc.edu"
                                "asarkar@email.unc.edu"
                                "asarkar@live.unc.edu"
                                "pyroclasm924@gmail.com"))

(provide 'aksarkar-mu4e)
