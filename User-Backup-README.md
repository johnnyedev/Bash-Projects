# Script Status: WORKING #

# User Backup Script Information #
### This script will ask the user which $user they want to create a backup for. Then using tar with gzip compression
### it will back up the home directory.

# How it Works #
###     Step 1:) Runs function Get_Name. This function asks the user for the $name (username) to create a backup for.
###              It then has a if statement to ensure that the user exists on the machine.
###     Step 2:) Runs the funcation Get_Compression_Tpe. Which allows the user to select between gzi (gz),
###              bzip2 (bz2) or none (none)
###     Step 3:) Runs the funcation Create_Tar_compression. Which uses the tar command with the compression type
###             choosen in previous step to create the backup
###     Step 4:) Run the funcation Move_Backup. Which creates a copy of the back up in the usrs home directory.


# To Do #
###     ~ Turn into a one liner

# Advance To Do #
###     ~ Push the tar.gz file newly created to a AWS ECS instance for off premise storage

# What does this script do? #
### This script automates the task of created user account backups. This basically creates a TAR archive that is compressed by gzip of the /home/$name/ directory. 

