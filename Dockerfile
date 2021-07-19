FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y texlive-full

WORKDIR /latex-workdir
ENV TEXMFCACHE=/latex-cache

COPY fix-synctex /usr/local/bin/
