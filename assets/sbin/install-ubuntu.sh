#!/usr/bin/env bash

set -eu

# Settings

HUGO_VERSION='0.73.0'

# Installation

echo '[INFO] Install build dependencies' && \
    apt update && apt install -y --no-install-recommends \
        wget 

echo '[INFO] Install Hugo components' && \
    mkdir -p /tmp/hugo && \
    cd /tmp/hugo/ && \
    wget --no-check-certificate --progress=dot:giga -O /tmp/hugo/hugo.tar.gz \
        https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz  && \
    tar -xf hugo.tar.gz && \
    mv /tmp/hugo/hugo /sbin/hugo

echo '[INFO] Update scripts and configs' && \
    mv /tmp/assets/sbin/entrypoint.sh /sbin
    
# Cleaning procedure

echo '[INFO] Remove build dependencies' && \
    apt-get remove -y wget && \
    apt-get clean

echo '[INFO] Cleaning up' && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/assets && \
    rm -rf /tmp/hugo

