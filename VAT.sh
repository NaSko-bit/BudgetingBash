#!/bin/bash

# 1 is base, 2 is vatDecimal
calculateVAT(){
	local vatValue=$(echo "$1 * $2"|bc)
	local total=$(echo "$1 + $vatValue"|bc)
	echo THE VALUE OF VAT FOR $1 IS $vatValue
	echo THE TOTAL VALUE IS $total
	echo
	echo
	echo
	echo
}

# 1 is total, 2 is vatDecimal
calculateNet(){
	local netPrice=$(echo "$1 / (1 + $2)"|bc)
	local vatValue=$(echo "$1 - $netPrice"|bc)
	echo THE NET VALUE IS $netPrice
	echo THE NET VALUE IS $vatValue
	echo
	echo
	echo
	echo
}

# Reading files (invoices)
Read(){
	local filepath=$1
	while read -r line; do
		echo $line
	done < $filepath
	echo
	echo
	echo
	echo
}

# MAIN FUNC
while [ 1 -eq 1 ]; do
	echo 1 - CHECK VALUE WITH VAT
	echo 2 - CHECK VALUE WITHOUT VAT
	echo 3 - OPEN INVOICE
	echo 4 - EXIT
	read -p "ENTER YOUR CHOICE: " choice
	if [ $choice -eq 1 ]; then
		read -p "ENTER VALUE WITHOUT VAT: " base
		read -p "ENTER VAT %: " vatPercent
		if [[ ! $base =~ ^[0-9]+(\.[0-9]+)?$ || ! $vatPercent =~ ^[0-9]+(\.[0-9]+)?$ ]] then
			echo WRONG INPUT
			continue
		fi
		vatDecimal=$(echo "scale=2; $vatPercent / 100"|bc)
		calculateVAT $base $vatDecimal
	elif [ $choice -eq 2 ]; then
		read -p "ENTER TOTAL VALUE WITH VAT: " total
		read -p "ENTER VAT %: " vatPercent
		if [[ ! $total =~ ^[0-9]+(\.[0-9]+)?$ || !  $vatPercent =~ ^[0-9]+(\.[0-9]+)?$ ]] then
			echo WRONG INPUT
			continue
		fi
		vatDecimal=$(echo "scale=2; $vatPercent / 100"|bc)
		calculateNet $total $vatDecimal
	elif [ $choice -eq 3 ]; then
		echo
		echo
		echo
		searchDir=./invoices
		declare -a invoices
		index=0
		for entry in "$searchDir"/*;
	       	do	
			invoices[ $index ]=$entry
			echo $index - $entry
			index=$((index+1))
		done
		read -r -p "SELECT FILE: " selection
		echo
		echo
		echo
		echo
		Read ${invoices[ $selection ]}


	elif [ $choice -eq 4 ]; then
		echo GOODBYE
		echo
		echo
		echo
		echo
		break
	else
		echo WRONG INPUT!
		echo
		echo
		echo
		echo
	fi
done
