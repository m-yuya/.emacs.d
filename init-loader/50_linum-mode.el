;; ----------------------------------------------------
;; linum-mode
;; ----------------------------------------------------

(require 'linum)

;; 行移動を契機に描画
(defvar linum-line-number 0)
(declare-function linum-update-current "linum" ())
(defadvice linum-update-current
    (around linum-update-current-around activate compile)
  (unless (= linum-line-number (line-number-at-pos))
    (setq linum-line-number (line-number-at-pos))
    ad-do-it
	))

;; バッファ中の行番号表示の遅延設定 0.2秒
(defvar linum-delay nil)
(setq linum-delay t)
(defadvice linum-schedule (around linum-schedule-around () activate)
(run-with-idle-timer 0.2 nil #'linum-update-current))


;; ;; バッファ中の行番号表示
(global-linum-mode)

;; ;; 行番号の書式
(defvar linum-format nil)
 (setq linum-format "%4d ")

;; 文字サイズ
(set-face-attribute 'linum nil :height 1.0)
