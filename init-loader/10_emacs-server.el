;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; server-gnupack                                                        ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; emacs-server起動
;; (require 'server)
;; (defun server-ensure-safe-dir (dir) "Noop" t)
;; (setq server-socket-dir "~/")
;; (unless (server-running-p)
;;   (server-start)
;; )
 (require 'server)
 (unless (server-running-p) (server-start))

