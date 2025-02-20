(require 'rcirc)
(require 'aksarkar-rcirc-auth)
(require 'expand-region)

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
  (interactive "sNew topic: ")
  ;; (if (and (called-interactively-p 'interactive) topic)
  ;;     (setq topic (read-string "New topic: ")))
  (when (> (length topic) 0)
    (rcirc-send-string process (concat "TOPIC " target
                                       (concat " :" topic " | " rcirc-topic)))))

(setq gnutls-min-prime-bits 1024)
(setq rcirc-default-full-name "A. Sarkar")
(setq rcirc-default-user-name "asarkar")
(setq rcirc-fill-prefix "      ")
(setq rcirc-time-format "%H:%M ")
(setq rcirc-buffer-maximum-lines 500)
(setq rcirc-omit-threshold 0)
(setq rcirc-low-priority-chans nil)

(add-to-list 'rcirc-response-formats '("ACTION" . "* %N %m"))

(defun aksarkar-rcirc-hook ()
  (rcirc-track-minor-mode 1)
  (rcirc-omit-mode)
  (flyspell-mode 1)
  (if (member (buffer-name) rcirc-low-priority-chans)
      (setq rcirc-low-priority-flag t)))

(add-hook 'rcirc-mode-hook 'aksarkar-rcirc-hook)

(defun rcirc-mode-p (buffer-name)
  (eq (buffer-local-value 'major-mode (get-buffer buffer-name)) 'rcirc-mode))

(defun rcirc-track-clear-activity ()
  (interactive)
  (mapc 'rcirc-clear-activity
        (remove-if-not 'rcirc-mode-p (buffer-list)))
  (rcirc-update-activity-string)
  (force-mode-line-update t))

(define-key rcirc-mode-map (kbd "M-o") 'rcirc-omit-mode)

(defun er/mark-rcirc-line ()
  "Mark the current line"
  (interactive)
  (let ((pattern (concat "^\\([0-9]\\|" rcirc-prompt "\\)")))
    (if (looking-at pattern) (next-line))
    (search-forward-regexp pattern)
    (forward-line 0)
    (push-mark (point) t t)
    (search-backward-regexp pattern)))

(defun er/add-rcirc-mode-expansions ()
  (interactive)
  (make-variable-buffer-local 'er/try-expand-list)
  (setq er/try-expand-list (append er/try-expand-list '(er/mark-rcirc-line))))

(add-hook 'rcirc-mode-hook 'er/add-rcirc-mode-expansions)

(defvar rcirc-browse-url-history nil)
(defadvice rcirc-browse-url (around fix-history activate)
  (let* ((point       (point))
         (filtered    (rcirc-condition-filter
                       (lambda (x) (>= point (cdr x)))
                       rcirc-urls))
         (completions (mapcar 'car filtered))
         (default     (caar filtered)))
    (browse-url (completing-read "rcirc browse-url: "
                                 completions nil nil nil
                                 'rcirc-browse-url-history default)
                arg)))

(advice-add 'rcirc-handler-CAP :filter-args
 #'(lambda (all-args)
     (let ((cap-args (nth 2 all-args)))
       (while cap-args (if (string-match " +$" (car cap-args))
                           (setcar cap-args (substring (car cap-args) 0 (match-beginning 0))))
              (setq cap-args (cdr cap-args))))
     all-args))

(provide 'aksarkar-rcirc)
