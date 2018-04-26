+ displaying
colorN: aColorSymbol
	"Purpose: for each neighours, changes background color to a given color (to draw observer attention to the neighbourhood)
Argument: aColorSymbol = <ByteSymbol>
Example: self colorN: #pink"
	
	self neighbourhood isNil
		ifFalse: [self neighbourhood do: [:v | v color: aColorSymbol]]