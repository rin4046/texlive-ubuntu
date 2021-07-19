# texlive-ubuntu

## ~/.latexmkrc

```perl
$lualatex = 'lualatex -interaction=nonstopmode %O %S';
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
        "path-to-texlive-ubuntu.sh",
        "latexmk",
        "%DIR%",
        "%OUTDIR%",
        "%DOCFILE%",
        "%DOC_EXT%"
      ]
    }
  ],

  "latex-workshop.latexindent.path": "bash",
  "latex-workshop.latexindent.args": [
    "path-to-texlive-ubuntu.sh",
    "latexindent",
    "%DIR%"
  ],

  "latex-workshop.latex.outDir": "out",
  "latex-workshop.view.pdf.viewer": "tab"
}
```
