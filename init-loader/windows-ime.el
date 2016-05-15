;; --------------------------------------------------
;; IME
;; --------------------------------------------------

;; モードラインの表示文字列
(setq-default w32-ime-mode-line-state-indicator "[Aa] ")
(setq w32-ime-mode-line-state-indicator-list '("[Aa]" "[あ]" "[Aa]"))

;; 漢字/変換キー入力時のエラーメッセージ抑止
(bind-key "<M-kanji>" 'ignore)
(bind-key "<kanji>" 'ignore)

;; IME無効／有効時のカーソルカラー定義
(unless (facep 'cursor-ime-off)
  (make-face 'cursor-ime-off)
  (set-face-attribute 'cursor-ime-off nil
                      :background "DarkRed" :foreground "White")
  )
(unless (facep 'cursor-ime-on)
  (make-face 'cursor-ime-on)
  (set-face-attribute 'cursor-ime-on nil
                      :background "DarkGreen" :foreground "White")
  )

;; IME無効／有効時のカーソルカラー設定
(add-hook
 'input-method-inactivate-hook
 '(lambda()
    (if (facep 'cursor-ime-off)
        (let ( (fg (face-attribute 'cursor-ime-off :foreground))
               (bg (face-attribute 'cursor-ime-off :background)) )
          (set-face-attribute 'cursor nil :foreground fg :background bg)
          )
      )
    )
 )
(add-hook
 'input-method-activate-hook
 '(lambda()
    (if (facep 'cursor-ime-on)
        (let ( (fg (face-attribute 'cursor-ime-on :foreground))
               (bg (face-attribute 'cursor-ime-on :background)) )
          (set-face-attribute 'cursor nil :foreground fg :background bg)
          )
      )
    )
 )

;; バッファ切り替え時の状態引継ぎ設定
(setq w32-ime-buffer-switch-p nil)
