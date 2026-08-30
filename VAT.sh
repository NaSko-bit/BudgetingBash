#!/bin/bash
read -p "Enter value without VAT: " base
vatValue=$(echo "$base * 1.20"|bc)
echo Value with VAT is: $vatValue
