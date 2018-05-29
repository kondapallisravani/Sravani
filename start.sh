#!/bin/bash
# wait-for-site.sh

docker stop $(sudo docker ps -aq)
docker rm $(sudo docker ps -aq)
docker network rm $(sudo docker network ls)
docker-compose up -d petclinic 
docker-compose up -d zalenium
git clone -b master --single-branch 'https://368731:gvt0901!@code.cognizant.com/368731/cucumbercraft-2.0.git'
cd cucumbercraft-2.0
docker rmi cucumbercraft
docker  build --tag cucumbercraft:latest .
docker-compose up cucumbercraft
sudo rm -rfd /home/qpaas/webapps/craftreport/allure-results
sudo rm -rfd /home/qpaas/webapps/craftreport/css
sudo rm -rfd /home/qpaas/webapps/craftreport/images
sudo rm  /home/qpaas/webapps/craftreport/project-reports.html
sudo rm -rfd /home/qpaas/craftresult
docker cp cucumbercraft:/cucumbercraft-2.0/target/site/.  /home/qpaas/craftresult
sudo cp -fr /home/qpaas/craftresult/* /home/qpaas/webapps/craftreport/
echo "End of Execution"
echo "please click below for aggregated result http://192.168.40.192:3389/craftreport/allure-results/index.html"

