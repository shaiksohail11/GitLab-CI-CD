#!/bin/bash
echo "------> Stopping Guidance service  <------"
service voziq-guidance stop
service voziq-gudance status
echo "------> Guidance service stopped  <------"
timestamp=$(date +'%Y-%m-%d-%H%M%S')
echo $timestamp
basepath=/disk1/backup/voziq-guidance/
echo $basepath
cd $basepath
echo "------> Creating directory  <------"
mkdir -p $basepath/$timestamp
ls -l
echo "------> Directory created  <------"
echo "------> Moving Files to Backup  <------"
cd $basepath/$timestamp
mv /disk1/voziq/voziq-srv/guidance/bin/voziq-guidance.jar  voziq-guidance.jar$(date +"%Y-%m-%d-%T")
ls -l
echo "------> Jar file backup successfully  <------"

echo "------> Moving Build jar File  <------"
cd /disk1/voziq/voziq-srv/guidance/bin/
mv /disk1/builds/voziq-guidance/voziq-guidance.jar  .
ls -l
echo "------> Jar File moved successfully  <------"
chown voziq:voziq voziq-guidance.jar
chmod 755 voziq-guidance.jar
ls -l
rm -rf /disk1/builds/voziq-guidance/*
echo "------> Starting Guidance service  <------"
service voziq-guidance start
service voziq-guidance status
echo "------> Guidance service started  <------"
