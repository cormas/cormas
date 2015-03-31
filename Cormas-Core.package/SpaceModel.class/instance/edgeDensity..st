landscape indices
edgeDensity: aClass
	"return the data (a number) to be recorded"
	
	| size |
	size := 0.
	(self cormasModel perform: ('the' , aClass name asString , 's') asSymbol)
		do: [:a | size := size + a surround size].
	^size / self cormasModel theESE size