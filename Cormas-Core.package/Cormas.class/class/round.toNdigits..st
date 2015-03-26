+ utilities - mathematics
round: aNumber toNdigits: x
	"Purpose: Returns a float value rounded with a specified number of decimals
Argument: aNumber to be rounded   ; x the number of decimals wanted
Example: Cormas round: 5.1675634  toNdigits: 2	=> 5.17
Cormas round: 4/3 toNdigits: 1	=> 1.3"
	
	aNumber isInteger ifTrue: [^aNumber].
	x = 0 ifTrue: [^aNumber rounded].
	^(aNumber * (10 raisedTo: x)) rounded / (10 raisedTo: x) asFloat