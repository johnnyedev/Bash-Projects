#!/bin/bash

### Backup Script Information ###
# This script will ask the user which $user they want to create a backup for. Then using tar with gzip compression
# it will back up the home directory.

### How it Works ###
#	Step 1:) Ask the user for the $name of the account they want to back up
#	Step 2:) The script then verifies that the $name exists on the system
#	Step 3:) If the user does exist the script then verifies with the user that they want to move forward
#	Step 4:) Then a tar script with gzip compress runs
#	Step 5:) The backup_$name.tar.gz is then placed in /home/backup/$name, this directory needs 777 permissions
#	Step 6:) The script then makes a copy of /home/backup/back_$name.tar.gz and places it in the users home directory

### To Do ###
#	~ Turn into a one liner

### Advance To Do ###
#	~ Push the tar.gz file newly created to a AWS ECS instance for off premise storage
#	~ Add a function that allows the user to choose between gzip, b2zip and xz compress types.

#### Start of Script ###

# Ask the user for the $name to backup

echo "Which name do you want to create a backup for?"
read name
name=$name

# If statement to ensure that the $name home directory actaully exists and can be backup.

if [ -d /home/"$name" ] ;then
	echo "The user exist, did you want to complete the backup of user: $name? (yes/no)"
	read answer
	answer=$answer

	if [ $answer == "yes" ] ;then
		tar -czvf /home/backup/$name/backup_$name.tar.gz /home/centos && echo "The user $name backup is complete! It is being stored at /home/$name/backup_$name.tar.gz"

else
	echo "The user does NOT exists, ending script imcomplete!"
fi
fi

# Copying the backup from /home/backup/$name to /home/$name

cp /home/backup/$name/backup_$name.tar.gz /home/$name
echo "A copy of the back up has been placed in $name home directory."
