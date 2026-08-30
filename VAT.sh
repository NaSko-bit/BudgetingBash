#!/bin/bash
while [ 1 -eq 1 ]; do
	echo 1 - CHECK VALUE WITH VAT
	echo 2 - CHECK VALUE WITHOUT VAT
	echo 3 - EXIT
	read -p "ENTER YOUR CHOICE: " choice
	if [ $choice -eq 1 ]; then
		read -p "ENTER VALUE WITHOUT VAT: " base
		read -p "ENTER VAT %: " vatPercent
		vatDecimal=$(echo "scale=2; $vatPercent / 100"|bc)
		vatValue=$(echo "$base * $vatDecimal"|bc)
		total=$(echo "$base + $vatValue"|bc)
		echo THE VALUE OF VAT FOR $base IS $vatValue
		echo THE TOTAL VALUE IS $total
		echo
		echo
		echo
		echo
	elif [ $choice -eq 2 ]; then
		read -p "ENTER TOTAL VALUE WITH VAT: " total
		read -p "ENTER VAT %: " vatPercent
		vatDecimal=$(echo "scale=2; $vatPercent / 100"|bc)
		netPrice=$(echo "$total /(1 + $vatDecimal)"|bc)
		vatValue=$(echo "$total - $netPrice"|bc)
		echo THE NET PRICE IS $netPrice
		echo THE VAT VALUE IS $vatValue
		echo
		echo
		echo
		echo
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
