;; ----------------------------------------------------
;; 基本設定
;; ----------------------------------------------------

; 起動時の画面はいらない
(setq inhibit-startup-message t)

; ビープ音を鳴らさない
(setq visible-bell t)

; scratchバッファの初期メッセージを消す
(setq initial-scratch-message "")

; yes/no を y/n へ簡略化
(fset 'yes-or-no-p 'y-or-n-p)

; 複数の whitespace を削除
(setq backward-delete-char-untabify-method 'hungry)

; tab幅を４へ
(setq tab-width 4)

; 最終行に必ず一行挿入する
(setq require-final-newline t)

;;ミニ バッファ内でTABにより補完可能にする
(icomplete-mode 1)

;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; 括弧の自動挿入
(electric-pair-mode 1);; 括弧の自動挿入

;; Altキーを使用せずにMetaキーを使用
(setq w32-alt-is-meta t)

;; ----------------------------------------------------
;; 表示系
;; ----------------------------------------------------

;; 対応する括弧を光らせる。
(show-paren-mode 1)
(set-face-background 'show-paren-match-face (face-background 'default))
(set-face-foreground 'show-paren-match-face "#def")
(set-face-attribute 'show-paren-match-face nil :weight 'extra-bold)

;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)

;; カーソル行をハイライト
;; (global-hl-line-mode t)

;; font lock によりシンタックスハイライトを最大レベルに引き上げる
(global-font-lock-mode 1)

;画面を縦分割したときも行を折り返す
;(setq-default truncate-partial-width-windows nil)

; yank した文字列を強調表示
(when (or window-system (eq emacs-major-version '21))
  (defadvice yank (after ys:highlight-string activate)
    (let ((ol (make-overlay (mark t) (point))))
      (overlay-put ol 'face 'highlight)
      (sit-for 0.5)
      (delete-overlay ol)))
  (defadvice yank-pop (after ys:highlight-string activate)
    (when (eq last-command 'yank)
      (let ((ol (make-overlay (mark t) (point))))
        (overlay-put ol 'face 'highlight)
        (sit-for 0.5)
        (delete-overlay ol)))))

;; カーソルの点滅
(blink-cursor-mode 1)

;; 非アクティブウィンドウのカーソル表示
(setq-default cursor-in-non-selected-windows t)

(setq default-frame-alist
      (append '((width                . 85)  ; フレーム幅
                (height               . 38 ) ; フレーム高
    ;; (left                 . 70 ) ; 配置左位置
    ;; (top                  . 28 ) ; 配置上位置
                (line-spacing         . 0  ) ; 文字間隔
                (left-fringe          . 5 ) ; 左フリンジ幅
                (right-fringe         . 5 ) ; 右フリンジ幅
                (menu-bar-lines       . 1  ) ; メニューバー
                (tool-bar-lines       . 0  ) ; ツールバー
                (vertical-scroll-bars . 0  ) ; スクロールバー
                (scroll-bar-width     . 0 ) ; スクロールバー幅
                (cursor-type          . box) ; カーソル種別
                (alpha                . 100) ; 透明度
                ) default-frame-alist) )
(setq initial-frame-alist default-frame-alist)

;; スクロールバーを非表示
(scroll-bar-mode 0)

;; ----------------------------------------------------
;; file buck up 
;; ----------------------------------------------------

;; ファイルオープン時のバックアップ（~）
(setq make-backup-files   t)  ;; 自動バックアップの実行有無
(setq version-control     t)  ;; バックアップファイルへの番号付与
(setq kept-new-versions   3)  ;; 最新バックアップファイルの保持数
(setq kept-old-versions   0)  ;; 最古バックアップファイルの保持数
(setq delete-old-versions t)  ;; バックアップファイル削除の実行有無

;; ファイルオープン時のバックアップ（~）の格納ディレクトリ
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "/tmp/emacsbk"))
            backup-directory-alist))

;; 編集中ファイルの自動バックアップ
(setq backup-inhibited nil)

;; 終了時に自動バックアップファイルを削除
(setq delete-auto-save-files nil)

;; 編集中ファイルのバックアップ
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)

;; 編集中ファイルのバックアップ間隔（秒）
(setq auto-save-timeout 3)

;; 編集中ファイルのバックアップ間隔（打鍵）
(setq auto-save-interval 100)

;; 編集中ファイル（##）の格納ディレクトリ
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "/tmp/emacsbk") t)))

;; ロックファイルの生成を抑止
(setq create-lockfiles nil)


; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; init.el ends here

