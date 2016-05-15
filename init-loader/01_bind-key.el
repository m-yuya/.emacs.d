;; ----------------------------------------------------
;; package @ bind-key
;; ----------------------------------------------------

(require 'bind-key)           ;キーバインドの設定用 

;; bind-keyによってinitで設定したキーバインドを表示
;; その他のデフォルトのキーバインドなどは、ヘルプ（F1 F1）でｂを押すと一覧表示可能
(bind-key* "M-?" 'describe-personal-keybindings) 

;; キーバインドの定義

;; バックスペース
(keyboard-translate ?\C-h ?\C-?) ;C-h に backspace と同じ処理を割り当てる
(bind-key* "M-h" 'backward-kill-word) ; 一文字前の単語を削除

;; カーソル移動
(bind-key* (kbd "M-n") (kbd  "C-u 5 C-n")); M-n で 5行移動
(bind-key* (kbd "M-p") (kbd "C-u 5 C-p")); M-pで 5行移動

;; フォントサイズ調整
(bind-key (kbd "C-<wheel-up>")   '(lambda() (interactive) (text-scale-increase 1)))
(bind-key (kbd "C-+")            '(lambda() (interactive) (text-scale-increase 1)))
(bind-key (kbd "C-<wheel-down>") '(lambda() (interactive) (text-scale-decrease 1)))
(bind-key (kbd "C--")            '(lambda() (interactive) (text-scale-decrease 1)))

;; フォントサイズ リセット
(bind-key (kbd "M-0") '(lambda() (interactive) (text-scale-set 0)))

;; 日付挿入
(defun insert-current-time()
  (interactive)
  (insert (format-time-string "%Y/%m/%d" (current-time))))
(bind-key "C-t" `insert-current-time)

;; F5でバッファを更新
(bind-key* (kbd "<f5>") 'revert-buffer)
