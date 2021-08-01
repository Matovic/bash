#! /bin/bash
: '
Vieš o tom že existujú aplikácie, ktoré ti zabránia poslať SMS v určitom čase, skôr než vyriešiš nejakú matematickú hádanku? Napríklad v čase od 22:00 do 6:00. Prečo? Lebo je veľká pravdepodobnosť, že budeš pod parou, a na druhý deň by si to mohol ľutovať. Tak teraz sprav niečo podobné a teda, urob script ktorý by mal po spustení poslať nejakú správu. Tú správu user naťuká na vyzvanie. Ale odoslanie sme ešte nepreberali, takže zatiaľ stačí keď tam bude echo s tou správou. Lenže, skôr než to odošleš, tak zisti aký je deň a čas. A ak je piatok alebo sobota v čase od 22:00 do 6:00, tak najskôr zobraz userovi nejakú matematickú hádanku. Napríklad 124*543 (:-D, alebo niečo ľahšie). Ak to vypočíta správne, tak úlohu splnil a možeš poslať správu (teda zobraziť echo). Ak to nevypočíta správne, tak vypíš, že ďalší príklad sa mu zobrazí o 30 sekúnd. Ak ani to nevypočíta správne, ďalší pokus bude mať o 60 sekúnd s tým, že ak ani potom to nevypočíta správne, tak vypíš: "Poslal  som tento text tvojej žene, ty ožraté prasa". A ozaj, tie príklady nech sú random. Preto tá DÚ pred touto. Môže to byť stále sčítavanie, alebo násobilka, len tie čísla nech sú náhodné.

Takže čo potrebuješ? Zistiť a porovnať dátumy. Zistiť vstup od usera pre text správy. Vypísať nejaké príklady a porovnať s očakávaným výsledkom. Nastaviť sleep, if a ďalší read kvôli získaniu výsledku
'
read -p "Enter message: " msg

hour=$(date | cut -d ' ' -f4 | cut -d ':' -f1)
day=$(date | cut -d ' ' -f1)
if [[ $day != Fri && $day != Sat ]]
then
echo $msg
exit 0 
elif [[ $hour -lt 22 && $hour -gt 6 ]]
then
echo $msg
exit 0
fi

sleep_time=30
while :
do
	number1=$RANDOM
	number2=$RANDOM
	number3=$RANDOM
	op=$(expr $number3 % 4)	
	case $op in
	[0])
	result=$(expr $number1 + $number2)
	echo $number1 + $number2
	;;
	[1])
	result=$(expr $number1 - $number2)
	echo $number1 - $number2 
	;;
	[2])
	result=$(expr $number1 \* $number2)
	echo $number1 \* $number2 
	;;
	[3])
	result=$(expr $number1 / $number2)
	echo $number1 / $number2 
	;;
	esac

	read -p "Enter result: " user_input
	if [[ ! $user_input =~ ^[0-9]+$ && ! $user_input =~ ^-[0-9]+$ ]]
	then
	echo "Wrong input!"
	sleep $sleep_time

	elif [ $result -eq $user_input ]
	then
	echo Good!
	echo $msg
	exit 0

	elif [ $sleep_time -gt 60 ]
	then
	echo "Sending msg anyway"
	echo $msg
	exit 0

	else
	echo "$sleep_time sleep"
	sleep $sleep_time
	fi

	sleep_time=$(($sleep_time + 30))
done
