landscape indices
edgeDensity: aClass totalArea: aNumber
	"this method is created for cases where the totalArea is not equal to the total size of the grid"
	
	| size |
	size := 0.
	(self cormasModel perform: ('the' , aClass name asString , 's') asSymbol)
		do: [:a | size := size + a perimeter].
	^size / aNumber