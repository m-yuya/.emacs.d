;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ auto-complete(補完)
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; ※ac-dabbrevにより動的補完も補完候補に表示
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict") ;辞書の設定

(ac-config-default)

;; グローバルでauto-completeを利用
(global-auto-complete-mode t)

;; 強制的に有効するモードの指定（辞書に候補がなければ動的補完のみ表示）
;; その他のモードでは対応する辞書があれば起動
(add-to-list 'ac-modes 'text-mode)         
(add-to-list 'ac-modes 'fundamental-mode)  
(add-to-list 'ac-modes 'yatex-mode)
(add-to-list 'ac-modes 'latex-mode)
(add-to-list 'ac-modes 'org-mode)
 
(setq ac-delay 0.1)  ;; n秒後に補完開始
(setq ac-use-fuzzy t)  ;; 曖昧マッチ有効
(setq ac-use-comphist 0)  ;; 補完推測機能有効
(setq ac-auto-show-menu 0.2)  ;; n秒後に補完メニューを表示
(setq ac-quick-help-delay 9999)  ;; n秒後にクイックヘルプを表示(クイックヘルプの表示にバグがあるので表示を遅くした)
(setq ac-ignore-case 0)  ;; 大文字・小文字を区別しない
(setq ac-auto-start 4)  ;; n文字以上の単語の時に補完を開始


