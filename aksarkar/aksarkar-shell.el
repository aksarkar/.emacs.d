(require 'comint)

(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

(defun er/inside-pipes ()
  "Mark a command in a shell pipeline, excluding delimiting pipe symbols"
  (interactive)
  (let ((begin-pattern "\\(^[[:space:]]*\\||[[:space:]]*\\)")
        (end-pattern "\\([[:space:]]*|\\|$\\)"))
    (search-forward-regexp end-pattern)
    (goto-char (match-beginning 0))
    (push-mark (point) t t)
    (search-backward-regexp begin-pattern)
    (goto-char (match-end 0))))

(defun er/outside-pipes ()
  "Mark a command in a shell pipeline, including delimiting pipe symbols"
  (interactive)
  (let ((pattern "\\(^[[:word:]]\\||\\|$\\)"))
    (when (looking-at pattern) (forward-word))
    (search-forward-regexp pattern)
    (push-mark (point) t t)
    (backward-char)
    (search-backward-regexp pattern)))

(defun er/add-shell-mode-expansions ()
  (interactive)
  (make-variable-buffer-local 'er/try-expand-list)
  (setq er/try-expand-list (append er/try-expand-list '(er/inside-pipes er/outside-pipes))))

(add-hook 'shell-mode-hook 'er/add-shell-mode-expansions)

(provide 'aksarkar-shell)
