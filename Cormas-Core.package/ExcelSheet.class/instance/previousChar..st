navigation
previousChar: aChar
	"Answer the previous character.
Ex: ExcelSheet new previousChar: $A --> 'C' "
	
	^(aChar asInteger - 1) asCharacter asSymbol asString