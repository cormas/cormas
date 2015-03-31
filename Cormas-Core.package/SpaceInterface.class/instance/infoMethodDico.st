accessing
infoMethodDico
	"a Dictionary containing #Class name -> #infoSelector"
	
	^infoMethodDico ifNil: [infoMethodDico := Dictionary new]