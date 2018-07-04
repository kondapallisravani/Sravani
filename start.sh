#!/bin/bash
# wait-for-site.sh

sudo docker stop $(sudo docker ps -aq)
sudo docker rm $(sudo docker ps -aq)
sudo docker network rm $(sudo docker network ls)
sudo docker-compose up -d petclinic 
sudo docker-compose up -d zalenium
sudo docker-compose up -d mongo
#docker-compose up -d cognitivereporting

#sudo git clone -b master --single-branch 'https://368731:gvt0901!@code.cognizant.com/368731/CRAFT_Dashboard.git'
#cd CRAFT_Dashboard
#docker rmi craft_dashboard 
#docker  build --tag craft_dashboard:latest .
sudo docker-compose up -d craftdashboard

#sudo docker run -it --net=automation-docker-job_mysubnet123 --ip 172.18.0.23 ganeshtidke0901docker/cognitivereporting npm start
#sudo docker run -d --net=aws-demo_mysubnet123 --ip 172.18.0.23 ganeshtidke0901docker/cognitivereporting npm start

echo "please click below for aggregated result http://192.168.40.192:3232"






#----------------------cucumber craft version ----------------------
#git clone -b master --single-branch 'https://368731:gvt0901!@code.cognizant.com/368731/cucumbercraft-2.0.git'
#cd cucumbercraft-2.0
#docker rmi cucumbercraft
#docker  build --tag cucumbercraft:latest .
#docker-compose up cucumbercraft


#sudo rm -rfd /home/qpaas/webapps/craftreport/allure-results
#sudo rm -rfd /home/qpaas/webapps/craftreport/css
#sudo rm -rfd /home/qpaas/webapps/craftreport/images
#sudo rm  /home/qpaas/webapps/craftreport/project-reports.html
#sudo rm -rfd /home/qpaas/craftresult
#docker cp cucumbercraft:/cucumbercraft-2.0/target/site/.  /home/qpaas/craftresult
#sudo cp -fr /home/qpaas/craftresult/* /home/qpaas/webapps/craftreport/
#echo "End of Execution"
#echo "please click below for aggregated result http://192.168.40.192:3389/craftreport/allure-results/index.html"

