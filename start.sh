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
sudo rm /home/qpaas/webapps/craftreport/cucumber-results-agg-test-results.html
sudo rm /home/qpaas/webapps/craftreport/cucumber-results-feature-overview.html
sudo rm /home/qpaas/webapps/craftreport/cucumber-results-test-results.pdf
sudo rm -rfd /home/qpaas/craftresult
docker cp cucumbercraft:/cucumbercraft-2.0/target/.  /home/qpaas/craftresult
sudo cp /home/qpaas/craftresult/* /home/qpaas/webapps/craftreport/
echo "End of Execution"
echo "please click below for aggregated result http://192.168.40.192:3389/craftreport/cucumber-results-agg-test-results.html"
echo "please click below for overview result http://192.168.40.192:3389/craftreport/cucumber-results-feature-overview.html"
echo "please click below for test result in PDF http://192.168.40.192:3389/craftreport/cucumber-results-test-results.pdf"
