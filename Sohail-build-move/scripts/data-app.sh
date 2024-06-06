#!/bin/bash
echo "------> Stopping Data service  <------"
service voziq-data stop
service voziq-data status
echo "------> Data service stopped  <------"
timestamp=$(date +'%Y-%m-%d-%H%M%S')
echo $timestamp
basepath=/disk1/backup/voziq-data/
echo $basepath
cd $basepath
echo "------> Creating directory  <------"
mkdir -p $basepath/$timestamp
ls -l
echo "------> Directory created  <------"
echo "------> Moving Files to Backup  <------"
cd $basepath/$timestamp
mv /disk1/voziq/voziq-srv/data/bin/voziq-data.jar  voziq-data.jar$(date +"%Y-%m-%d-%T")
ls -l
echo "------> Jar file backup successfully  <------"

echo "------> Moving Build jar File  <------"
cd /disk1/voziq/voziq-srv/data/bin/
mv /disk1/builds/voziq-data/target/voziq*.jar voziq-data.jar
ls -l
echo "------> Jar File moved successfully  <------"
chown voziq:voziq voziq-data.jar
chmod 755 voziq-data.jar
ls -l
rm -rf /disk1/builds/voziq-data/*
echo "------> Starting Data service  <------"
service voziq-data start
service voziq-data status
echo "------> Data service started  <------"
