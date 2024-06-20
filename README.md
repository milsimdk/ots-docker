# Docker setup for OpenTAKServer
--- 
Docker setup for OpenTAKServer (OTS) is yet another open source TAK Server for ATAK, iTAK, and WinTAK \
https://github.com/brian7704/OpenTAKServer

### *****************************************************************
### NOT READY FOR PRODUCTION YET
### *****************************************************************

### First boot
```Shell
# Start OTS
make up

# Check logs
make logs
```

WebUI is available on https://localhost


### Config changes 

You can change config options by using 'environment' in the compose.yaml file
Options name must have the prefix `DOCKER_` else they are ignored

It's also possible to just change them in the config.yml file

```text
environment:
    - DOCKER_DEBUG=false
    - DOCKER_OTS_CA_NAME=MilsimDK-CA
    - DOCKER_OTS_CA_COUNTRY=DK
    - DOCKER_OTS_CA_STATE=EU
    - DOCKER_OTS_CA_CITY=Larp City
    - DOCKER_OTS_CA_ORGANIZATION=MilsimDK
    - DOCKER_OTS_CA_ORGANIZATIONAL_UNIT=IT

    - DOCKER_OTS_MEDIAMTX_ENABLE=false
```

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

### Thanks
  - [Brian](https://github.com/brian7704) for creating OpenTAKServer

