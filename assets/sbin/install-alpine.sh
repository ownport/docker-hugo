#!/usr/bin/env sh

set -eu

# Settings

HUGO_VERSION='0.73.0'

# Installation

echo '[INFO] Install build dependencies' && \
    apk add --no-cache --virtual .build-deps \
        wget 

echo '[INFO] Install Hugo components' && \
    mkdir -p /tmp/hugo && \
    cd /tmp/hugo/ && \
    wget -q  -O /tmp/hugo/hugo.tar.gz \
        https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz  && \
    tar -xf hugo.tar.gz && \
    mv /tmp/hugo/hugo /sbin/hugo

echo '[INFO] Update scripts and configs' && \
    mv /tmp/assets/sbin/entrypoint.sh /sbin
    
# Cleaning procedure

echo '[INFO] Remove build dependencies' && \
    apk del .build-deps

echo '[INFO] Cleaning up' && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/assets && \
    rm -rf /tmp/hugo

