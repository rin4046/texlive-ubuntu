Param($Dir, $Command)

$ErrorActionPreference = "Stop"

function Get-PosixPwd {
  "/$((Get-Location).Drive.Name.ToLowerInvariant())$($env:HOMEPATH.Replace('\', '/'))"
}

docker run --rm `
  --mount "type=bind,source=$(Get-PosixPwd)/.latexmkrc,target=/root/.latexmkrc,readonly" `
  --mount "type=bind,source=${Dir},target=/latex-workdir" `
  --mount "type=volume,source=latex-cache,target=/latex-cache" `
  rin4046/texlive-ubuntu:latest "${Command}"
