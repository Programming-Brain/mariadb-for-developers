#!/bin/bash

# Install VS Code extensions
install-extension vscjava.vscode-java-pack
install-extension ms-python.python
install-extension cweijan.vscode-database-client2

# Install tools
apt-get update
apt-get install -y mariadb-client
apt-get install -y iputils-ping
apt-get install -y python3 python3-pip libmariadb3 libmariadb-dev

pip3 install --break-system-packages mariadb sentence-transformers
