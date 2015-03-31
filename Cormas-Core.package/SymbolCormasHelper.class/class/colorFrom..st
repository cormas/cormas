helping
colorFrom: aColorOrSymbol
	"return a color value for the argument"
	
	^(ColorValue constantNames includes: aColorOrSymbol)
		ifTrue: [ColorValue perform: aColorOrSymbol]
		ifFalse: [ColorValue navy]