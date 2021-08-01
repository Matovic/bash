#!/bin/bash
: '
Urob script, ktorý bude mať sleep na xyz sekúnd. Tieto sekundy budeme posielať ako parameter do scriptu. Ale ako tretí parameter. 
Na prvom bude meno, a na druhom budeme posielať ano/nie.
Po sleepe stačí echo na vstupy, napr.:
Jano, zadal si čas 60 sekúnd a chceš/nechceš ho vykonať.
'

ARGC=$#	# pocet parametrov
EXPECTED_ARGC=3

if [ $ARGC -ne $EXPECTED_ARGC ]
then
echo "Zle parametre!"
exit
fi

name=$1
executable=$2
time=$3
output="nechces"
if [ $executable == "ano" ]
then
output="chces"
sleep $time
fi

echo $name, zadal si cas $time sekund a $output ho vykonat.
	
