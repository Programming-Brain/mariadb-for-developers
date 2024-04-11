#!/bin/bash

# Install VS Code extensions
install-extension vscjava.vscode-java-pack
install-extension ms-python.python
install-extension cweijan.vscode-database-client2

# Install tools
apt-get update
apt-get install -y mariadb-client
