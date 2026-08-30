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

# MAIN FUNC
while [ 1 -eq 1 ]; do
	echo 1 - CHECK VALUE WITH VAT
	echo 2 - CHECK VALUE WITHOUT VAT
	echo 3 - EXIT
	read -p "ENTER YOUR CHOICE: " choice
	if [ $choice -eq 1 ]; then
		read -p "ENTER VALUE WITHOUT VAT: " base
		read -p "ENTER VAT %: " vatPercent
		vatDecimal=$(echo "scale=2; $vatPercent / 100"|bc)
		calculateVAT $base $vatDecimal
	elif [ $choice -eq 2 ]; then
		read -p "ENTER TOTAL VALUE WITH VAT: " total
		read -p "ENTER VAT %: " vatPercent
		vatDecimal=$(echo "scale=2; $vatPercent / 100"|bc)
		calculateNet $total $vatDecimal
	elif [ $choice -eq 3 ]; then
		echo GOODBYE!
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
