#!/bin/bash

USERID=$(id -u)
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE="/tmp/$SCRIPT_NAME-$DATE.log"

# Define color variables
G="\e[32m"
R="\e[31m"
NC="\e[0m"  # Reset color

# Function to validate command execution
VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "${R} $2 Installation failed${NC}"
        exit 1
    else 
        echo -e "${G} $2 Installation succeeded${NC}"
    fi
}

# Check if the script is run as root
if [[ $USERID -ne 0 ]]; then
    echo -e "${R} Please run this script with root user.${NC}"
    exit 1
fi

# Loop through each argument passed to the script and check if it's installed
for i in "$@"; do
    echo "Checking if $i is installed..."
    yum list installed $i &>>$LOGFILE

    if [ $? -ne 0 ]; then
        echo "Package $i is not installed. Installing..."
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else
        echo "Package $i is already installed."
    fi
done
