#!/bin/bash
# wait-for-site.sh

docker stop $(sudo docker ps -aq)
docker rm $(sudo docker ps -aq)
docker-compose up -d petclinic 
docker-compose up -d zalenium
git clone -b master --single-branch 'https://368731:gvt0901!@code.cognizant.com/368731/cucumbercraft.git'
cd cucumbercraft
docker  build --tag cucumbercraft:latest .
docker-compose up cucumbercraft 