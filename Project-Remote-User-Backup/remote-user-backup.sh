#!/bin/bash

# This script will create a tar backup of the remote users home directory.

# Step 1:) Ask user for SSH information
# Step 2:) Ask user for information to backup
# Step 3:) Access remote machine via SSH and create backup
# Step 4:) Pull the backup from the remote host to localhost

# Functions

function Get_SSH_Info () {
echo "What is the IP address for the remote Machine?"
read REMOTE_IP
echo "What is the SSH Username?"
read SSH_USERNAME
}

function Connect_SSH_Remote () {
echo "What Key did you want to use to access this remote machine?"
read LOCAL_KEY_PATH
exec ssh -i $LOCAL_KEY_PATH $SSH_USERNAME@$REMOTE_IP && uptime && exit
}

# Calling Funcations
Get_SSH_Info
Connect_SSH_Remote
