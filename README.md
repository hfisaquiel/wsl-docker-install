# WSL Docker Install
Script who will free you to keep using Windows with WSL!

## Dependencies
. SO Linux Ubuntu/Debian
. Apt Install Manager

> Tested on WSL2 using Ubuntu distro

## How this work
The docker-install.sh is a script based on Docker documentation https://docs.docker.com/engine/install/ubuntu/.

Important to be aware, this script will remove old Docker installations as Docker Engine and oldest docker.io, as terraform to new installations, preventing incompatibilities issues.

## Using this script
Download the file [docker-install.sh](docker-install.sh) or clone this [repository](https://github.com/hfisaquiel/wsl-docker-install) and execute using `SH` or `Bash`.

Must elevated permission as root or sudo (the current user must in the sudoers list), in order to remove and install dependencies.

```Shell
sudo sh docker-install.sh
```
In some moments, the script can ask you to confirm due overwrite the previous localy saved GPG key. You can overwrite (recomended) or put a new name path for file.

## Post Installation
Maybe additional steps must be necessary if issues like permissions or network fail. You can read about at [Docker post-installation](https://docs.docker.com/engine/install/linux-postinstall/) page.

### Short optional commands
#### Permission issues
```Shell
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
```shell
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

## Another things
Open a issue or contribute with this repo opening a new PR.
