;;;;;;;;;;;;;;;;;;;;;;;;COLBY DEHART'S;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;HORRIBLE WONDERFUL;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;INIT.EL;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
	     '(font . "mononoki-24"))

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
(straight-use-package 'helm)
(straight-use-package 'which-key)
(setq which-key-mode 1)

;;;;;;;;;;;;;;;;;;;;;;CLOJURE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'clojure-mode)

