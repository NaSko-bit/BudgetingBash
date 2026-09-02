#!/bin/bash

# main function
while [ 1 -eq 1 ]; do
    # Намаляваме размерите на 15 60 4 за сигурност
    CHOICE=$(whiptail --title "GENERIC MENU" --menu "SELECT AN OPTION" 15 60 4 \
    "1" "Option 1: It does stuff" \
    "2" "Option 2: It does stuff too" \
    "3" "Option 3: Try to guess it" \
    "4" "EXIT" 3>&1 1>&2 2>&3)

    # Проверка дали потребителят е натиснал Cancel/Esc или whiptail е гръмнал
    if [ $? -ne 0 ]; then
        echo "Whiptail приключи със статус за грешка или изход."
        break
    fi

    case "$CHOICE" in
        "1")
            echo "YOU CHOOSED OPTION 1" > option1
            whiptail --textbox option1 12 50
            ;;
        "2")
            echo "YOU CHOOSED OPTION 2" > option2
            whiptail --textbox option2 12 50
            ;;
        "3")
            echo "YOU CHOOSED OPTION 3" > option3
            whiptail --textbox option3 12 50
            ;;
        "4")
            break
            ;;
    esac
done

