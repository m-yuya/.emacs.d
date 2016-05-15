;; ----------------------------------------------------
;; package @ undo-tree
;; ----------------------------------------------------

(require 'undo-tree)
(global-undo-tree-mode t)

;; キーバインド
(bind-key "M-/" 'undo-tree-visualize)
