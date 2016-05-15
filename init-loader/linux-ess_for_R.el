;; -- for ess-mode
;; 拡張子が r, R の場合に R-mode を起動
(add-to-list 'auto-mode-alist '("\\.[rR]$" . R-mode))

;; 起動する時に ess-site をロード
(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)
(autoload 'R "ess-site" "start R" t)

;; R 起動時にワーキングディレクトリを訊ねない
(setq ess-ask-for-ess-directory nil)
