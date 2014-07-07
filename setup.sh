#!/bin/sh

set -e

apt-get update

# The oddly-named python-software-properties includes add-apt-repository.
APT_PACKAGES="
python-pip
python-dev
libcurl4-openssl-dev
python-software-properties
"

apt-get -y install $APT_PACKAGES

PIP_PACKAGES="
futures
pycurl
tox
twisted
virtualenv
tornado
"

pip install $PIP_PACKAGES

# TODO Install Postgres here