#!/bin/bash
#Deleting log files in oderthan 14 days
R="\e[31m"
G="\e[32m"
Y="\e[33m"

SOURCE_DIR="/home/ec2-user/logs"

if [ -d "$SOURCE_DIR" ]; then
  echo -e " $R Source directory exists$N"
else
  echo -e "$G Source directory does not exist $N"
  exit 1
fi

Files=$(find "$SOURCE_DIR" -type f -name "*.log" -mtime +14)

if [ -z "$Files" ]; then
  echo -e "$R No log files older than 14 days found $N"
else
  echo -e "$G Deleting log files:$N"
  while IFS= read -r file;
   do
    echo "Deleting file: $file"
    rm -f "$file"
  done <<< "$Files"
fi
