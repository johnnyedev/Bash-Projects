#!/bin/bash

# This script uses the HOST.txt file to store a list of remote hosts IPs.
# Then the script will got access each remote machine and create an
# archieved TAR file of the /home directory that is compressed with
# GZIP compression.

# Requirements:
### ~ The $USER has to have sudo privilages on the remote host to complete this script.
### ~ Tar and GZIP has to be installed on remote server
### ~ Must access SSH on remote machine with a KEY

# How to Use:
### Step 1): Download and install from GITHUB
### Step 2): Ensure that the $REMOTE_USER has sudo privilages without passwords on the Remote Host
### Step 3): Update the Variables (REMOTE_USER, LOCAL_KEY_PATH, and LOCAL_BACKUP_PATH) under the #variables section
### Step 4): Update the REMOTE_HOSTS array, to reflect your remote servers IP addresses
### Step 5): Run the script.


# Future of this script
### 1:) I want to turn the if statements into functions, for easier debugging if ever needed
### 2): I want to have this script push the backup to an AWS S3 bucket for low cost storage
### 3): I want to move from using an Array for $REMOTE_HOSTS to using a single FILE. It'll most likely make it easier for a USEr to use.

#Array
REMOTE_HOSTS=("REMOTe_IP" "REMOTE_IP" "REMOTE_IP")

# FOR Loop
for SERVER in ${REMOTE_HOSTS[@]};
do
	# Variables
	REMOTE_USER="USERNAME_HERE" # Remote SSH user with sudo access on all $SERVER
	LOCAL_KEY_PATH="LOCAL_KEY_PATH_HERE" # This is the LOCAL path to the SSH key for the remote server
	LOCAL_BACKUP_PATH="LOCAL_BACKUP_PATH_HERE" # This is the LOCAL path that the backup will be stored at. Must be ./data, provide path full path. 
	SSH="ssh -i $LOCAL_KEY_PATH $REMOTE_USER@$SERVER"
	DATE="$(date '+%Y-%m-%d')"
	FILE="$SERVER.BACKUP.$DATE.tar.gz"


	# If statement to check if $FILE exists on the remote machine. If the file does NOT exist, a backup is created.
	# If the file does exist you get an error and the script terminates
	if $SSH "test -e $FILE" 2> /dev/null; then
		echo "File $FILE EXISTS on remote machine $SERVER. Please remove $FILE on the remote machine, then run the script again. Terminating Script."
		exit
	else
		$SSH 2> /dev/null << EOF
		sudo tar -czf /home/$REMOTE_USER/$FILE /home > /dev/null 2>&1
		sudo chown $REMOTE_USER.$REMOTE_USER /home/$REMOTE_USER/$FILE
EOF
		echo "CREATED backup for $SERVER"
		if $SSH "test -e $FILE" 2> /dev/null; then
			echo " File: $FILE exist on remote host $SERVER. This verifies that the backup was in fact created"
		else
			echo "Something went wrong on Remote Host $SERVER, the backup $FILE was NOT created."
		fi
	fi
	

	# Below rsyncs the Backup from the remote host $SERVER to localhost in the ./data directory
	rsync -avzhrqe "ssh -i $LOCAL_KEY_PATH" $REMOTE_USER@$SERVER:/home/$REMOTE_USER/$FILE $LOCAL_BACKUP_PATH 2> /dev/null

	if [ -f "$LOCAL_BACKUP_PATH/$FILE" ]; then
		echo "The backup $FILE, has been successfully moved from the Remote Host $SERVER to localhost in the ./data directory"
	else
		echo "Something went wrong, the backup was NOT succesfully moved from the Remote Host $server to the localhost."
	fi 
done



