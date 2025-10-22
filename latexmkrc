# latexmkrc
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error';
$pdf_mode = 1;
$aux_dir  = 'build';     # optional: to separate aux files
$out_dir  = 'build';     # optional: for output files like PDF

# Enable bibtex for bibliography processing
$bibtex_use = 2;         # Use bibtex when .bib files detected
$bibtex = 'bibtex %O %S';

# Create build dir if needed
mkdir $out_dir unless -d $out_dir;
