(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
(require 'mu4e)
(require 'smtpmail)

(defun aksarkar-mu4e-compose-mode-hook ()
  (flyspell-mode)
  (set-fill-column 72))

(add-hook 'mu4e-compose-mode-hook 'aksarkar-mu4e-compose-mode-hook)

(setq
 message-auto-save-directory "~/mail/drafts/"
 send-mail-function 'smtpmail-send-it
 message-send-mail-function 'smtpmail-send-it
 smtpmail-smtp-user "aksarkar"
 smtpmail-smtp-server "authsmtp.uchicago.edu"
 smtpmail-stream-type 'tls
 smtpmail-smtp-service 465
 message-signature "Abhishek Sarkar"
 mu4e-get-mail-command "mbsync -a"
 mu4e-maildir "~/mail/"
 mu4e-compose-complete-only-personal nil
 mu4e-reply-to-address "aksarkar@uchicago.edu"
 user-mail-address "aksarkar@uchicago.edu"
 user-full-name "Abhishek Sarkar")

(provide 'aksarkar-mu4e)
