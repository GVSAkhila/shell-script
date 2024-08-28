#!/bin/bash

LOG_Folder="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d '.' -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_Folder/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p "$LOG_Folder"

# Define color codes
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
  echo -e "${R}Please run this script with the root user.${N}" | tee -a "$LOG_FILE"
  exit 1
fi

VALIDATE() {
  if [ $1 -ne 0 ]; then
    echo -e "${2}...${R}failed${N}" | tee -a "$LOG_FILE"
  else
    echo -e "${2}...${G}success${N}" | tee -a "$LOG_FILE"
  fi
}

for package in "$@"; do
  # Check if the package is installed
  dnf list installed "$package" &>>"$LOG_FILE"
  if [ $? -ne 0 ]; then
    echo -e "${R}$package is not installed. Let's install it.${N}" | tee -a "$LOG_FILE"
    dnf install "$package" -y &>>"$LOG_FILE"
    VALIDATE $? "Installing $package"
  else
    echo -e "${Y}$package is already installed. Nothing to do.${N}" | tee -a "$LOG_FILE"
  fi
done
