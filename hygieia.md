非root用户执行
git clone https://github.com/capitalone/Hygieia.git
cd Hygieia/
mvn clean install package

使用root
cd core 
mvn clean install
cd hygieia-jenkins-plugin
cp pom.xml pom.xml.bak

vi pom.xml
123c123
<             <version>2.0.5-SNAPSHOT</version>
---
>             <version>2.0.4-SNAPSHOT</version>

mvn clean package 

docker ps -a | awk {'print $1'} | xargs docker rm -f

rm -fr /opt/mongo /opt/hygieia/logs
mkdir -p /opt/mongo /opt/hygieia/logs

docker run -d -p 27017:27017 --name mongodb -v /opt/mongo:/data/db mongo:latest  mongod --smallfiles

docker exec -it `docker ps -a | grep mongo | awk '{print $1}'` mongo admin --eval 'db.getSiblingDB("db").createUser({user: "db", pwd: "dbpass", roles: [{role: "readWrite", db: "dashboard"}]})'


docker run -d --net=host capitaloneio/hygieia-ui

docker run -d --net=host -v /opt/hygieia/logs:/hygieia/logs -e SPRING_DATA_MONGODB_DATABASE=db -e SPRING_DATA_MONGODB_HOST=10.1.50.250 -e SPRING_DATA_MONGODB_PORT=27017 -e SPRING_DATA_MONGODB_USERNAME=db -e SPRING_DATA_MONGODB_PASSWORD=dbpass capitaloneio/hygieia-api  








           
