(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
;; enables lsp-mode in all programming modes we can detec
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook ((python-mode . lsp)
         ;; optional: enable which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)))

(use-package ivy 
  :ensure t
  :config
  (ivy-mode 1))

(use-package magit
  :ensure t)

(use-package org
  :ensure t)

(use-package org-roam
  :ensure t)

;; Strongly consider remapping transpose keybinding to drag-stuff line
(use-package drag-stuff
  :ensure t)

(drag-stuff-global-mode -1)

(global-set-key (kbd "M-<up>") 'drag-stuff-up)
(global-set-key (kbd "M-<down>") 'drag-stuff-down)

(use-package dirvish
  :ensure t)

;; auto-fill-mode for org files
(setq-default fill-column 75) ;; or any number you prefer
(add-hook 'org-mode-hook #'auto-fill-mode)

;; shorter other window keybinding
(global-set-key (kbd "M-o") 'other-window) 
;; ace-window for tied to M-o
(global-set-key (kbd "M-o") 'ace-window)

(setq w32-rceognize-altgr nil)
(setq inhibit-startup-screen t)
(setq display-line-numbers-type 'relative)
(setq mouse-drag-and-drop-region t)
(setq python-shell-interpreter "py")

;; UI Improvements
(global-display-line-numbers-mode)
(column-number-mode)
(tool-bar-mode -1)
;; (menu-bar-mode -1)

;; disable line numbers for some modes
(dolist (mode '(term-mode-hook
		eshell-mode-hook))
  (add-hook mode(lambda () (display-line-numbers-mode 0))))

;; Theme settings
;;; -*- lexical-binding: t -*-
(custom-set-variables
 '(custom-enabled-themes '(leuven-dark))
 '(package-selected-packages
   '(ace-window
     dirvish
     drag-stuff
     ivy
     lsp-mode
     magit
     magit-find-file
     vdiff-magit)))
(custom-set-faces)
