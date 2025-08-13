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


;; (setq magit-section-initial-visibility-alist
;;      '((untracked . show)))

;; shorter other window keybinding
(global-set-key (kbd "M-o") 'other-window) 

;; arrow key keybinding for window navigation
(windmove-default-keybindings)

;; ace-window for tied to M-o
(global-set-key (kbd "M-o") 'ace-window)

;; right alt to regular alt (alt-gr?) for ergonomics
(setq w32-recognize-altgr nil)

;; UI Improvements
(column-number-mode)
(global-display-line-numbers-mode)
(tool-bar-mode -1)

;; eisable lin numbers for some modes
(dolist (mode '(term-mode-hook
		eshell-mode-hook))
  (add-hook mode(lambda () (display-line-numbers-mode 0))))

;; Theme settings
;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(leuven-dark))
 '(global-tab-line-mode t)
 '(package-selected-packages
   '(ace-window ivy lsp-mode magit magit-find-file vdiff-magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
