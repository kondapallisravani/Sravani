#!/bin/bash
# wait-for-site.sh

sudo docker stop $(sudo docker ps -aq)
sudo docker rm $(sudo docker ps -aq)
docker-compose up -d petclinic 
docker-compose up -d zalenium 
until curl -s --head  --request GET http://172.18.0.22:8080/petclinic/ | grep "200" > /dev/null; do >&2 echo "App is unavailable - sleeping" sleep 1 done >&2 echo "App is up - executing command" exec $cmd
docker-compose up -d cucumberscript 