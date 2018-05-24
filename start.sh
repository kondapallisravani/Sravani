#!/bin/bash
# wait-for-site.sh

docker stop $(sudo docker ps -aq)
docker rm $(sudo docker ps -aq)
docker-compose up -d petclinic 
docker-compose up -d zalenium
docker  build --tag cucumbercraft:latest .
docker-compose up cucumbercraft 