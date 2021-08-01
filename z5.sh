#! /bin/bash
#
# Meno: Erik Matovic
# Kruzok: Piatok 8:00, Ing. Juraj Petrik
# Datum: 09.12.2020 
# Zadanie: zadanie05
#
# Text zadania:
#
# Zistite, ktori pouzivatelia sa prihlasuju na server OS z viac ako 10tich roznych
# strojov za poslednu dobu (odkedy system zaznamenava tieto informacie).
# Ak bude skript spusteny s prepinacom -n <pocet>, zistite, ktori pouzivatelia
# sa hlasia z viac ako <pocet> strojov.
# Ignorujte prihlasenia, pre ktore nepoznate IP adresu stroja.
# Pomocka: pouzite prikaz last a udaje zo suboru /public/samples/wtmp.2020
#
# Syntax:
# zadanie.sh [-h][-n <pocet>]
#
# Format vypisu bude nasledovny:
# Output: '<meno pouzivatela> <pocet roznych strojov, z ktorych sa hlasil>'
#
# Priklad vystupu:
# Output: 'login1 25'
# Output: 'login2 24'
# Output: 'login3 23'
#
#
# Program musi osetrovat pocet a spravnost argumentov. Program musi mat help,
# ktory sa vypise pri zadani argumentu -h a ma tvar:
# Meno programu (C) meno autora
#
# Usage: <meno_programu> <arg1> <arg2> ...
# <arg1>: xxxxxx
# <arg2>: yyyyy
#
# Parametre uvedene v <> treba nahradit skutocnymi hodnotami.
# Ked ma skript prehladavat adresare, tak vzdy treba prehladat vsetky zadane
# adresare a vsetky ich podadresare do hlbky.
# Pri hladani maxim alebo minim treba vzdy najst maximum (minimum) vo vsetkych
# zadanych adresaroch (suboroch) spolu. Ked viacero suborov (adresarov, ...)
# splna maximum (minimum), treba vypisat vsetky.
#
# Korektny vystup programu musi ist na standardny vystup (stdout).
# Chybovy vystup programu by mal ist na chybovy vystup (stderr).
# Chybovy vystup musi mat tvar (vratane apostrofov):
# Error: 'adresar, subor, ... pri ktorom nastala chyba': popis chyby ...
# Ak program pouziva nejake pomocne vypisy, musia mat tvar:
# Debug: vypis ...
#
# Poznamky: (sem vlozte pripadne poznamky k vypracovanemu zadaniu)
# Funckia error_msg() zobrazuje na stderr chybovú správu.
# Funckia help_show() zobrazuje na stdout help správu.
# Funckia print_users() zabezpecuje logiku riesenia nasledovne: 
# 	1) Osetrenie nedefinovaneho spravania(existencia suboru a overenie zadaneho cisla) 
#	2) Otvorenie zadaneho suboru ako zoznam posledne prihlasenych uzivatelov
#	3) Zotriedenie podla pouzivatelskeho mena
#	4) Vystrihnutie stlpcov, ktore obsahuju pouzivatelske meno a platnu IP adresu
#	5) Odstranenie duplikatov, opakujucich sa riadkoch s rovnakym pouzivatelskym menom a IP adresou
#	6) Sucet pouzivatelov s poctom a ulozenie do VAR
#	7) Zotriedenie od najvacsieho po najmensi
#	8) Ak N < VAR[pocet_index], tak krok 9), inak krok 11), kde N je zadany limit uzivatelov, inak 10
#	9) Vypis; pocet_index+=1
#	10) Krok 8)
#	11) Koniec
# 
# Pouzitie printf vo funkcii help_show() z dovodu pouzitia oddelenia prveho riadku novym riadku. Echo mi zobrazovalo \n vo vypise.
# Riesenie:

# error message function
error_msg() {
	# msg="Error: 'Invalid input, try $0 -h for help.'"
	echo $1 >&2 						# redirect stdout to stderr
	exit 1							# error exit
}

# display help function
help_show() {
	printf "$0 (C) Erik Matovic\n\n"
	# echo "Print users, which logged in to server from more than 10 different machines."
	echo "Usage: $0 [-h] [-n <count>]"
	echo "-h: display this help"
	echo "-n <count>: print users, which logged in to server from more than <count> different machines instead of the 10."
}

# assignemnt logic function
print_users() {
	# check if given argv is number and is not negative number
	if [[ ! $1 =~ ^[0-9]+$ || $1 -lt 0 ]]
	then
		error_msg "Error: 'Invalid input, try $0 -h for help.'" 	# invalid argument was given
	fi
	
	_file=/public/samples/wtmp.2020		# file to read	
       	
	# check if given file exist
	if ! [ -f "$_file" ]
	then
		error_msg "Error: 'File $_file does not exist.'"
		exit 1
	fi

	# get list of users and their counts as <count> <username>	
	_count_users=( `last -f $_file | tr -s ' ' ' ' | cut -d ' ' -f 1,3 | sort | awk '{if ($2 ~ /^[0-9]/) print $0}' | uniq | cut -d ' ' -f 1 | uniq -c | sort -r | tr -s ' ' ' '` )
	
	# last -f $_file - show listing of last logged in users
	# sort - sort users based on username and IP address
	# tr -s ' ' ' ' - replace all sequence of space with just one space
	# cut -d ' ' -f 1,3 - cut first and second column delimited by space
	# awk '{if ($2 ~ /^[0-9]/) print $0}' - display lines that contain correct IP address
	# uniq - omit repeated lines
	# cut -d ' ' -f 1 - cut just usernames
	# uniq -c - count all usernames and omit repeated names
	# sort -r - reverse sort; the bigest number is at the top
	
	echo "Debug: ${_count_users[@]}"		# Debug: print whole list
	
	count_index=0		# index for count of different machines
	user_index=1		# index for usernames
	print_limit=$1		# 10, if no argument is given, otherwise it is given number as argument 
	
	# print all usernames with their count if their count is bigger than print limit
	while [[ ${_count_users[$count_index]} -gt $print_limit && ${_count_users[$count_index]} -ge 0 ]]
	do
		echo "Output: '${_count_users[$user_index]} ${_count_users[$count_index]}'"		# print output
		
		# shift values by 2, because every even number is count of user and every odd number is name of user
		((count_index=count_index+2))
		((user_index=user_index+2))
	done
}

argc=$#		# argument count

# check given arguments
if [[ ($argc -gt 2) || ($argc -eq 2 && $1 != "-n") || ($argc -eq 1 && $1 != "-h") ]]
then
	error_msg "Error: 'Invalid input, try $0 -h for help.'"		# error in given arguments
elif [[ $1 == "-h" ]]
then
	help_show							# show help menu
elif [[ $1 == "-n" ]]
then
	print_users $2							# print user based on second argument
elif [[ $argc -eq 0 ]]
then
	print_users 10							# print 10 users
fi
exit 0									# exit
