# texlive-ubuntu

## ~/.latexmkrc

```perl
$lualatex = 'lualatex -synctex=1 -interaction=nonstopmode %O %S';
$pdf_mode = 4;
```

## LaTeX Workshop

```jsonc
{
  "[latex]": {
    "editor.wordWrap": "on",
    "editor.defaultFormatter": "James-Yu.latex-workshop"
  },
  "latex-workshop.latex.recipes": [
    {
      "name": "latexmk",
      "tools": ["latexmk"]
    }
  ],
  "latex-workshop.latex.tools": [
    {
      "name": "latexmk",
      "command": "bash",
      "args": [
        "path-to-texlive-ubuntu.sh(or .ps1)",
        "%DIR%",
        "latexmk -silent -outdir=%OUTDIR% %DOCFILE% && fix-synctex %DOC_EXT% %OUTDIR%"
      ]
    }
  ],
  "latex-workshop.latexindent.path": "bash",
  "latex-workshop.latexindent.args": [
    "path-to-texlive-ubuntu.sh(or .ps1)",
    "%DIR%",
    "latexindent __latexindent_temp.tex -y=defaultIndent: '%INDENT%'"
  ],
  "latex-workshop.latex.outDir": "out",
  "latex-workshop.view.pdf.viewer": "tab"
}
```
