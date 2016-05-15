;; ----------------------------------------------------
;; package @ browe-kill-ring
;; ----------------------------------------------------
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;;; kill ring に関する設定
(setq kill-ring-max 100)

(bind-key* "M-y" 'browse-kill-ring)
(setq browse-kill-ring-quit-action 'kill-and-delete-window)
(setq browse-kill-ring-separator "-------")
(setq browse-kill-ring-highlight-current-entry t)

