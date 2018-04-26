accessing
fillDico
	"a Dictionary containing #Class name -> true or false"
	
	^fillDico ifNil: [fillDico := Dictionary new]