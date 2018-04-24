tests
testUpperQuartile
"in R with quantile(c(10,20,58,96,48,76,57,68,19,10),type=1), return
  0%  25%  50%  75% 100% 
  10   19   48   68   96
upper quartile, is the value that cuts off the first 75%
"	
	|n|
	n := #(10 20 58 96 48 76 57 68 19 10).
	self assert: (Cormas upperQuartile: n) equals: 68.