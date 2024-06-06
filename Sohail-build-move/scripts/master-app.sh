
#!/bin/bash

echo "------> Stopping APP service  <------"
service voziq-app stop
service voziq-app status
echo "------> APP service stopped  <------"
timestamp=$(date +'%Y-%m-%d-%H%M%S')
echo $timestamp
basepath=/disk1/backup/voziq-app/
echo $basepath
cd $basepath
echo "------> Creating directory  <------"
mkdir -p $basepath/$timestamp
ls -l
echo "------> Directory created  <------"
echo "------> Moving Files to Backup  <------"
cd $basepath/$timestamp
mv /disk1/voziq/voziq-app/server/webapps/ROOT* .
ls -l
echo "------> Files moved to Backup  <------"
echo "------> Copying build files  <------"
mv /disk1/builds/voziq-app/target/vapp-*.war  /disk1/voziq/voziq-app/server/webapps/ROOT.war
cd /disk1/voziq/voziq-app/server/webapps
chmod -R 755 ROOT.war
chown -R voziq:voziq ROOT.war
ls -l
echo "------> Build files copied successfully  <------"
service voziq-app start
rm -rf /disk1/builds/voziq-app/*
service voziq-app status
echo "------> APP service started  <------"