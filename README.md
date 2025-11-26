# Docker setup for OpenTAKServer
--- 
Docker setup for [OpenTAKServer](https://github.com/brian7704/OpenTAKServer) (OTS) is yet another open source TAK Server for ATAK, iTAK, and WinTAK

### *****************************************************************
### NOT READY FOR PRODUCTION YET
### *****************************************************************

###
###


## First boot
```Shell
# Download / Pull
git clone git@github.com:milsimdk/ots-docker.git && cd ots-docker

# Start OTS
make up

# Check logs
make logs
```

WebUI is available on https://localhost

## Problems you can have
- [Got permission denied while trying to connect to the Docker daemon socket](#docker-daemon-socket-denied)
- [Folder permissions](#folder-permissions)

### Docker daemon socket denied
```shell
sudo usermod -aG docker $USER
newgrp docker
```

### Folder permissions
If you get a `Permission denied` error it might because of folder permissions \
To fix it add your user id and group id in `compose.override.yaml`
```shell
id
cp compose.override.yaml-example compose.override.yaml

# Change line 4 so it matches your folder owner id and group id 
```


## Config changes 
You can change config options by using 'environment' in the compose.override.yaml file \
Options name must have the prefix `DOCKER_` or else they are ignored! \
You can overwrite all settings this way so watch out!!!

It's also possible to just change them in the `persistent/ots/config.yml` file

## Whats supported for now
 - [x] Tak server
 - [x] Rabbitmq 
   - [x] MQTT
 - [x] WebUI
 - [x] Meshtastic
 - [x] MediaMTX
 - [ ] Mumble
 - [ ] SSL / Let's Encrypt

## Requirements
 - Docker must be installed
 - Docker compose v2 is used
 - Only tested locally on my Macbook (arm64), but should work on most Linux operating systems
 - Custom OpenTakServer docker images used
   - [OpenTakServer](https://github.com/milsimdk/ots-docker-image/pkgs/container/ots-docker-image)
   - [OpenTakServer-WebUI](https://github.com/milsimdk/ots-ui-docker-image/pkgs/container/ots-ui-docker-image)

## How to use the MakeFile
```shell
# Show help
make
```

## Thanks
  - [Brian](https://github.com/brian7704) for creating [OpenTAKServer](https://github.com/brian7704/OpenTAKServer)
