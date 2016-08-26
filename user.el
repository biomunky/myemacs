;; This is where your customizations should live

;; env PATH
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

;; Place downloaded elisp files in this directory. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")

;; Uncomment this to increase font size
;;(load-theme 'whiteboard t)
;;(load-theme 'spacemacs-light t)
;;(load-theme 'spacemacs-dark t)
;;(load-theme 'liso t)

(if (display-graphic-p)
    (load-theme 'wombat t)
  (load-theme 'spacemacs-dark t))

(set-face-attribute 'default nil :height 170)

;; Flyspell often slows down editing so it's turned off
(remove-hook 'text-mode-hook 'turn-on-flyspell)

(load "~/.emacs.d/vendor/clojure")

;; get auto-complete running for clojure once we run cider-jack-in
(require 'ac-nrepl)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))

(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))

;; auto complete always?
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

;; hippie expand - don't try to complete with file names
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name hippie-expand-try-functions-list))
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name-partially hippie-expand-try-functions-list))

(setq ido-use-filename-at-point nil)

;; Save here instead of littering current directory with emacs backup files
(setq backup-directory-alist `(("." . "~/.saves")))

;; load in rainbow-delimiters
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(add-hook 'clojure-nrepl-mode-hook 'ac-nrepl-setup)

;; undo tree
(require 'undo-tree)
(global-undo-tree-mode 1)

;; don't want line wrap
(set-default 'truncate-lines t)

(defun cider-namespace-refresh ()
  (interactive)
  (cider-interactive-eval
   "(require 'clojure.tools.namespace.repl)
    (clojure.tools.namespace.repl/refresh)"))

(define-key clojure-mode-map (kbd "M-r") 'cider-namespace-refresh)

;; flycheck mode
(add-hook 'after-init-hook #'global-flycheck-mode)

;; elixir
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-elixir")
(require 'elixir-mode)


(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "/Users/biomunky/go/bin")
(add-hook 'before-save-hook 'gofmt-before-save)
(require 'go-autocomplete)

(require 'alchemist)
(add-hook 'after-init-hook 'global-company-mode)

;; Reduce the time after which the company auto completion popup opens
(setq company-idle-delay 0.2)

;; Reduce the number of characters before company kicks in
(setq company-minimum-prefix-length 1)


;; RUST AND CARGO SPECIFIC STUFF FROM: http://jasonamyers.com/index.php/2015/11/21/configuring-emacs-for-rust-development/

;; Set path to racer binary
(setq racer-cmd "/Users/biomunky/.cargo/bin/racer")
;; Set path to rust src directory
(setq racer-rust-src-path "/Users/biomunky/bin/rust/src")
;; Load rust-mode when you open `.rs` files
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
;; Setting up configurations when you load rust-mode
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common) ;
(setq company-tooltip-align-annotations t)
(add-hook 'rust-mode-hook 'cargo-minor-mode)

;;

