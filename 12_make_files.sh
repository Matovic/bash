#! /bin/bash
: ' Viete čo je horšie než bordel? Väčší bordel. Script na vytváranie bordelu uprav tak, aby vyžadoval vstup od používateľa. Bude ho vyžadovať, nebudeme to tam posielať. A aký vstup mu dáme, toľkokrát nám vytvorí ten bordel. Takže ak tam zadáš 10, tak nech vytvorí 10 adresárov a súborov s aktuálnym dátumom a časom. A číslo aktuálneho cyklu daj ako dodatok za názov (20191231-1555-1,...)

Ale ak tam zadáš niečo iné než číslo, tak ho upozorni, že ak jeho výsosť nepozná čísla, tak nech zadá rok narodenia :-D. Fór :-D. Samozrejme, treba to ošetriť, aby tam neposielal znaky.

Ale pre istotu tam daj podmienku, že predsalen, ak by zadal väčšie číslo než napríklad 100, tak nech zadá znovu.

Samozrejme následne ukonči script, a hneď mu aj vylistuj adresár. Nech vie čo spôsobil.
'
if [[ $# -ne 1 || ! $1 =~ ^[0-9]+$ || $1 -gt 100 ]]
then
	echo "Wrong parameters!"
	exit 1
fi
for ((i = 0; i < $1; i++))
do
	NAME=$( date | cut -d " " -f2-4 | sed 's/ //g' | sed 's/:/-/g' )
	mkdir "DIR_$NAME-$i"
	touch "FILE_$NAME-$i"
done
ls
