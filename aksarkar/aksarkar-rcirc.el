(require 'rcirc)
(require 'aksarkar-rcirc-auth)

(defadvice rcirc-markup-attributes (before rcirc-fix-italics activate)
  "Fix italic control character"
  (save-excursion
    (while (re-search-forward "\C-]" nil t)
      (replace-match "\C-v"))))

(defun rcirc-strip-colors (&rest ignore)
  (while (re-search-forward "\C-c\\(\\([0-9][0-9]?,\\)?[0-9][0-9]?\\)?" nil t)
    (replace-match "")))

(defun rcirc-strip-flash (&rest ignore)
  (while (re-search-forward "\C-f" nil t)
    (replace-match "")))

(add-to-list 'rcirc-markup-text-functions 'rcirc-strip-colors)
(add-to-list 'rcirc-markup-text-functions 'rcirc-strip-flash)

(defun rcirc-notify (process sender response target text)
  (let ((frame (selected-frame)))
    (when (and (not (string= (rcirc-nick process) sender))
               (not (string= (rcirc-server-name process) sender))
               (or (string-match (rcirc-nick process) text) ; highlight
                   (and target (not (string-match "^[&#]" target))))) ; query
      (cond 
       ((eq (framep frame) 'x)   ; Only X11 frames
        (let* ((wm-hints (append (x-window-property
                                  "WM_HINTS" frame "WM_HINTS"
                                  (string-to-number
                                   (frame-parameter frame 'outer-window-id))
                                  nil t) nil))
               (flags (car wm-hints)))
          (setcar wm-hints (logior flags #x00000100))
          (x-change-window-property "WM_HINTS" wm-hints frame "WM_HINTS" 32 t)))
       ((not window-system)
        (send-string-to-terminal "^G"))))))

(add-hook 'rcirc-print-hooks 'rcirc-notify)

(defun-rcirc-command prepend (topic)
  "Prepend to the topic"
  (interactive "P")
  (if (and (called-interactively-p 'interactive) topic)
      (setq topic (read-string "New topic: ")))
  (when (> (length topic) 0)
    (rcirc-send-string process (concat "TOPIC " target
                                       (concat " :" topic " | " rcirc-topic)))))

(setq gnutls-min-prime-bits 1024)
(setq rcirc-server-alist
      '(("irc.foonetic.net" :port 6697 :channels ("#xkcd" "#xkcd-compsci")
         :encryption tls)
        ("im.bitlbee.org" :channels ("&bitlbee"))
        ("irc.freenode.org" :port 6697 :encryption tls)))
(setq rcirc-default-full-name "A. Sarkar")
(setq rcirc-default-user-name "asarkar")
(setq rcirc-fill-prefix "      ")
(setq rcirc-time-format "%H:%M ")
(setq rcirc-buffer-maximum-lines 500)
(setq rcirc-omit-threshold 0)
(setq rcirc-low-priority-chans nil)

(add-to-list 'rcirc-response-formats '("ACTION" . "* %N %m"))

(add-hook 'rcirc-mode-hook 
          '(lambda()
             (rcirc-track-minor-mode 1)
             (rcirc-omit-mode)
             (flyspell-mode 1)
             (if (member (buffer-name) rcirc-low-priority-chans)
                 (setq rcirc-low-priority-flag t))))

(defun rcirc-mode-p (buffer-name)
  (eq (buffer-local-value 'major-mode (get-buffer buffer-name)) 'rcirc-mode))

(defun rcirc-track-clear-activity ()
  (interactive)
  (mapc 'rcirc-clear-activity
        (remove-if-not 'rcirc-mode-p (buffer-list)))
  (rcirc-update-activity-string)
  (force-mode-line-update t))

(define-key rcirc-mode-map (kbd "C-c C-o") 'rcirc-cmd-oper)
(define-key rcirc-mode-map (kbd "C-c q") 'rcirc-cmd-quote)
(define-key rcirc-mode-map (kbd "M-o") 'rcirc-omit-mode)

(provide 'aksarkar-rcirc)
