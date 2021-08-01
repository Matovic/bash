{
	sum+=$10; 
	if (/CPU iPhone | Android | Mobile/) {
		sum_mobile += $10; 
		count_mobile++;
	}
} 

END {
	print "Zo vsetkych poziadaviek tvorili mobilne zariadenia:", count_mobile*100/NR, "% a z celkoveho objemu dat to tvori: ", 
	      sum_mobile*100/sum, "%"
}
