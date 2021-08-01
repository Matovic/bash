#!/bin/bash
: '
Vytvor script, ktorý bude zobrazovať náhodné príklady. Samozrejme, nech je tam nejaký vstup pre používateľa, aby zadal výsledok. Ak zadá dobrý výsledok, nech vypíše nejaké echo o tom aký je Borec, a ako ho ženy milujú. Ak vypočíta zle, tak tiež nejaké echo. Moc ho nezhadzuj, každému sa to občas stane, ale nech aspoň vidí aký mal byť správny výsledok, aký výsledok zadal on, a o koľko sa ten neštastník pomýlil.
'
number1=$RANDOM
number2=$RANDOM
number3=$RANDOM
op=$(expr $number3 % 4)
echo $op
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
exit
elif [ $result -eq $user_input ]
then
echo Good!
else
echo Loser! Correct result is: $result
fi
