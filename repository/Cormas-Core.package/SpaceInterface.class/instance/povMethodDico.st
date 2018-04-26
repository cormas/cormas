accessing
povMethodDico
	"a Dictionary containing #Class name -> #povSelector"
	
	^povMethodDico ifNil: [povMethodDico := Dictionary new]