(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
(require 'mu4e)
(require 'smtpmail)

(defun aksarkar-mu4e-compose-mode-hook ()
  (flyspell-mode)
  (set-fill-column 72))

(add-hook 'mu4e-compose-mode-hook 'aksarkar-mu4e-compose-mode-hook)

(setq
 message-send-mail-function 'smtpmail-send-it
 smtpmail-smtp-server "smtp.mit.edu"
 message-signature "Abhishek Sarkar"
 mu4e-get-mail-command "mbsync -aq"
 mu4e-maildir "~/mail/"
 mu4e-my-email-addresses '("aksarkar@mit.edu"
                           "aksarkar@csail.mit.edu"
                           "asarkar@cs.unc.edu"
                           "asarkar@email.unc.edu"
                           "asarkar@live.unc.edu"
                           "pyroclasm924@gmail.com")
 mu4e-reply-to-address "aksarkar@mit.edu"
 user-mail-address "aksarkar@mit.edu"
 user-full-name "Abhishek Sarkar")

(provide 'aksarkar-mu4e)
