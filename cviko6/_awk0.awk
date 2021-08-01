BEGIN {
	print "Zaciname spracovavat"
}
{
	if ($4 < 5 && $5 > 2) {
		print $0
	}
}

END {
	print "koncim"
}
