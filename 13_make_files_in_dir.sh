#! /bin/bash 
: '
Poďme na menšie zasvinenie adresára. Tzv 2.0 Urobte script ktorý:

1. Vytvorí adresár s aktuálnym dátumom (rok-mesiac-deň)

2. Ak daný adresár existuje, tak ho nevytvárajte. 

3. V danom adresári vytvorte 2 súbory:

    súbor v ktorom bude dátum rozdelený v riadkoch. Teda na prvom riadku bude rok, na druhom mesiac, na treťom deň, na štvrtom hodina, na piatok minúta, na šiestom sekunda
    súbor v ktorom budú 2 odstavce Lorem Ipsum. Za nadpisom Lorem Ipsum bude aktuálny deň - slovom, a medzi odstavcami nech je aktuálny mesiac - tiež slovom.
'
NAME=$( date | cut -d " " -f2,3,6 | awk '{print $3 "-" $1 "-" $2}' )
if [ ! -d "DIR_$NAME" ]
then
	mkdir "DIR_$NAME"
fi
cd "DIR_$NAME"
lorem=$(lorem -p 1)
echo "Lorem ipsum" > lorem.txt
echo $( date | cut -d " " -f1 ) >> lorem.txt
echo $lorem >> lorem.txt
echo $( date | cut -d " " -f2 ) >> lorem.txt
echo $lorem >> lorem.txt

TEXT=$( date | awk '{print $6 " " $2 " " $1 " " $4}' | sed 's/:/ /g' )
echo $TEXT >> date.txt




