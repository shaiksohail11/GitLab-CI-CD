#!/bin/bash
echo "------> Stopping Authentication and Authentication Master service  <------"
service voziq-auth stop
service voziq-auth-master stop
service voziq-auth status
service voziq-auth-master status
echo "------> Authentication service stopped  <------"
timestamp=$(date +'%Y-%m-%d-%H%M%S')
echo $timestamp
basepath=/disk1/backup/voziq-auth/
echo $basepath
cd $basepath
echo "------> Creating directory  <------"
mkdir -p $basepath/$timestamp
ls -l
echo "------> Directory created  <------"
echo "------> Moving Files to Backup  <------"
cd $basepath/$timestamp
mv /disk1/voziq/voziq-srv/authorization/bin/voziq-auth.jar  voziq-auth.jar$(date +"%Y-%m-%d-%T")
ls -l
echo "------> Jar file backup successfully  <------"
echo "------> Moving Build Authentication jar File  <------"
cd /disk1/voziq/voziq-srv/authorization/bin/
cp -r /disk1/builds/voziq-auth/target/voziq*.jar voziq-auth.jar
ls -l
chmod 755 voziq-auth.jar
chown voziq:voziq voziq-auth.jar
ls -l
echo "------> Authentication Jar File moved successfully  <------"
echo "------> Moving Build Authentication Master jar File  <------"
cd /disk1/voziq/voziq-srv/authorization-master/bin/
rm -rf voziq-auth.jar
mv /disk1/builds/voziq-auth/target/voziq*.jar voziq-auth.jar
ls -l
chmod 755 voziq-auth.jar
chown voziq:voziq voziq-auth.jar
ls -l
echo "------> Authentication Jar File moved successfully  <------"
echo "------> Remove build folder  <------"
rm -rf /disk1/builds/voziq-auth/*
echo "------> Successfully removed build folder  <------"
echo "------> Starting Authentication service  <------"
service voziq-auth start
service voziq-auth-master start
service voziq-auth status
service voziq-auth-master status
echo "------> Authentication service started  <------"
