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
pymongo
"

pip install $PIP_PACKAGES

# Install Redis from a PPA
add-apt-repository -y ppa:rwky/redis
apt-get update
apt-get install -y redis-server

# Install MongoDB
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

apt-get update
apt-get install mongodb-org
