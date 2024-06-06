#!/bin/bash
echo "------> Stopping offers service  <------"
service voziq-offers stop
service voziq-offers status
echo "------> offers service stopped  <------"
timestamp=$(date +'%Y-%m-%d-%H%M%S')
echo $timestamp
basepath=/disk1/backup/voziq-offers/
echo $basepath
cd $basepath
echo "------> Creating directory  <------"
mkdir -p $basepath/$timestamp
ls -l
echo "------> Directory created  <------"
echo "------> Moving Files to Backup  <------"
cd $basepath/$timestamp
mv /disk1/voziq/voziq-srv/offers/bin/voziq-offers.jar  voziq-offers.jar$(date +"%Y-%m-%d-%T")
ls -l
echo "------> Jar file backup successfully  <------"

echo "------> Moving Build jar File  <------"
cd /disk1/voziq/voziq-srv/offers/bin/
mv /disk1/builds/voziq-offers/target/voziq*.jar voziq-offers.jar
ls -l
echo "------> Jar File moved successfully  <------"
chown voziq:voziq voziq-offers.jar
chmod 755 voziq-offers.jar
ls -l
echo "------> Remove build folder  <------"
rm -rf /disk1/builds/voziq-offers/*
echo "------> Successfully removed build folder  <------"
echo "------> Starting offers service  <------"
service voziq-offers start
service voziq-offers status
echo "------> offers service started  <------"
