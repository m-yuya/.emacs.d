;; ----------------------------------------------------
;; package @ recentf
;; ----------------------------------------------------

(require 'recentf)
(require 'recentf-ext)

;; 最近使ったファイルの表示
(recentf-mode t)

;; key-bind
(bind-key* "C-x f" 'recentf-open-files)

;; ~/.emacs.d内に履歴ファイルを保存
(setq recentf-save-file "~/.emacs.d/.recentf")
(recentf-load-list)

(setq recentf-max-saved-items 1000)            ;; recentf に保存するファイルの数
(setq recentf-auto-cleanup 10)                 ;; 保存する内容を整理
(run-with-idle-timer 60 t 'recentf-save-list)  ;; 60秒ごとに .recentf を保存
