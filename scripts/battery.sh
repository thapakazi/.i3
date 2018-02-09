#!/bin/bash
ac=`acpi -b | awk '{print $3}' | tr -d ,`
status=`acpi -b | awk '{print $3}' | tr -d ,` 
percent=`acpi -b | acpi -b | awk '{print $4}' | cut -d % -f 1`
state=`acpi -b|sed -n 's/.*\( [0-9]*:[0-9][0-9]\).*/\1/p'`

if [ "$ac" == "Charging" ]
then
    full_text=" "
elif [ "$ac" == "Discharging" ]; then
    full_text=''
fi


echo "$full_text $state"
echo "$percent $full_text"

# else
#     if [ $percent -lt 20 ]
#     then 
# 	echo "  $percent%";
#     elif [ $percent -lt 40 ]
#     then 
# 	echo "  $percent%";
#     elif [ $percent -lt 60 ]
#     then
# 	echo "  $percent%";
#     elif [ $percent -lt 80 ]
#     then
# 	echo "  $percent%";
#     else
# 	echo "  $percent%"
#     fi 
# fi

# echo "#A8FF00" #green
# echo "#FFF600" #yellow
echo "#FFAE00"   # orange
