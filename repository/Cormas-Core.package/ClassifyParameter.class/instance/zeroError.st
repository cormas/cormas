accessing
zeroError
	"zeroError = Dictionary with #probeName as key and an associated list: moyModified ; moyStandard ;  finalValue ;  currentValue "
	
	^zeroError ifNil: [zeroError := Dictionary new]