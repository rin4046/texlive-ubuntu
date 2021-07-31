Param($Dir, $Command)

$ErrorActionPreference = "Stop"

function Get-PosixPwd {
  "/$((Get-Location).Drive.Name.ToLowerInvariant())$($env:HOMEPATH.Replace('\', '/'))"
}

docker run --rm `
  --mount "type=bind,source=$(Get-PosixPwd)/.latexmkrc,target=/root/.latexmkrc,readonly" `
  --mount "type=bind,source=${Dir},target=/workdir" `
  --mount "type=volume,source=texmf-var,target=/texmf-var" `
  rin4046/texlive-ubuntu:latest "${Command}"
