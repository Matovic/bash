#! /bin/bash
: '
Pokračujeme v našom sleep scripte. Máme tam áno/nie. Ale možno by bolo lepšie, keby sme si brali do úvahy to, či ten sleep je väčší, alebo menší než určité číslo. Zruš teda ano/nie a prerobíš to. A teda zoberie sa do úvahy to čo pošle a ak je ten čas čo pošle väčší než napríklad 120, tak sa usera opýtame: "Naozaj chceš mať v scripte sleep na xyz sekúnd?". Ak potvrdí tak sa to vykoná, ak to odmietne, tak mu ponúkni zadanie nového času. Potvrdzovanie bude: y/N'

ARGC=$#	
EXPECTED_ARGC=2

if [ $ARGC -ne $EXPECTED_ARGC ]
then
	echo "Wrong parameters!"
	exit 1
fi

name=$1
time=$2
while [ $time -gt "10" ]
do
	read -p "Do you really want $time sleep? y/N: " INPUT
	case $INPUT in 
	y)
		break;;
	*)
		read -p "Enter new time: " time;;
	esac	
done
sleep $time
echo "$name, you entered $time s to sleep and it was executed."
