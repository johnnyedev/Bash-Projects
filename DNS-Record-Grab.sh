#!/bin/bash

# Start Script #

# Functions #

function Get_Domain {
	read -ep "Domain: " domain
}

function Get_MX_Record {
	dig $domain mx +short
}

function Get_A_Record {
	dig $domain +short
}

function Add_Lines {
	printf "~~~~~~~~~~~~"
}

# Calling functions #
Add_Lines
printf "DNS records for $domain"
Add_Lines
printf "\n"
Get_Domain
printf "\n"
Add_Lines
printf "MX records"
Add_Lines
printf "\n"
Get_MX_Record
printf "\n"
Add_Lines
printf "Public IP of $domain"
Add_Lines
printf "\n"
Get_A_Record
