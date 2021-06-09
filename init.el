;; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;; end straight.el

;;;;;;;;;;;;;;;;;;;;;;SETTINGS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(electric-pair-mode 1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(load-theme 'tango-dark)
(add-to-list 'default-frame-alist
	     '(font . "mononoki-18"))
;;;;;;;;;;;;;;;;;;;;;;PACKAGES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Evil: vim emulation
(straight-use-package 'evil)
(setq evil-want-keybinding nil)
(evil-mode 1)
(straight-use-package 'evil-collection)
(evil-collection-init)
;;; Evil leader
(straight-use-package 'evil-leader)
(global-evil-leader-mode) 
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "SPC" 'helm-M-x
  "e" 'helm-find-files
  "f" 'helm-find-files
  "h" 'helm-info
  "b" 'switch-to-buffer
  "w" 'save-buffer
  "q" 'kill-buffer)
;;; Autocomplete
(straight-use-package 'company)
(global-company-mode 1)
;;; Fast Search
(straight-use-package 'helm) ; fast search
(straight-use-package 'which-key)

;;;;;;;;;;;;;;;;;;;;;;CLOJURE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'clojure-mode)
;; (add-to-list 'load-path "~/.emacs.d/miracle") ; Clojure in Unity
;; (require 'miracle)
;; (add-hook 'clojure-mode-hook 'clojure-enable-miracle)
(straight-use-package
 '(clojure-complete
   :type git
   :host github
   :repo "sogaiu/clojure-complete"
   :branch "clr-support")) ; this branch for miracle

