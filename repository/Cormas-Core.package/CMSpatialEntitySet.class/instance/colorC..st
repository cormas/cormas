+ displaying
colorC: aColor
	"Purpose: for each component, changes background color to a given color (to draw observer attention to the components)
Argument: aColorSymbol = <ByteSymbol>
Example: self colorC: #pink"
	
	self components isNil
		ifFalse: [self components do: [:v | v color: aColor]]