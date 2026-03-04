# Alchemon — Template TCC IEEE (LaTeX)

**Autor:** Mateus Nedel dos Reis  
**Instituição:** Universidade Franciscana — Curso de Tecnologias em Jogos Digitais  
**Formato:** IEEE Conference (IEEEtran)  
**Idioma:** Português (Brasil)

---

## Estrutura do Projeto

```
tcc-ieee/
├── main.tex                   ← Documento raiz
├── referencias.bib            ← Base de referências (BibTeX)
├── .latexmkrc                 ← Configuração do latexmk
├── figuras/                   ← Imagens e figuras (PNG, PDF, EPS)
└── sections/
    ├── 01_introducao.tex
    ├── 02_problema.tex
    ├── 03_objetivos.tex
    ├── 04_justificativa.tex
    ├── 05_fundamentacao.tex
    ├── 06_metodologia.tex
    ├── 07_planejamento_jogo.tex
    └── 08_conclusao.tex
```

---

## Compilação

### Opção 1 — latexmk (recomendado)
```bash
latexmk -pdf
```

### Opção 2 — Manual (pdflatex + bibtex)
```bash
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

### Limpeza de arquivos auxiliares
```bash
latexmk -c        # limpa auxiliares, mantém PDF
latexmk -C        # limpa tudo, inclusive o PDF
```

---

## Adicionar Figuras

Coloque as imagens na pasta `figuras/` e referencie assim:

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=\columnwidth]{nome_da_imagem}
    \caption{Legenda da figura.}
    \label{fig:label}
\end{figure}
```

> Formatos suportados por pdflatex: `.png`, `.jpg`, `.pdf`

---

## Adicionar Referências

Adicione entradas em `referencias.bib` e cite no texto:

```latex
% No texto:
\cite{chave_da_referencia}

% No .bib:
@article{chave_da_referencia,
    author  = {Sobrenome, Nome},
    title   = {Título do Artigo},
    journal = {Nome do Periódico},
    year    = {2024},
}
```

---

## Configuração no VS Code (LaTeX Workshop)

Adicione ao `settings.json`:

```json
{
  "latex-workshop.latex.tools": [
    {
      "name": "latexmk",
      "command": "latexmk",
      "args": ["-pdf", "-synctex=1", "-interaction=nonstopmode", "%DOC%"]
    }
  ],
  "latex-workshop.latex.recipes": [
    {
      "name": "latexmk",
      "tools": ["latexmk"]
    }
  ]
}
```

---

## Requisitos (Arch Linux / TeX Live)

```bash
sudo pacman -S texlive texlive-langarabic
# ou para instalação completa:
sudo pacman -S texlive-full
```

Pacotes necessários: `IEEEtran`, `babel-portuges`, `inputenc`, `fontenc`,
`graphicx`, `amsmath`, `hyperref`, `cite`, `booktabs`, `listings`, `xcolor`.
