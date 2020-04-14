(package-initialize)

(require 'package)
(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("GNU ELPA"     . 10)
        ("MELPA Stable" . 5)
        ("MELPA"        . 0)))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(package-selected-packages
   (quote
    (flycheck dumb-jump speedbar-git-respect helm projectile company multiple-cursors rust-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;https://krsoninikhil.github.io/2018/12/15/easy-moving-from-vscode-to-emacs/
 (defun duplicate-line ()
   (interactive)
   (save-mark-and-excursion
     (beginning-of-line)
     (insert (thing-at-point 'line t))))

(global-set-key (kbd "C-S-d") 'duplicate-line)

 (defun move-line-down ()
   (interactive)
   (let ((col (current-column)))
     (save-excursion
       (forward-line)
       (transpose-lines 1))
     (forward-line)
     (move-to-column col)))

 (defun move-line-up ()
   (interactive)
   (let ((col (current-column)))
     (save-excursion
       (forward-line)
       (transpose-lines -1))
     (forward-line -1)
     (move-to-column col)))

 (global-set-key (kbd "C-S-j") 'move-line-down)
 (global-set-key (kbd "C-S-k") 'move-line-up)

 (require 'multiple-cursors)
 (global-set-key (kbd "C-|") 'mc/edit-lines)
 (global-set-key (kbd "C->") 'mc/mark-next-like-this)
 (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
 (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
 (global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
 (define-key mc/keymap (kbd "<return>") nil)

(add-hook 'after-init-hook 'global-company-mode)

 (require 'projectile)
 (setq projectile-indexing-method 'alien)
 (setq projectile-enable-caching t)
 (projectile-global-mode)

 (require 'helm)
 (require 'helm-config)
 (global-set-key (kbd "C-c h") 'helm-command-prefix)
 (global-unset-key (kbd "C-x c"))
 (helm-autoresize-mode 1)
 (global-set-key (kbd "M-x") 'helm-M-x)
 (setq helm-M-x-fuzzy-match t)
 (global-set-key (kbd "C-x C-f") 'helm-find-files)
(helm-mode 1)

(global-set-key (kbd "<f8>") 'speedbar)

 (dumb-jump-mode)

(setq rust-format-on-save t)

(define-key rust-mode-map (kbd "C-c C-c") 'rust-run)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
