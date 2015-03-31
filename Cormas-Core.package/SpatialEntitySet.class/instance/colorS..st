+ displaying
colorS: aColor
	"Purpose: for each element of the surround, changes background color to a given color (to draw observer attention to the surround)
Argument: aColorSymbol = <ByteSymbol>
Example: self colorS: #pink"
	
	self surround isNil ifFalse: [self surround do: [:v | v color: aColor]]