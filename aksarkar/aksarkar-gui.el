; My solarized colors
(add-to-list 'custom-theme-load-path 
	     "~/.emacs.d/vendor/solarized")
(setq solarized-terminal-colors-for-daemon t)
(if (daemonp)
    (add-hook 'after-make-frame-functions
              #'(lambda (f) (with-selected-frame f
                              (load-theme 'solarized-light t))))
  (load-theme 'solarized-light t))

; Set window title
(setq frame-title-format '(buffer-file-name "%f - Emacs" "Emacs")) 

; Do not create newline on Ctrl-n.
(setq next-line-add-newlines nil)

; Turn off bell on error
(setq visible-bell nil)

; Scroll up/down one line only when cursor is at top/bottom of page.
(setq scroll-conservatively 1000)

; Auto fill lines
(setq-default fill-column 79)

; Stop forcing me to spell out "yes"
(fset 'yes-or-no-p 'y-or-n-p) 

; Put backups and autosaves in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups/")))

; Remove superfluous GUI
(menu-bar-mode -1)

; Disable splash screen
(setq inhibit-startup-message t)

; Disable scratch message
(setq initial-scratch-message nil)

; Enable syntax highlighting
(global-font-lock-mode 't)
(setq font-lock-support-mode 'jit-lock-mode)

; Show (in)correctly matched parantheses
(show-paren-mode t)
(electric-pair-mode)
(setq show-paren-style 'parenthesis)

; Disable blinking cursor
(setq visible-cursor nil)
(blink-cursor-mode 0)

; Modeline
(setq display-time-day-and-date nil)
(line-number-mode 1)
(column-number-mode 1)
(display-time-mode 1)
(setq-default mode-line-format
      '((line-number-mode " L%l ")
        (column-number-mode "C%c ")
        mode-line-modified
        " "
        mode-line-buffer-identification
        " "
        mode-line-modes
        global-mode-string))

; Always display line number
(setq line-number-display-limit nil)

; Always indent using spaces
(setq-default indent-tabs-mode nil)

; When mark is active, highlight selected region
(transient-mark-mode 1)

; Don't automatically page up/down when scrolling
(setq scroll-preserve-screen-position t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

; Scroll compilation mode
(setq compilation-scroll-output 'first-error)

(defun kill-this-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

; Suppress useless warnings
(setq warning-suppress-types '((alloc)))

(put 'narrow-to-region 'disabled nil)

(provide 'aksarkar-gui)
