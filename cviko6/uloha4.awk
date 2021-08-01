{
	if ($9 ~/^(4..|5..)$/) {
		arr[$11]++;
	}
}

END {
	for (url in arr) 
		print url, arr[url] | "sort -nk2 | awk '/[a-z]/{print $1}' | tail -n 1"
}
