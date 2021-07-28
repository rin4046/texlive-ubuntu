#!/bin/bash

set -e

docker run --rm \
  --mount "type=bind,source=${HOME}/.latexmkrc,target=/root/.latexmkrc,readonly" \
  --mount "type=bind,source=${1},target=/latex-workdir" \
  --mount "type=volume,source=latex-cache,target=/latex-cache" \
  rin4046/texlive-ubuntu bash -c "${2}"
