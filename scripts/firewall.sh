#!/usr/bin/env bash

# Install firewall

script_dir="$(cd -P "$(dirname "$BASH_SOURCE")" && pwd)"
cd $script_dir
. set.sh

ssh_port=${1:-521}

apt-get -y install ufw

ufw logging off
ufw allow in "$ssh_port"/tcp
ufw allow in 27960:27969/tcp
ufw allow in 27960:27969/udp
ufw --force enable
