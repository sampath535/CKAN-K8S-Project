#!/bin/bash

# Downloads the most recently released kustomize binary
# to your current working directory.
#
# Fails if the file already exists.

url=$(curl -s https://api.github.com/repos/kubernetes-sigs/kustomize/releases |\
  grep browser_download |\
  grep linux_amd |\
  cut -d '"' -f 4 |\
  grep /kustomize/v |\
  sort | tail -n 1) 

echo Downloading: $url

curl -s -O -L $url

tar xzf ./kustomize_v*_linux_amd64.tar.gz

./kustomize version

echo kustomize installed to current directory.

echo Done