# ============================================================
# .latexmkrc — Configuração do latexmk
# Uso: latexmk -pdf
# ============================================================

# Motor de compilação
$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';

# Usar bibtex (não biber)
$bibtex_use = 1;

# Gerar PDF diretamente
$pdf_mode = 1;

# Limpeza estendida
@generated_exts = ('aux', 'bbl', 'blg', 'fdb_latexmk', 'fls', 'log',
                   'out', 'synctex.gz', 'toc', 'lof', 'lot');
