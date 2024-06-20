# Docker setup for OpenTAKServer
--- 
Docker setup for [OpenTAKServer](https://github.com/brian7704/OpenTAKServer) (OTS) is yet another open source TAK Server for ATAK, iTAK, and WinTAK

### *****************************************************************
### NOT READY FOR PRODUCTION YET
### *****************************************************************

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
If you get a `Permission denied` error it might because of folder permissions \
The opentakserver has an internal user with PID/GID of 1000 \
To fix it, either do `chmod -R 0777 persistent` or create a user with the PID/GID of 1000
Check if a user exists with `id 1000`

#### Check if a user with ID 1000 exists
```shell
id 1000
```
if you get "*id: 1000: no such user*" jump to [Create user](#create-user) \
else run `chown -R 1000:1000 persistent`

#### Create user
```shell
sudo groupadd -g 1000 -r ots
sudo useradd -u 1000 -g 1000 -m ots
sudo usermod -aG docker ots
# You can also add your own user to the docker group
#sudo usermod -aG docker $USER

# cd to the ots-docker folder
sudo chown -R 1000:1000 persistent
```

#### Permission denied: Quick and dirty solution
the quick and dirty solution 
```shell
sudo chmod -R 0777 persistent
```

#### Permission denied: The sysadmin solution
```shell
# Add user to docker group
sudo usermod -aG docker $USER

# Get repos needed
git clone git@github.com:milsimdk/ots-docker.git /opt/ots-docker
git clone git@github.com:milsimdk/ots-docker-image.git && cd /opt/ots-docker-image

# Fix user ID
echo "---
services:
  opentakserver:
    image: opentakserver:latest
    build:
      context: .
      args:
        - PGID=$(id -u $USER)
        - PUID=$(id -g $USER)
      tags:
        - opentakserver:latest
" > compose.override.yaml

# Build local image of opentakserver
docker compose build opentakserver

# Change to the docker project
cd /opt/ots-docker

echo "---
services:
  opentakserver:
    image: opentakserver:latest
" > compose.override.yaml

# Lets party
docker compose up -d
docker compose logs -f
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
 - [ ] MediaMTX
 - [ ] Mumble

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
