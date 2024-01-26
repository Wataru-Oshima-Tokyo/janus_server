#!/bin/bash

# docker build -f janus_server -t janus_server .

# IP="$1"
# if [ -z "$IP" ]; then
#     echo "No argument given. Using [localhost] for this run."
#     IP="localhost"
# fi

# docker run -it --rm --name="janus_server_instance" \
#   --privileged --net=host \
#   --volume="${PWD}/":"/external:rw" \
#   -v /var/run/docker.sock:/var/run/docker.sock \
#   janus_server bash -c "cd /external; ./start.sh $IP"

docker run --rm \
 --name="janus_server_instance" \
 --privileged --net=host \
 -e GATEWAY_IP=localhost \
 -e STUN_SERVER=stun.l.google.com \
 -e STUN_PORT=19302 \
 -e WEBSOCKETS_ENABLED=true \
 -p 8188:8188 \
 -p 10000-10099:10000-10099/udp \
 -e RTP_PORT_RANGE=10000-10099 \
 -ti swmansion/janus-gateway:0.11.8-0