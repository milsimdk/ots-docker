## *****************************************************************
# NOT READY FOR PRODUCTION YET
## *****************************************************************

# Docker setup for OpenTAKServer
Docker setup for OpenTAKServer (OTS) is yet another open source TAK Server for ATAK, iTAK, and WinTAK \
https://github.com/brian7704/OpenTAKServer

# Whats supported for now
 - [x] Tak server
 - [x] Rabbitmq 
   - [ ] MQTT
 - [x] WebUI
 - [ ] MediaMTX
 - [ ] Mumble

# Requirements
 - Docker must be installed
 - Docker compose v2 is used
 - Only tested locally on my Macbook (arm64), but should work on most Linux operating systems

##### Custom OpenTakServer docker images used
 - [OpenTakServer](https://github.com/milsimdk/ots-docker-image/pkgs/container/ots-docker-image)

# How to use the MakeFile
```shell
# Show help
make

# Start OpenTAKServer
make up

# Stop Start OpenTAKServer
make down

# See logs
make logs
```

### Thanks
  - [Brian](https://github.com/brian7704) for creating OpenTAKServer

