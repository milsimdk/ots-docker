## *****************************************************************
# NOT READY FOR PRODUCTION YET

### Settings that MUST be changed to the following!!
```yaml
OTS_LISTENER_ADDRESS: 0.0.0.0
OTS_RABBITMQ_SERVER_ADDRESS: rabbitmq
```

Go support environment variables
https://github.com/brian7704/OpenTAKServer/issues/28

## *****************************************************************

#### First boot
```shell
make up

# Wait this everything is up
# [+] Running 3/3
# ✔ Container rabbitmq       Healthy                                                                                                                                                                                                                                                                                                                                6.5s 
# ✔ Container opentakserver  Started                                                                                                                                                                                                                                                                                                                                0.5s 
# ✔ Container nginx          Started   

# Change there's options in persistent/ots/config.yml
# vim persistent/ots/config.yml
# OTS_LISTENER_ADDRESS: 0.0.0.0
# OTS_RABBITMQ_SERVER_ADDRESS: rabbitmq

# Restart OTS
make restart
# Wait...

# Check logs
make logs
```

Webgui should be on https://localhost


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

