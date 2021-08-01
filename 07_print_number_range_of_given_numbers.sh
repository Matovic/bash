#! /bin/bash
: '
Vieš urobiť script, ktorý niečo vypíše. Alebo nevypíše. Tak si to trochu pomeníme. Najskôr zmeň to, aby script bral do úvahy 2 čísla. Budú znamenať OD a DO.

Čiže script vypíše čísla OD toho čísla ktoré príde ako prvé, po to druhé číslo. Ale:

Ak bude prvé číslo väčšie ako druhé, tak by nemal vypísať nič, ale upozorniť nás na to. Pokračovať nemusí.

Ak bude rozsah čísel veľký tak nechceme zasviniť celú obrazovku. Aj tak ju zasviníme, ale menej. Chceme zobraziť len prvých 5 čísiel a posledných 5.

Teda, ak zadá user číslo 1 a 5, tak ukáže čísla 1,2,3,4,5 - nebude duplikovať 1 až 5

Ak zadá 1 a 8 tak ukáže 1,2,3,4,5,6,7,8 tiež nebude duplikovať 4 a 5.

A ak zadá 1 a 20 ak ukáže Prvých 5 čísiel z rozsahu: 1,2,3,4,5 Posledných 5 čísiel z rozsahu:16,17,18,19,20 - tu nemá čo duplikovať.
'

if [[ $# -ne 2 || ! $1 =~ ^[0-9]+$ || ! $2 =~ ^[0-9]+$ ]]
then
	echo Wrong input!
	exit 1
elif [ $1 -gt $2 ]
then
	echo "Error: 'First number $1 is bigger then second number $2.'"
	exit 1
fi

first=$1
print_first_5_numbers=$(($1 + 5))
print_last_5_numbers=$(($2 - 5))
while [ $2 -ge $first ]
do
	if [[ $first -lt $print_first_5_numbers || $first -gt $print_last_5_numbers ]]
	then
		echo $first
	fi
	((first ++))
done
