#!/bin/bash
export PYTHON_VERSION=3.6.5
export PYTHON_DOWNLOAD_URL=https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz

sudo apt update
sudo apt install --no-install-recommends -y \
    software-properties-common build-essential \
    libssl-dev libreadline-dev libbz2-dev libsqlite3-dev zlib1g-dev \
    python-minimal

cd ~/Downloads

wget "$PYTHON_DOWNLOAD_URL" -O python.tar.tgz
tar -zxvf python.tar.tgz
cd Python-$PYTHON_VERSION
./configure --enable-optimizations --enable-loadable-sqlite-extensions
make
sudo make install

cd ..
sudo rm -rf Python-$PYTHON_VERSION

alias python3.6=python3
alias pip=pip3

pip install --upgrade pip

python --version
pip --version
