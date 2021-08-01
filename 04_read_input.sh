#!/bin/bash

: '
V poslednom scripte sme overili, či string obsahuje číslo a veľké a malé písmeno. Pridaj overenie na existenciu znakov, ale najskôr over či je heslo dostatočne dlhé (dĺžku nechám na teba). 

Ale sprav to tak, že sa heslo nebude posielať do scriptu, ale skript vyzve používateľa na zadanie hesla. A ak nieje dlhé, tak nech má možnosť zadať heslo znovu.
'

while :
do
	read -p "Enter password: " password

	if [[ $password =~ [0-9] && $password =~ [a-z] && $password =~ [A-Z] && ${#password} -gt 5 ]]
	then
	echo ${password} "with length ${#password} is valid!"
	break
	else
	echo "Try again!"
	fi
done
