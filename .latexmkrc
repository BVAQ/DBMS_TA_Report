# latexmk configuration: just run `latexmk` in this folder.
$pdf_mode = 1;                 # 1 = pdflatex, 5 = xelatex, 4 = lualatex
$out_dir  = 'build';           # keep aux files out of the source tree
$aux_dir  = 'build';
$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$bibtex_use = 2;               # run bibtex when needed, clean .bbl on cleanup
$clean_ext = 'synctex.gz bbl run.xml';
