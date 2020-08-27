# Script Status: WORKING #

# How it Works #
###       Step 1:) Ask the user for the $name of the account they want to back up
###       Step 2:) The script then verifies that the $name exists on the system
###       Step 3:) If the user does exist the script then verifies with the user that they want to move forward
###       Step 4:) Then a tar script with gzip compress runs
###       Step 5:) The backup_$name.tar.gz is then placed in /home/backup/$name, this directory needs 777 permissions
###       Step 6:) The script then makes a copy of /home/backup/back_$name.tar.gz and places it in the users home directory

# What does this script do? #
### This script automates the task of created user account backups. This basically creates a TAR archive that is compressed by gzip of the /home/$name/ directory. 


# The future of this script #
### In future releases I would like to add the below features:
###  ~ Option to choose between gzip, b2zip and xz compress types
###  ~ Option to back up user Databases
###  ~ Option to push the backup to an AWS EC2 instance.
###  ~ Move script to a one liner to be quickly ran on other machines






