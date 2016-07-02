(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

(require 'ruby-end)

(require 'evil)
(evil-mode 1)

(tool-bar-mode -1)
(toggle-scroll-bar -1)
(menu-bar-mode -1)

(global-linum-mode t)
(load-theme 'zenburn t)

(custom-set-variables
 '(custom-safe-themes
   (quote
    ("40f6a7af0dfad67c0d4df2a1dd86175436d79fc69ea61614d668a635c2cd94ab" default))))


(projectile-global-mode)
(add-hook 'ruby-mode-hook 'projectile-on)
(add-hook 'ruby-mode-hook 'ido-mode)

;; ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; Display ido results vertically, rather than horizontally
(setq ido-decorations
      (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
  (defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
  (add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
  (defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
    (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
    (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
  (add-hook 'ido-setup-hook 'ido-define-keys)


;; neotree
;; (require 'neotree)
;; (global-set-key (kbd "C-x C-d") 'neotree-toggle)

;; powerline
(require 'powerline)
(powerline-default-theme)

;; ruby
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(setq ruby-deep-indent-paren nil)

(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)

;; (add-hook 'ehn-ruby-mode 'robe-mode)
;; (autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
;; (add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
;; (add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))


;; auto-complete
;; (ac-config-default)
;; (add-hook 'robe-mode-hook 'ac-robe-setup)


;; Keybinding
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c r r") 'inf-ruby)

