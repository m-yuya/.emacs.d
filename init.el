;; init.el file for emacs

;; ----------------------------------------------------
;; site-lisp
;; ----------------------------------------------------

;; site-lisp内のファイルを読み込む
(let ( (default-directory
         (file-name-as-directory (concat user-emacs-directory "site-lisp")))
       )
  (add-to-list 'load-path default-directory)
  (normal-top-level-add-subdirs-to-load-path) 
)


;; ----------------------------------------------------
;; package @ package
;; ----------------------------------------------------

(require 'package)
;; パッケージの追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;; elpa内のファイルを読み込む

(package-initialize)


;; ----------------------------------------------------
;; package @ init-loader
;; ----------------------------------------------------

(require 'init-loader)

;; エラーがあるときはerror-logを表示
(setq init-loader-show-log-after-init 'error-only)
;; エラーがあるファイルは読み込まずエラーも出さない
;; (setq init-loader-show-log-after-init nil)

;; inits内のファイルを読み込む
(init-loader-load "~/.emacs.d/init-loader")

;; init.el ends here
