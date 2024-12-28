;;;;;;;;;;;;;;;
;;; Uber
;;;;;;;;;;;;;;;


(add-to-list 'auto-mode-alist '("METADATA\\'" . yaml-mode))

(with-eval-after-load 'denote
  (setq denote-directory (expand-file-name "~/Uber/notes/denote")))

(setq bazel-command '("/Users/ivoreyes/Uber/ios/bazelw"))
