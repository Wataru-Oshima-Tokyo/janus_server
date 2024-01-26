#!/bin/bash

# Start Janus in the background
/opt/janus/bin/janus &

# Start Nginx in the foreground
nginx -g 'daemon off;'