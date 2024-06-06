#!/bin/bash
echo "------> Stopping Guidance service  <------"
service voziq-guidance stop
service voziq-gudance status
echo "------> Guidance service stopped  <------"

cd /disk1/voziq/voziq-srv/guidance/bin/
ls -l

echo "------> Backup Existing jar file  <------"
mv voziq-guidance.jar voziq-guidance.jar$(date +"%Y-%m-%d-%T")
ls -l
echo "------> Jar file backup successfully  <------"

echo "------> Moving Build jar File  <------"
mv /disk1/voziq-mount/devops-pipeline-builds/low-code-app/*.jar .
ls -l
echo "------> Jar File moved successfully  <------"

echo "------> Renaming Jar File  <------"
mv com.voziq.guidance*.jar voziq-guidance.jar
chown voziq:voziq voziq-guidance.jar
chmod 755 voziq-guidance.jar
ls -l
echo "------> Jar File renamed successfully  <------"

echo "------> Starting Guidance service  <------"
service voziq-guidance start
service voziq-guidance status
echo "------> Guidance service started  <------"
