#!/bin/bash

task=$1
dir=$2
outdir=$3
docfile=$4
doc_ext=$5

function docker_run() {
  docker run --rm \
    --mount "type=bind,source=${HOME}/.latexmkrc,target=/root/.latexmkrc,readonly" \
    --mount "type=bind,source=${dir},target=/latex-workdir" \
    --mount "type=volume,source=latex-cache,target=/latex-cache" \
    rin4046/texlive-ubuntu "${@}"
}

case "${task}" in
  "latexmk" )
    docker_run "latexmk" "-silent" "-outdir=${outdir}" "${docfile}"
    docker_run "fix-synctex" "${doc_ext}" "${outdir}" ;;

  "latexindent" )
    docker_run "latexindent" "__latexindent_temp.tex" "-y=defaultIndent: '  '" ;;
esac
