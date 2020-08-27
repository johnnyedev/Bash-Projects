#!/bin/bash

# Backup Script Information #
### This script will ask the user which $user they want to create a backup for. Then using tar with gzip compression
### it will back up the home directory.

# How it Works #
###	Step 1:) Runs function Get_Name. This function asks the user for the $name (username) to create a backup for.
###		 It then has a if statement to ensure that the user exists on the machine.
###	Step 2:) Runs the funcation Get_Compression_Tpe. Which allows the user to select between gzi (gz), 
###		 bzip2 (bz2) or none (none)
###	Step 3:) Runs the funcation Create_Tar_compression. Which uses the tar command with the compression type
###		choosen in previous step to create the backup
###	Step 4:) Run the funcation Move_Backup. Which creates a copy of teh back up in the usrs home directory.


# To Do #
###	~ Turn into a one liner

# Advance To Do #
###	~ Push the tar.gz file newly created to a AWS ECS instance for off premise storage

# Start of Script #

### Ask the user for the $name to backup

function Get_Name {
	echo "Which name do you want to create a backup for?"
	read name
	name=$name

if [ ! -d /home/"$name" ] ;then
	echo "The user doesn't exist! Ending Script" && exit
fi
}

### Ask the user for which type of compression to use gzip, b2zip or xz.

function Get_Compression_Type {
 	echo "How did you want to compress the backup? (gz, bz2, none)"
	read type
	type=$type
}

### This function creates the backup with the compression choosen by the funcation Get_Compression_Type

function Create_Tar_Compressed {
	if [ $type = gz ] ;then
		tar -czvf /home/backup/$name/backup_$name.tar.gz /home/$name
	elif [ $type = bz2 ] ;then
		tar -cjvf /home/backup/$name/backup_$name.tar.bz2 /home/$name
	else
		tar -cvf /home/backup/$name/backup_$name.1tar /home/$name
fi
}

### Copying the backup from /home/backup/$name to /home/$name

function Move_Backup {
	cp /home/backup/$name/backup_$name.tar.$type /home/$name
	echo "A copy of the back up has been placed in $name home directory."
}

### Calling Functions

Get_Name
Get_Compression_Type
Create_Tar_Compressed
Move_Backup





