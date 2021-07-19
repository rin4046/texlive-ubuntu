Param($Task, $Dir, $Outdir, $Docfile, $DocExt)

function DockerRun {
  param (
    $Commands
  )

  docker run --rm `
    --mount "type=bind,source=/c/Users/rin/.latexmkrc,target=/root/.latexmkrc,readonly" `
    --mount "type=bind,source=$Dir,target=/latex-workdir" `
    --mount "type=volume,source=latex-cache,target=/latex-cache" `
    rin4046/texlive-ubuntu $Commands
}

switch ($Task) {
  "latexmk" {
    DockerRun("latexmk", "-silent", "-outdir=$Outdir", "$Docfile")
    DockerRun("fix-synctex", "$DocExt", "$Outdir")
  }

  "latexindent" {
    DockerRun("latexindent", "__latexindent_temp.tex", "-y=defaultIndent: '  '")
  }
}
