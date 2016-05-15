;;======================================================================
;; org-mode 
;;======================================================================

;; require しておかないとエクポートオプションに最初表示されない。
(require 'ox-html)
(require 'ox-md)

;;======================================================================
;; org-mode for latex
;;======================================================================

;; 行の折り返し表示
(setq org-startup-truncated nil)

(require 'ox-latex)
(require 'ox-bibtex)

;;; org-mode と latex-mode 
(defvar toggle-latex-modechange-tmp-mode-name 'latex-mode)
(defun toggle-latex-modechange ()
  (interactive)
  (if (equal major-mode 'org-mode)
      (funcall toggle-latex-modechange-tmp-mode-name)
    (set (make-local-variable 'toggle-latex-modechange-tmp-mode-name) major-mode)
    (org-mode)))
(bind-key "M-1" 'toggle-latex-modechange)

;;; org-modeをLaTeXを介してPDFに変換するためのコマンド
(setq org-latex-pdf-process
      '("platex %f"
        "platex %f"
        "pbibtex %b"
        "platex %f"
        "platex %f"
        "dvipdfmx %b.dvi"
		"rm %b.bbl %b.aux %b.blg %b.log "
		))

;;; \hypersetup{...} を出力しない
(setq org-latex-with-hyperref nil)

(setq org-export-latex-coding-system 'euc-jp-unix)
(setq org-export-latex-date-format "%Y-%m-%d")
(setq org-export-latex-classes nil)

;; org-mode latex-classの設定
(add-to-list 'org-latex-classes
             '("jarticle"
               "\\documentclass[twocolumn]{jarticle}
                [NO-PACKAGES]
                [NO-DEFAULT-PACKAGES]
                \\usepackage[top=20truemm,bottom=20truemm,left=15truemm,right=15truemm]{geometry}
			    \\usepackage{longtable}
			    \\usepackage{float}
			    \\usepackage{wrapfig}
			    \\usepackage{amsmath,amssymb}
                \\usepackage{ulem}
                \\usepackage{listings, jlisting}
                \\renewcommand{\\lstlistingname}{コード}
                \\usepackage{color}
                \\usepackage[dvipdfmx]{graphicx}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("IEEE"
               "\\documentclass[conference,compsoc]{IEEEtran}
                [NO-PACKAGES]
                [NO-DEFAULT-PACKAGES]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-latex-classes
             '("thesis"
			   "\\documentclass[a4j,12pt,oneside,openany,english]{jsbook}
                [NO-PACKAGES]
                [NO-DEFAULT-PACKAGES]
\\usepackage{graphicx}
\\usepackage{amssymb}
\\usepackage{amsmath}
\\usepackage{latexsym}
\\usepackage{book2report}
\\usepackage{thesis}"
			   ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

