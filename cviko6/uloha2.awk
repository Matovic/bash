{
	# make array storing count of each ip
	a[$1]++;
}
END {
	counter = 0;
	for (ip in a){
		if (counter > 9) {
			break;
		}

		max_count = a[ip];
		max_ip = ip;

		for (ip2 in a) {
			if (a[ip2] > max_count) {
				max_count = a[ip2];
				max_ip = ip2;
			}
		}
		a[max_ip] = 0;
		counter += 1;
		print max_ip;	
	}
}
