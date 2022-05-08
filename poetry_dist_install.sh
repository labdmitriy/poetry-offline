#!/bin/bash

if [ -z "$1" ]; then
  echo "Please specify Poetry version"
  exit
fi

VERSION=$1

cd /tmp/poetry_dist
tar -xzvf poetry_dist.tar.gz
python poetry_install.py --uninstall
python poetry_install.py --path $(ls poetry-$VERSION*.whl)
