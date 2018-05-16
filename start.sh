#!/bin/bash
# wait-for-site.sh


docker-compose up -d
sh ./waitforsite.sh
docker run -it --net=downloads_mysubnet123 ganeshtidke0901docker/selenium-bdd-poc  mvn verify -Dweb.app.docker.ip=172.18.0.22 -Dhub.host.ip=192.168.40.192
 
