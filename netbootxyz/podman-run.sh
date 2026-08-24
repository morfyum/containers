#!/bin/bash

podman run -d \
  --name=netbootxyz --replace \
  --security-opt label=disable \
  -e MENU_VERSION=2.0.84             `# optional` \
  -e NGINX_PORT=80                   `# optional` \
  -e WEB_APP_PORT=3000               `# optional` \
  -p 3000:3000                       `# sets web configuration interface port, destination should match ${WEB_APP_PORT} variable above.` \
  -p 69:69/udp                       `# sets tftp port` \
  -p 8080:80                         `# optional, destination should match ${NGINX_PORT} variable above.` \
  -v ./config:/config:z   `# optional` \
  -v ./assets:/assets:z   `# optional` \
  --restart unless-stopped \
  ghcr.io/netbootxyz/netbootxyz
