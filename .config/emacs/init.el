;; Custom file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (and custom-file
           (file-exists-p custom-file))
  (load custom-file nil :nomessage))

;; Crafted Emacs
(load "~/crafted-emacs/modules/crafted-init-config")

;; Packages
(require 'crafted-ui-packages)
(require 'crafted-completion-packages)
(require 'crafted-ide-packages)
(require 'crafted-org-packages)
(require 'crafted-workspaces-packages)

(add-to-list 'package-selected-packages 'lsp-pyright)
(add-to-list 'package-selected-packages 'meow)
(add-to-list 'package-selected-packages 'no-littering)

(package-install-selected-packages :noconfirm)

;; Crafted Emacs Config
(require 'crafted-osx-config)
(require 'crafted-defaults-config)
(require 'crafted-ui-config)
(require 'crafted-completion-config)
(require 'crafted-ide-config)
(require 'crafted-org-config)
(require 'crafted-workspaces-config)

;; Littering
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

;; UI
(toggle-frame-maximized)
(setq inhibit-startup-screen t)
(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . dark))

(setq use-dialog-box nil)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Files
(recentf-mode 1)
(setq recentf-max-saved-items 50)
(setq recentf-max-menu-items 15)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(save-place-mode 1)
(setq require-final-newline t)

;; Minibuffer
(setq history-length 25)
(savehist-mode 1)


;; Theme
(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs t
      modus-themes-fringes 'subtle
      modus-themes-paren-match '(bold)
      modus-themes-region '(bg-only)
      modus-themes-mode-line '(accented borderless (padding 4) (height 0.9)))

(load-theme 'modus-vivendi t)

;; Editing
(electric-pair-mode 1)

;; Meow
;; (meow-setup-indicator)
;; (meow-global-mode nil) 

;; Tree-Sitter
;; Call `M-x treesit-install-language-grammar` to install each grammar
(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

;; (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))

;; project.el
(setq project-ignore-regexp "")
(setq project-ignore-regexp
      (concat project-ignore-regexp "\\|" "/bazel-bin/"))
(setq project-ignore-regexp
      (concat project-ignore-regexp "\\|" "/bazel-out/"))
(setq project-ignore-regexp
      (concat project-ignore-regexp "\\|" "/bazel-ios/"))
(setq project-ignore-regexp
      (concat project-ignore-regexp "\\|" "/vendor/"))

;; Org-mode
(setq org-src-preserve-indentation t)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)))

;; LSP
(setq lsp-pyright-auto-search-paths t)
(setq lsp-pyright-include ["tools"])
(setq lsp-pyright-extra-paths ["tools"])
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]apps\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]libraries\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]bin\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]bazel-bin\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]bazel-out\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]bazel-ios\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]bazel-testlogs\\'"))
(setq lsp-file-watch-threshold nil)
(add-hook 'python-mode-hook (lambda ()
                              (require 'lsp-pyright)
                              (lsp-deferred)))

;; Python
(setq python-check-command (concat "/opt/uber/ios-devex/python-3.8.4/bin/black -S " (interactive (buffer-file-name))))

;; Profile emacs startup
(setq gc-cons-threshold (* 2 1000 1000))
(defun crafted-startup-example/display-startup-time ()
  "Display the startup time after Emacs is fully initialized."
  (message "Crafted Emacs loaded in %s."
           (emacs-init-time)))
(add-hook 'emacs-startup-hook #'crafted-startup-example/display-startup-time)

