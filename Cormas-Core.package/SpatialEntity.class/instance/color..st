+ displaying
color: aColorSymbol
	"Purpose: changes background color to a given color (to draw observer attention to the receiver). If aColorSymbol is not a standard Color, it displays the entity in red.
	Argument: aColorSymbol = <ByteSymbol> or <String>
	Example: self color: #pink"
	
	(ColorValue constantNames includes: aColorSymbol asSymbol)
		ifTrue: [self flashColor: (ColorValue perform: aColorSymbol asSymbol)]
		ifFalse: [self flashColor: ColorValue red]