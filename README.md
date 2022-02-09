# WSL Docker Install
Script who will free you to keep using Windows with WSL!

## Dependencies
  - SO Linux Ubuntu/Debian
  - Apt Install Manager

> Tested on WSL2 using Ubuntu 18.04/20.04/21.04 distros

## How this work
The docker-install.sh is a script based on Docker documentation https://docs.docker.com/engine/install/ubuntu/.

Important to be aware, this script will remove old Docker installations as Docker Engine and oldest docker.io, as terraform to new installations, preventing incompatibilities issues.

## Using this script
> Must elevated permission as root or sudo (the current user must in the sudoers list), in order to remove and install dependencies.

Two options for get and run this script:
#### 1. Short
```shell
curl -s https://raw.githubusercontent.com/hfisaquiel/wsl-docker-install/main/docker-install.sh | sudo sh
```

#### 2. Carefull
Download the file [docker-install.sh](docker-install.sh) or clone this [repository](https://github.com/hfisaquiel/wsl-docker-install) and execute the `docker-install.sh` file using `SH` or `Bash`.
```shell
sudo sh docker-install.sh
```
In some moments, the script can ask you to confirm due overwrite the previous localy saved GPG key. You can overwrite (recomended) or put a new name path for file.

## Post Installation
Maybe additional steps must be necessary if issues like permissions or network fail. You can read about at [Docker post-installation](https://docs.docker.com/engine/install/linux-postinstall/) page.

### Short optional commands
#### Permission issues
```bash
$ sudo groupadd docker
$ sudo usermod -aG docker $USER
````
Logout or restart the WSL using `cmd.exe` or `PowerShell`
```bash
$ wsl --shutdown && wsl
```

If you see error like:
```
# WARNING: Error loading config file: /home/user/.docker/config.json -
```
Than change permission to `.docker` folder
```bash
$ sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
$ sudo chmod g+rwx "$HOME/.docker" -R
```

#### Network
if you experience some network problems as like "host unreachable", add/edit the `/etc/docker/daemon.json` file and save as root/sudo user, add the `dns` configuration:
```json
{
  "dns": ["8.8.8.8", "8.8.4.4"]
}
```
This are Google DNS resolver, you are free to use another, if work for you.

## Additional Info
if this script doesn't resolve your problem, you can open a issue or use a docker automated script on https://github.com/docker/docker-install.

## Another things
Open a issue or contribute with this repo opening a new PR.
