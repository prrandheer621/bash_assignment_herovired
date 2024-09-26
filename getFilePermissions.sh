#!/bin.bash
read -p "Enter file path you want to check permissions for: " name

#Check if entered file is valid or not.
if [ ! -f $name ]; then
    echo "No such file exists."
    exit 1
fi

#Extract permission from file stat.
perm=$(stat -c "%a %n" $name | awk '{print $1}')

#1st char denotes owner permissions in e.g. 644, 2nd char denotes group permissions, 3rd char denotes other permissions, extract all 3
ownerPerm=$(echo $perm | cut -b 1)
groupPerm=$(echo $perm | cut -b 2)
otherPerm=$(echo $perm | cut -b 3)

#Create a function which will take each char of permission and echo respective permissions.
function getPermString () {
    if [ $1 -eq 7 ]; then
        echo "read, write and execute"
    elif [ $1 -eq 6 ]; then
	echo "read and write"
    elif [ $1 -eq 5 ]; then
        echo "read and execute"
    elif [ $1 -eq 4 ]; then
        echo "read"
    elif [ $1 -eq 3 ]; then
        echo "write and execute"
    elif [ $1 -eq 2 ]; then
        echo "write"
    elif [ $1 -eq 1 ]; then
        echo "execute"
    else
        echo "none"
    fi
}

#Call the function with respective permission.
echo -e "Owner has $(getPermString $ownerPerm)\nGroups has $(getPermString $groupPerm)\nOthers has $(getPermString $otherPerm)"
