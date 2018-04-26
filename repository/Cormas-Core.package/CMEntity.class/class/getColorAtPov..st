- image
getColorAtPov: aSymbolPOV
	"Returns a ColorValue according to aSymbolPOV).
	If aSymbolPOV is not referenced the colorsDict of the class, returns a default color 
	aSymbolPOV = <Symbol> "
	
	^self colorsDict
		at: aSymbolPOV
		ifAbsent: [ColorValue veryLightGray]