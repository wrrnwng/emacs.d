(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

(menu-bar-mode -1)

(setq visible-bell t)

(set-face-attribute 'default nil :font "Fira Code Retina" :height 120)

(load-theme 'wombat)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode)
(global-display-line-numbers-mode t)

(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package command-log-mode)

(use-package ivy
  :diminish
  :bind(("C-s" . swiper)
	:map ivy-minibuffer-map
	("TAB" . ivy-alt-done)
	("C-l" . ivy-alt-done)
	("C-j" . ivy-next-line)
	("C-k" . ivy-previous-line)
	:map ivy-switch-buffer-map
	("C-k" . ivy-previous-line)
	("C-l" . ivy-done)
	("C-d" . ivy-switch-buffer-kill)
	:map ivy-reverse-i-search-map
	("C-k" . ivy-previous-line)
	("C-d" . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(counsel ivy command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
