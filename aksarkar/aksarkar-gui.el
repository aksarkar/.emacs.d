; My solarized colors
(add-to-list 'custom-theme-load-path 
	     "~/.emacs.d/vendor/emacs-color-theme-solarized")
(load-theme 'solarized-light t)

; Get around UNIX selection nonsense
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

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
(setq display-time-day-and-date nil)
(line-number-mode 1)
(column-number-mode 1)
(which-function-mode 1)
(setq default-mode-line-format
      (quote ("-" (line-number-mode "L%l-")
	      (column-number-mode "C%c-")
	      mode-line-modified mode-line-frame-identification
	      mode-line-buffer-identification " "
	      global-mode-string " ("
	      mode-name mode-line-process minor-mode-alist "%n" ")-"
	      (which-func-mode ("" which-func-format "-"))
          (-3 . "%p") "-%-")))

; Always display line number
(setq line-number-display-limit nil)

; Always indent using spaces
(setq-default indent-tabs-mode nil)

; When mark is active, highlight selected region
(transient-mark-mode 1)

; Don't automatically page up/down when scrolling
(setq scroll-preserve-screen-position t)

; Enable incremental completion
(icomplete-mode 1)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(provide 'aksarkar-gui)
