(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)

;; active markdown-mode on .md file
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
