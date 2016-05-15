;;======================================================================
;; AUCtex
;;======================================================================

;; まるごと藤田さんのinit.elより拝借
;(require 'auctex)
(setq-default TeX-master t)
(load "auctex.el" nil t t)

(setq japanese-TeX-command-default "pTeX")
(setq japanese-LaTeX-command-default "pLaTeX")
(setq TeX-default-mode 'japanese-latex-mode)
;(server-start)
;(setq latex-run-command "platex -src")
(setq tex-command "platex -src")
(add-hook 'LaTeX-mode-hook
   (function (lambda ()
      (TeX-source-correlate-mode 1)
      (setq TeX-source-correlate-start-server t)
      (add-to-list 'TeX-command-list
	 '("pLaTeX" "platex -src %t"
	   TeX-run-TeX nil (latex-mode) :help "Run e-pLaTeX"))
)))

; \documentclass{jsarticle} を標準にする
(setq japanese-LaTeX-default-style "jsarticle")
(setq kinsoku-limit 10)
;; (setq TeX-view-program-list
;;       '(("DVIviewer" "/c/w32tex/dviout/dviout.exe %o")
;;         ("PDFviewer" "/c/Program Files (x86)/Adobe/Reader 11.0/Reader/AcroRd32.exe %o"))
;;       )
;; (setq TeX-view-program-selection '((output-dvi "DVIviewer") (output-pdf "PDFviewer")))

(setq-default tab-width 4)
(setq tab-stop-list
      '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

(setq preview-image-type 'dvipng)
(setq TeX-source-correlate-method 'synctex)
(setq TeX-source-correlate-start-server t)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) 
(add-hook 'LaTeX-mode-hook
   (function (lambda ()
      (add-to-list 'TeX-command-list
     '("pdfpLaTeX" "platex -kanji=utf8 -guess-input-enc %S %(mode) %t && dvipdfmx %d"
       TeX-run-TeX nil (latex-mode) :help "Run pLaTeX and dvipdfmx"))
      (add-to-list 'TeX-command-list
     '("pdfpLaTeX2" "platex -kanji=utf8 -guess-input-enc %S %(mode) %t && dvips -Ppdf -z -f %d | convbkmk -g > %f && ps2pdf.bat %f"
       TeX-run-TeX nil (latex-mode) :help "Run pLaTeX, dvips, and ps2pdf"))
      (add-to-list 'TeX-command-list
     '("pdfupLaTeX" "uplatex -kanji=utf8 -no-guess-input-enc %S %(mode) %t && dvipdfmx %d"
       TeX-run-TeX nil (latex-mode) :help "Run upLaTeX and dvipdfmx"))
      (add-to-list 'TeX-command-list
     '("pdfupLaTeX2" "uplatex -kanji=utf8 -no-guess-input-enc %S %(mode) %t && dvips -Ppdf -z -f %d | convbkmk -u > %f && ps2pdf.bat %f"
       TeX-run-TeX nil (latex-mode) :help "Run upLaTeX, dvips, and ps2pdf"))
      (add-to-list 'TeX-command-list
     '("Latexmk" "latexmk %t"
       TeX-run-TeX nil (latex-mode) :help "Run Latexmk"))
      (add-to-list 'TeX-command-list
     '("Latexmk-pdfpLaTeX" "latexmk -e \"$latex=q/platex %%O -kanji=utf8 -guess-input-enc %S %(mode) %%S/\" -e \"$bibtex=q/pbibtex %%O -kanji=utf8 %%B/\" -e \"$makeindex=q/mendex %%O -U -o %%D %%S/\" -e \"$dvipdf=q/dvipdfmx %%O -o %%D %%S/\" -norc -gg -pdfdvi %t"
       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-pdfpLaTeX"))
      (add-to-list 'TeX-command-list
     '("Latexmk-pdfpLaTeX2" "latexmk -e \"$latex=q/platex %%O -kanji=utf8 -guess-input-enc %S %(mode) %%S/\" -e \"$bibtex=q/pbibtex %%O -kanji=utf8 %%B/\" -e \"$makeindex=q/mendex %%O -U -o %%D %%S/\" -e \"$dvips=q/dvips %%O -z -f %%S | convbkmk -g > %%D/\" -e \"$ps2pdf=q/ps2pdf.bat %%O %%S %%D/\" -norc -gg -pdfps %t"
       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-pdfpLaTeX2"))
      (add-to-list 'TeX-command-list
     '("Latexmk-pdfupLaTeX" "latexmk -e \"$latex=q/uplatex %%O -kanji=utf8 -no-guess-input-enc %S %(mode) %%S/\" -e \"$bibtex=q/upbibtex %%O %%B/\" -e \"$makeindex=q/mendex %%O -U -o %%D %%S/\" -e \"$dvipdf=q/dvipdfmx %%O -o %%D %%S/\" -norc -gg -pdfdvi %t"
       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-pdfupLaTeX"))
      (add-to-list 'TeX-command-list
     '("Latexmk-pdfupLaTeX2" "latexmk -e \"$latex=q/uplatex %%O -kanji=utf8 -no-guess-input-enc %S %(mode) %%S/\" -e \"$bibtex=q/upbibtex %%O %%B/\" -e \"$makeindex=q/mendex %%O -U -o %%D %%S/\" -e \"$dvips=q/dvips %%O -z -f %%S | convbkmk -u > %%D/\" -e \"$ps2pdf=q/ps2pdf.bat %%O %%S %%D/\" -norc -gg -pdfps %t"
       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-pdfupLaTeX2"))
      (add-to-list 'TeX-command-list
     '("Latexmk-pdfLaTeX" "latexmk -e \"$pdflatex=q/pdflatex %%O %S %(mode) %%S/\" -e \"$bibtex=q/bibtex %%O %%B/\" -e \"$makeindex=q/makeindex %%O -o %%D %%S/\" -norc -gg -pdf %t"
       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-pdfLaTeX"))
      (add-to-list 'TeX-command-list
    '("Latexmk-LuaLaTeX" "latexmk -e \"$pdflatex=q/lualatex %%O %S %(mode) %%S/\" -e \"$bibtex=q/bibtexu %%O %%B/\" -e \"$makeindex=q/texindy %%O -o %%D %%S/\" -norc -gg -lualatex %t"
       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-LuaLaTeX"))
      (add-to-list 'TeX-command-list
     '("Latexmk-LuaJITLaTeX" "latexmk -e \"$pdflatex=q/luajitlatex %%O %S %(mode) %%S/\" -e \"$bibtex=q/bibtexu %%O %%B/\" -e \"$makeindex=q/texindy %%O -o %%D %%S/\" -norc -gg -lualatex %t"
       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-LuaJITLaTeX"))
      (add-to-list 'TeX-command-list
     '("Latexmk-XeLaTeX" "latexmk -e \"$pdflatex=q/xelatex %%O %S %(mode) %%S/\" -e \"$bibtex=q/bibtexu %%O %%B/\" -e \"$makeindex=q/texindy %%O -o %%D %%S/\" -norc -gg -xelatex %t"
       TeX-run-TeX nil (latex-mode) :help "Run Latexmk-XeLaTeX"))
      (add-to-list 'TeX-command-list
     '("pBibTeX" "pbibtex -kanji=utf8 %s"
        TeX-run-BibTeX nil t :help "Run pBibTeX"))
      (add-to-list 'TeX-command-list
     '("upBibTeX" "upbibtex %s"
       TeX-run-BibTeX nil t :help "Run upBibTeX"))
      (add-to-list 'TeX-command-list
     '("BibTeXu" "bibtexu %s"
       TeX-run-BibTeX nil t :help "Run BibTeXu"))
      (add-to-list 'TeX-command-list
     '("Mendex" "mendex -U %s"
       TeX-run-command nil t :help "Create index file with mendex"))
      (add-to-list 'TeX-command-list
     '("TeXworks" "texworks %s.pdf"
       TeX-run-discard-or-function t t :help "Run TeXworks"))
      (add-to-list 'TeX-command-list
     '("SumatraPDF" "powershell -Command \"& {$r = Write-Output %o;$t = Write-Output %b;$o = [System.String]::Concat('\"\"\"',[System.IO.Path]::GetFileNameWithoutExtension($r),'.pdf','\"\"\"');$b = [System.String]::Concat('\"\"\"',[System.IO.Path]::GetFileNameWithoutExtension($t),'.tex','\"\"\"');Start-Process SumatraPDF -ArgumentList ('-reuse-instance',$o,'-forward-search',$b,%n)}\""
       TeX-run-discard-or-function t t :help "Forward search with SumatraPDF"))
      (add-to-list 'TeX-command-list
     '("fwdsumatrapdf" "fwdsumatrapdf %s.pdf \"%b\" %n"
       TeX-run-discard-or-function t t :help "Forward search with SumatraPDF"))
      (add-to-list 'TeX-command-list
     '("Firefox" "powershell -Command \"& {$r = Write-Output %o;$o = [System.String]::Concat('\"\"\"',[System.IO.Path]::GetFileNameWithoutExtension($r),'.pdf','\"\"\"');Start-Process firefox -ArgumentList ('-new-window',$o)}\""
       TeX-run-discard-or-function t t :help "Run Mozilla Firefox"))
      (add-to-list 'TeX-command-list
     '("Chrome" "powershell -Command \"& {$r = Write-Output %s.pdf;$o = [System.String]::Concat('\"\"\"',[System.IO.Path]::GetFullPath($r),'\"\"\"');Start-Process chrome -ArgumentList ('--new-window',$o)}\""
       TeX-run-discard-or-function t t :help "Run Chrome PDF Viewer"))
      (add-to-list 'TeX-command-list
     '("pdfopen" "pdfopen --rxi --file %s.pdf"
        TeX-run-discard-or-function t t :help "Run Adobe Reader")))))

