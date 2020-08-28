#!/bin/bash

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

# End of script #



