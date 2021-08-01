#! /bin/bash
: '
Vieš čo by bolo super? Keby sme prinútili používateľa písať. Lebo ak mu dáš na výber y/n tak stlačí buď y alebo n alebo enter. Ale my chceme aby napísal slovo yes. Alebo ešte lepšie slovo "Áno". No schválne, či bude user vedieť nájsť veľké písmeno pre dlhé a.


Takže script bude pokračovať len vtedy, ak zadá "Áno".
'

while :
do
	read -p "To stop script, write Áno: " user_input
	if [ $user_input == "Áno" ]
	then
	break
	fi
done
