BEGIN {
	FS = ":"
	print "zacinam"
	max_value = 0
	max_meno = ""
}
/15/ {bola_patnast = 1}
{
	if ($4 !~ /^[0-9]+$/) {
		next
	}

	if (max_value < $4) {
		max_value = $4
		max_meno = $1
	}
}

END {
	print "koncim, nasiel som najlepsieho z testu 2:", max_meno, "a mal", max_value, "bodov", bola_patnast
}
