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
      "command": "docker",
      "args": [
        "run",
        "--rm",
        "--mount",
        "type=bind,source=/Users/rin/.latexmkrc,target=/root/.latexmkrc,readonly",
        "--mount",
        "type=bind,source=%DIR%,target=/latex-workdir",
        "--mount",
        "type=volume,src=latex-cache,dst=/latex-cache",
        "rin4046/texlive-ubuntu",
        "latexmk",
        "-silent",
        "-outdir=%OUTDIR%",
        "%DOCFILE%"
      ]
    }
  ],

  "latex-workshop.latexindent.path": "docker",
  "latex-workshop.latexindent.args": [
    "run",
    "--rm",
    "--mount",
    "type=bind,source=%DIR%,target=/latex-workdir",
    "rin4046/texlive-ubuntu",
    "latexindent",
    "__latexindent_temp.tex",
    "-y=defaultIndent: '%INDENT%'"
  ],

  "latex-workshop.latex.outDir": "out",
  "latex-workshop.view.pdf.viewer": "tab"
}
```

## Fix SyncTeX file

```jsonc
{
  "latex-workshop.latex.tools": [
    {
      "name": "synctex",
      "command": "docker",
      "args": [
        "run",
        "--rm",
        "--mount",
        "type=bind,source=%DIR%,target=/latex-workdir",
        "rin4046/texlive-ubuntu",
        "sed",
        "-i",
        "2c Input:1:%DOC_EXT%",
        "%OUTDIR%/%DOCFILE%.synctex"
      ]
    }
  ]
}
```
