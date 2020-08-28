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


# Calling functions #
printf "~~~~~~~~~~~~"
printf "DNS records for $domain"
printf "~~~~~~~~~~~~"
printf "\n"
Get_Domain
printf "\n"
printf "~~~~~~~~~~~~"
printf "MX records"
printf "~~~~~~~~~~~~"
printf "\n"
Get_MX_Record
printf "\n"
printf "~~~~~~~~~~~~"
printf "Public IP of $domain"
printf "~~~~~~~~~~~~"
printf "\n"
Get_A_Record
