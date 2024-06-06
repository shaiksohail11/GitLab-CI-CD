#!/bin/bash
echo "------> Stopping Nginx service  <------"
service nginx stop
service nginx status
echo "------> Nginx service stopped  <------"
timestamp=$(date +'%Y-%m-%d-%H%M%S')
echo $timestamp
basepath=/disk1/backup/voziq-apps/
echo $basepath
cd $basepath
echo "------> Creating directory  <------"
mkdir -p $basepath/$timestamp
ls -l
echo "------> Directory created  <------"
echo "------> Moving Source to Backup  <------"
cd $basepath/$timestamp
mv /disk1/voziq/voziq-apps/guidance/src  src$(date +"%Y-%m-%d-%T")
ls -l
echo "------> Source backup successfully  <------"
echo "------> Moving updated source Files  <------"
cd /disk1/voziq/voziq-apps/guidance/
mv /disk1/builds/voziq-apps/dist/agentguidance  src
ls -l
echo "------> Source moved successfully  <------"
chmod 755 src
chown voziq:voziq src
ls -l
rm -rf /disk1/builds/voziq-apps/*
echo "------> Starting Nginx service  <------"
service nginx start
service nginx status
echo "------> Nginx service started  <------"
