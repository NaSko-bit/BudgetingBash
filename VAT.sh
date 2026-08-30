#!/bin/bash
echo 1 - CHECK VALUE WITH VAT
echo 2 - CHECK VALUE WITHOUT VAT
read -p "ENTER YOUR CHOICE: " choice
if [ $choice -eq 1 ]; then
	read -p "ENTER VALUE WITHOUT VAT: " base
	vatValue=$(echo "$base * 0.20"|bc)
	total=$(echo "$base + $vatValue"|bc)
	echo THE VALUE OF VAT FOR $base IS $vatValue
	echo THE TOTAL VALUE IS $total
elif [ $choice -eq 2 ]; then
	read -p "ENTER TOTAL VALUE WITH VAT: " total
	netPrice=$(echo "$total / 1.20"|bc)
	vatValue=$(echo "$total - $netPrice"|bc)
	echo THE NET PRICE IS $netPrice
	echo THE VAT VALUE IS $vatValue
else
	echo WRONG INPUT!
fi
