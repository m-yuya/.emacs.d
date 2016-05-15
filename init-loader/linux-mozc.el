
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; mozc-Ubuntu
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; Ubuntu用にMozcをデフォルト設定　C-\で切り替え
(require 'mozc)
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'echo-area)	;MiniBuffaに候補を表示

;; Ubuntu用mozac on/off カーソル色設定

(add-hook 'input-method-activate-hook
  (lambda() (set-cursor-color "DarkGreen")))
(add-hook 'input-method-inactivate-hook
  (lambda() (set-cursor-color "DarkRed")))
