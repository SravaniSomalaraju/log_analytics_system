#!/bin/bash

# Check Java
if java --version >/dev/null 2>&1
then
  echo "Java installation completed"
else
  sudo apt update
  sudo apt install openjdk-8-jdk -y
  echo "Java installation completed"
fi

# Check Hadoop
if [ -d "$HADOOP_HOME" ]
then
  echo "Hadoop installation completed"
else
  echo "Hadoop not installed. Install Hadoop and set HADOOP_HOME"
  exit 1
fi



