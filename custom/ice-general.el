;; Fix shell path in OSX
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; OS X Keybindings
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char)
  (global-set-key (kbd "M-h") 'ns-do-hide-emacs))

(global-set-key (kbd "M-0") (lambda () (interactive) (elscreen-goto 0)))
(global-set-key (kbd "M-1") (lambda () (interactive) (elscreen-goto 1)))
(global-set-key (kbd "M-2") (lambda () (interactive) (elscreen-goto 2)))
(global-set-key (kbd "M-3") (lambda () (interactive) (elscreen-goto 3)))
(global-set-key (kbd "M-4") (lambda () (interactive) (elscreen-goto 4)))
(global-set-key (kbd "M-5") (lambda () (interactive) (elscreen-goto 5)))
(global-set-key (kbd "M-6") (lambda () (interactive) (elscreen-goto 6)))
(global-set-key (kbd "M-7") (lambda () (interactive) (elscreen-goto 7)))
(global-set-key (kbd "M-8") (lambda () (interactive) (elscreen-goto 8)))
(global-set-key (kbd "M-9") (lambda () (interactive) (elscreen-goto 9)))
(global-set-key (kbd "M-t") 'elscreen-create)
(global-set-key (kbd "M-w") 'elscreen-kill)
(global-set-key (kbd "M-q") 'save-buffers-kill-terminal)

;; GC on 20M
(setq gc-cons-threshold 20000000)

;; Newline at end of file
(setq require-final-newline t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . , temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" , temporary-file-directory t)))

;; autosave the undo-tree history
(setq undo-tree-history-directory-alist
      `((".*" . , temporary-file-directory)))
(setq undo-tree-auto-save-history t)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; No confirmation for new buffers
(setq confirm-nonexistent-file-or-buffer nil)
(setq ido-create-new-buffer 'always)

;; Show recent files
(require 'recentf)

;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

;; enable recent files mode.
(recentf-mode t)

; 50 files ought to be enough.
(setq recentf-max-saved-items 50)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;; Setup IDO with Flx
(require 'flx-ido)

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; disable alarm bell
(setq ring-bell-function 'ignore)

;; Enable dired find alternate file
(put 'dired-find-alternate-file 'disabled nil)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(define-key global-map (kbd "RET") 'newline-and-indent)

;; Smartparens
(require 'smartparens-config)

;; Projectile
(projectile-global-mode)

;; Visuals
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-linum-mode 1)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(load-theme 'monokai t)

(custom-set-variables '(neo-theme 'nerd))

(blink-cursor-mode -1)

(fset 'yes-or-no-p 'y-or-n-p)

(require 'diminish)
(eval-after-load "filladapt" '(diminish 'filladapt-mode))

(require 'powerline)
(display-time-mode t)

(provide 'ice-general)
