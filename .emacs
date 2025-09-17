(custom-set-variables
 '(custom-enabled-themes '(deeper-blue))
 '(package-selected-packages '(corfu marginalia orderless treesit-auto vertico)))
(custom-set-faces
 )

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package vertico
  :ensure t
  :init
  (vertico-mode 1))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode))

(recentf-mode 1)
(setq recentf-max-saved-items 100)

(setq corfu-auto t
      corfu-auto-prefix 1
      corfu-auto-delay 0.1
      corfu-popupinfo-delay 0.2)

(setq enable-recursive-minibuffers t
      read-file-name-completion-ignore-case t)

(use-package treesit-auto
  :ensure t
  :config
  (setq treesit-auto-install 'prompt)
  (add-to-list 'treesit-auto-recipe-list '(c-mode . ("https://github.com/tree-sitter/tree-sitter-c")))
  (add-to-list 'treesit-auto-recipe-list '(c++-mode . ("https://github.com/tree-sitter/tree-sitter-cpp")))
  (add-to-list 'treesit-auto-recipe-list '(c3-mode . ("https://github.com/c3lang/tree-sitter-c3")))
  (global-treesit-auto-mode))

(add-to-list 'load-path "/home/foxkiana/.emacs.d/c3-ts-mode")
(require 'c3-ts-mode)

(add-to-list 'auto-mode-alist '("\\.c3\\'" . c3-ts-mode))

(define-key global-map (kbd "C-c C-c")
  (lambda ()
    (interactive)
    (let ((compile-command nil))
      (call-interactively 'compile))))

