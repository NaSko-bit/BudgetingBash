#!/bin/bash

#simple menu
	CHOICE=$(whiptail --title "GENERIC MENU" --menu "SELECT AN OPTION" 25 78 16 \
		"Option 1" "It does stuff"\
		"Option 2" "It does stuff too"\
		"Option 3" "Try to guess it" 3>&1 1>&2 2>&3)

	case "$CHOICE" in
		"Option 1")
			echo "YOU CHOOSED OPTION 1" > option1
			whiptail --textbox option1 12 80
			;;

		"Option 2")
			echo "YOU CHOOSED OPTION 2" > option2
			whiptail --textbox option2 12 80
			;;
		"Option 3")
			echo "YOU CHOOSED OPTION 3" > option3
			whiptail --textbox option3 12 80
			;;
	esac
