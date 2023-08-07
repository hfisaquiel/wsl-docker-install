#!/usr/bin/env bash
set -e

echo '\e[1;37;1;41m.INSTALANDO DOCKER ON WSL.\e[0m'
echo '\e[1;34;1mSee complete documentation on \e[4mhttps://docs.docker.com/engine/install/ubuntu/\e[0m'

echo ''
echo '\e[1;34;1mRemove previous outadated docker\e[0m'
apt remove -y docker docker.io containerd runc || true

echo ''
echo '\e[1;34;1mRemove previous outadated docker engine\e[0m'
set +e
apt remove -y -q docker-engine || true
set -e

echo ''
echo '\e[1;34;1mUpdate System\e[0m'
apt update

echo ''
echo '\e[1;34;1mInstall certificates\e[0m'
apt install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

echo ''
echo '\e[1;34;1mInstall repository gpg keys\e[0m'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list >/dev/null

echo ''
echo '\e[1;34;1mUpdate System\e[0m'
apt update

echo ''
echo '\e[1;34;1mInstalling Docker\e[0m'
apt install -y docker-ce docker-ce-cli containerd.io

echo ''
echo '\e[1;34;1mInstalling Docker Compose\e[0m'
apt install -y docker-compose

echo ''
echo ' + ------------------------------------------------------- +'
echo ' | \e[32;5;1m                        Yey!!                           \e[0m|'
echo ' |                                                         |'
echo ' | \e[1;34mRecommended restart WSL using cmd.exe ou PowerShell \e[0m    |'
echo ' | > \e[1;37m# wsl --shutdown                            \e[0m          |'
echo ' |                                                         |'
echo ' | \e[1;34mStart service and/or add this command at\e[0m \e[1;37m~/.bashrc\e[0m      |'
echo ' | \e[1;37m> # service docker start\e[0m                                |'
echo ' + ------------------------------------------------------- +'
