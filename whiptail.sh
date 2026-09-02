#!/bin/bash

ReadLog(){
	local log_file=vatLog.txt
	while read -r line; do
		echo $line
	done < $log_file
}

# main function
while [ 1 -eq 1 ]; do
    CHOICE=$(whiptail --title "GENERIC MENU" --menu "SELECT AN OPTION" 25 78 16 \
    "1" "VAT LOG" \
    "2" "FILE LOG" \
    "3" "EXIT" 3>&1 1>&2 2>&3)

    if [ $? -ne 0 ]; then
        echo "Whiptail приключи със статус за грешка или изход."
        break
    fi

    case "$CHOICE" in
        "1")
            ReadLog > option1
            whiptail --textbox --scrolltext option1 12 80
            ;;
        "2")
            echo "YOU CHOOSED OPTION 2" > option2
            whiptail --textbox option2 12 80
            ;;
        "3")
            break
            ;;
    esac
done

