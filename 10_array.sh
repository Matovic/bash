#! /bin/bash
: '
Keď už máme tú array. Ulož do array názvy mien svojich najbližších príbuzných. Len mená, žiadne priezviská. Dbaj na GDPR!!! :-D

A potom vypíš z array všetky mená, a doplň či je to muž, alebo žena, alebo pes, alebo mačka.'
declare -A NAME
unset NAME[0]
NAME[man]="Lubo, Fero"
NAME[hamster]="Amadeus" 
NAME[woman]="Andrea"
for key in ${!NAME[@]}
do
	echo ${NAME[$key]} is $key
done
