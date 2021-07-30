#!/bin/bash

set -e

dir="${1}"
command="${2}"

docker run --rm \
  --mount "type=bind,source=${HOME}/.latexmkrc,target=/root/.latexmkrc,readonly" \
  --mount "type=bind,source=${dir},target=/latex-workdir" \
  --mount "type=volume,source=latex-cache,target=/latex-cache" \
  rin4046/texlive-ubuntu:latest bash -c "${command}"
