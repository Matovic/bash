#! /bin/bash
: '
Sprav script, ktorý pri každom spustení vytvorí súbor a adresár s jedinečnými názvami. Zatiaľ stačí po jednom. Ale aby sme neboli úplní magori, tak ten názov nech je podľa dátumu a času. 
'
NAME=$( date | cut -d " " -f2-4 | sed 's/ //g' | sed 's/://g' )
mkdir "DIR_$NAME"
touch "FILE_$NAME"
