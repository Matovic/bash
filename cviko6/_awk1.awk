BEGIN {
	print "zacinam"
	max_value = 0
	max_meno = ""
}

{
	# ak si na prvej line, tak ju preskoc
	if (NR ==1) {
		next
	}

	if (max_value < $4) {
		max_value = $4
		max_meno = $1
	}
}

END {
	print "koncim, nasiel som najlepsieho z testu 2:", max_meno, "a mal", max_value, "bodov"
}
