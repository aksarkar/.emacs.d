; My solarized colors
(add-to-list 'custom-theme-load-path 
	     "~/.emacs.d/vendor/solarized")
(setq solarized-diff-mode 'low)
(load-theme 'solarized-dark t)
(load-theme 'solarized-light t)

(defun aksarkar-night ()
  (interactive)
  (disable-theme 'solarized-light)
  (load-theme 'solarized-dark t))

(defun aksarkar-day ()
  (interactive)
  (disable-theme 'solarized-dark)
  (load-theme 'solarized-light t))

; Get around UNIX selection nonsense
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(setq save-interprogram-paste-before-kill t)

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
(scroll-bar-mode -1)
(tool-bar-mode -1)
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
(setq show-paren-style 'parenthesis)

; Disable blinking cursor
(blink-cursor-mode 0)

; Modeline
(setq display-time-day-and-date t)
(line-number-mode 1)
(column-number-mode 1)
(display-time-mode t)
(display-battery-mode 1)
(setq battery-mode-line-format " (%p%%) ")
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

; Insert pairs automatically
(electric-pair-mode t)

; Deal with sentences properly
(setq sentence-end-double-space nil)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

; Scroll compilation mode
(setq compilation-scroll-output 'first-error)

(defun kill-this-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(require 'pdf-tools)
(pdf-tools-install)

(setq dired-dwim-target t)

(provide 'aksarkar-gui)
