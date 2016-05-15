;; ----------------------------------------------------
;; package @ recentf
;; ----------------------------------------------------

;; 最近使ったファイルの表示
(recentf-mode t)

;; key-bind
(bind-key* "C-x f" 'recentf-open-files)

(require 'recentf)
(setq recentf-save-file "~/.recentf")
(setq recentf-max-saved-items 1000)            ;; recentf に保存するファイルの数
(setq recentf-exclude '(".recentf"))           ;; .recentf自体は含まない
(setq recentf-auto-cleanup 10)                 ;; 保存する内容を整理
(run-with-idle-timer 60 t 'recentf-save-list)  ;; 30秒ごとに .recentf を保存
