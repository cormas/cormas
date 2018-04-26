+ displaying
colorE: aColor
	"Purpose: for each element of the epidermis, changes background color to a given color (to draw observer attention to the surround)
Argument: aColorSymbol = <ByteSymbol>
Example: self colorS: #pink"
	
	self getEpidermis do: [:v | v color: aColor]