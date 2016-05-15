;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; Aspell(スペルチェック)
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

(add-to-list 'exec-path "/c/Program Files (x86)/Aspell/bin")

;; スペルチェッカとしてaspellを指定
(setq-default ispell-program-name "aspell")

;; 日本語混じりのTeX文書でスペルチェック
(eval-after-load "ispell"
'(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
