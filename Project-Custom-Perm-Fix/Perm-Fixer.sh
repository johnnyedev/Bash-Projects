#!/bin/bash

# What this script will do #
### 	~ Ask user if they want to set permissions on File or Directories
###	~ Ask the user what permissions they would like to set on files/directories
###	~ The script should be recursive so that all files/directories below the doc root will be changed
###	~ Provide a warning to the user about possible breaks due to perm fixer. Ask to proceed.

# Starting Script #

# Functions #

function Intro_Header {
	printf "This is Perm Fix v1.0!" && printf "\n This is a custom permission fixer for directories and files. Becareful using this. It can break things"
}

function Get_Type {
	read -ep "Do you want to correct the permissions on files, directories or both? (file, directory, both) " The_Type
}

function Get_Path {
	read -ep "What Path do you want to correct these permissions on? " The_Path
}

function Get_Permissions {
	read -ep "What Permissions do you want to set? Format 644 or 777. " The_Permissions
}

function The_Approval {
	read -ep "You have choosen to use Perm Fixer v1.0 on $The_Path for $The_Type with the permissions of $The_Permissions , \n did you awnt to move forward? (yes or no)" The_Approval
}

function Correct_Permissions {
	if [ $The_Approval = yes ] ; then
		if [ $The_Type = file ] ;then
			find $The_Path -type f -exec chmod $The_Permissions {} \;
		elif [ $The_Type = directory ] ;then
			find $The_Path -type d -exec chmod -R $The_Permissions {} \;
		else
			find $The_Path -exec chmod -R $The_Permissions {} \;
#	else
#		printf "You choose not to move forward, closing script" && exit
fi
fi 
}


# Calling Functions #
Intro_Header
printf "\n"

Get_Type
printf "\n"

Get_Path
printf "\n"

Get_Permissions
printf "\n"

The_Approval
printf "\n"

Correct_Permissions
printf "\n"





















# End Script #
