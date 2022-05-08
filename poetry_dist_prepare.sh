#!/bin/bash

if [ -z "$1" ]; then
  echo "Please specify Poetry version"
  exit
fi

VERSION=$1

mkdir /tmp/poetry_dist && cd /tmp/poetry_dist
curl -o poetry_install.py -sSL https://install.python-poetry.org
sed -i 's/"install", specification/"install", "--no-index", "--find-links=.", specification/g' poetry_install.py
pip download poetry==${VERSION}
tar -czvf poetry_dist.tar.gz poetry_install.py *.whl --remove-files
