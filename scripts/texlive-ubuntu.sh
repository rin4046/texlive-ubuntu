#!/bin/bash

set -e

dir="${1}"
command="${2}"

docker run --rm \
  --mount "type=bind,source=${HOME}/.latexmkrc,target=/root/.latexmkrc,readonly" \
  --mount "type=bind,source=${dir},target=/workdir" \
  --mount "type=volume,source=texmf-var,target=/texmf-var" \
  rin4046/texlive-ubuntu:latest "${command}"
