FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV TEXMFCACHE=/latex-cache
COPY fix-synctex /usr/local/bin/

WORKDIR /tmp
COPY texlive.profile ./
RUN apt update && apt install -y \
    curl \
    perl \
    libyaml-tiny-perl \
    libfile-homedir-perl \
    libunicode-linebreak-perl \
 && apt clean \
 && rm -rf /var/lib/apt/lists/* \
 && curl -OL https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
 && tar -xf install-tl-unx.tar.gz \
 && install-tl-*/install-tl --profile texlive.profile \
 && rm -rf ./*

WORKDIR /latex-workdir
ENTRYPOINT ["bash", "-c"]
