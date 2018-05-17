#!/bin/bash
# wait-for-site.sh

sudo docker stop $(sudo docker ps -aq)
sudo docker rm $(sudo docker ps -aq)
docker-compose up
