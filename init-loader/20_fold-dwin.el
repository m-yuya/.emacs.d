;; ----------------------------------------------------
;; package @ fold-dwin
;; ----------------------------------------------------

;; ブロック{}の折畳みと展開
;; http://www.dur.ac.uk/p.j.heslin/Software/Emacs/Download/fold-dwim.el
(when (require 'fold-dwim nil t)0123
  (require 'hideshow nil t)
  ;; 機能を利用するメジャーモード一覧
  (let ((hook))
    (dolist (hook
             '(emacs-lisp-mode-hook
               c-mode-common-hook
               python-mode-hook
			   scilab-mode-hook
               php-mode-hook
               ruby-mode-hook
               js2-mode-hook
               css-mode-hook
               apples-mode-hook))
      (add-hook hook 'hs-minor-mode))))

;; キーバインド
(bind-key (kbd "<f2>") 'fold-dwim-toggle) ;カーソル周辺の折り畳み＆展開
(bind-key (kbd "<C-f2>") 'fold-dwim-hide-all) ;全て折りたたむ
(bind-key (kbd "<M-f2>") 'fold-dwim-show-all)   ;全て展開する
