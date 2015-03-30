- deprecated
classFromSymbol: aSymbol
	"Purpose: returns a class from its name
Argument: aSymbol = <Symbol>
Return value: a class
Example: self classFromSymbol: (self bestOpponent strategy, 'Forager', ) asSymbol"
	
	^self class classFromSymbol: aSymbol