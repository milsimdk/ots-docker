## ************************************************************************
# NOT READY FOR PRODUCTION YET
## ************************************************************************


# Docker image for OpenTAKServer

Docker image for OpenTAKServer (OTS) is yet another open source TAK Server for ATAK, iTAK, and WinTAK \
https://github.com/brian7704/OpenTAKServer

# Whats supported for now
 - [ ] Tak server
 - [ ] Rabbitmq 
   - [ ] MQTT
 - [ ] WebUI

# Requirements
 - Docker must be installed
 - Docker compose v2 is used
 - Only tested on Debian Bookworm, but should work on most Linux operating systems

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

# Install / build - docker compose
```shell
# Default user and group id - 1000
$ docker compose up -d

# Change user or group id or ots version
$ docker compose build --build-arg 'PGID=1005' --build-arg 'PUID=1005' --build-arg 'OTS_VERSION=x.x.x'
$ docker compose up -d
# OR edit arg in docker-compose.yaml
```

### Thanks
  - [Brian](https://github.com/brian7704) for creating OpenTAKServer

