managing classes
classFromSymbol: aSymbol
	"return the Class of the current model from aSymbol"
	
	^self environment at: aSymbol ifAbsent: nil