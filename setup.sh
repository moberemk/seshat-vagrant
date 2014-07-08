#!/bin/sh

set -e

apt-get update

# The oddly-named python-software-properties includes add-apt-repository.
APT_PACKAGES="
python-pip
python3-pip
python-dev
libcurl4-openssl-dev
python-software-properties
postgresql
postgresql-contrib
"

apt-get -y install $APT_PACKAGES

# Install pip for python 3
curl -O http://python-distribute.org/distribute_setup.py
sudo python3 distribute_setup.py
curl -O https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py
sudo python3 get-pip.py

# Install pip packages now that it uses Python3
PIP_PACKAGES="
tornado
"

pip install $PIP_PACKAGES

# Install Redis from a PPA
sudo add-apt-repository -y ppa:rwky/redis
sudo apt-get update
sudo apt-get install -y redis-server