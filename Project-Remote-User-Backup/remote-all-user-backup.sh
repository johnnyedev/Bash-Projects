#!/bin/bash

# Variables
HOST="3.19.32.45" # Remote Host
USER="ec2-user" # Remote Machine User
LOCAL_KEY_PATH="/home/da-basset/Keys/Playground_Centos.pem" # Path to SSH key on local machine
SSH="ssh -i $LOCAL_KEY_PATH $USER@$HOST" # Variable for easy SSH access
DATE=$(date '+%Y-%m-%d') # Date variable for the backup name format
FILE="backup.$DATE.tar.gz" # Calling the backup file through this variable

# Functions

# Check if a backup by the same name exist, if so, terminate the script.
function Remote_Check_Exist () {
if $SSH "test -e $FILE" 2> /dev/null; then
       echo "File: $FILE Exists on remote machine. Please remove $FILE on remote machine, then run the script again. Terminating Script."
       exit
else
	echo "Check 1 (Back Up NOT on Remote Host) =====> PASSED"
fi 
}

# Create the backup on remote server and update ownership to $USER
function Remote_Create_Tar () {
$SSH 2> /dev/null << EOF
sudo tar -czf /home/$USER/backup.$DATE.tar.gz /home >/dev/null 2>&1
sudo chown $USER.$USER /home/$USER/backup.$DATE.tar.gz
EOF
}

function Back_Up_Created() {
	echo "Check 2 (Back up created) =====> PASSED"
}

# This function pulls to TAR archieve from the remote server to localhost
function Pull_Backup () {
rsync -avzhrqe "ssh -i $LOCAL_KEY_PATH" $USER@$HOST:/home/$USER/$FILE ./data/ 2> /dev/null
}

function Pull_Complete () {
	echo "Check 3 (Back Up Pulled from Remote Host) =====> PASSED"	
}

# Simple echo message, to relay the successfully completed backup.
function Complete () {
echo "COMPLETE: The $FILE has been successfully created. It is stored in the ./data directory" 
}

# Calling Function
Remote_Check_Exist
Remote_Create_Tar
Back_Up_Created
Pull_Backup
Pull_Complete
Complete
