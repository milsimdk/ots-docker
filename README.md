## *****************************************************************
# NOT READY FOR PRODUCTION YET
## *****************************************************************

#### First boot
```shell
make up

# Wait this everything is up
# docker compose up -d
# [+] Running 5/5
# Network ots-docker_default     Created    0.0s 
# Container rabbitmq             Healthy    0.0s 
# Container opentakserver-webui  Started    0.0s 
# Container opentakserver        Started    0.0s 
# Container nginx-proxy          Started    0.0s

# Change these options in persistent/ots/config.yml
# vim persistent/ots/config.yml
# OTS_LISTENER_ADDRESS: 0.0.0.0
# OTS_RABBITMQ_SERVER_ADDRESS: rabbitmq

# Restart OTS
make restart

# Check logs
make logs
```

WebUI is available on https://localhost


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
 - [OpenTakServer-WebUI](https://github.com/milsimdk/ots-ui-docker-image/pkgs/container/ots-ui-docker-image)

# How to use the MakeFile
```shell
# Show help
make
```

### Thanks
  - [Brian](https://github.com/brian7704) for creating OpenTAKServer

