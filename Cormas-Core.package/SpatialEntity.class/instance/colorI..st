+ displaying
colorI: aColorSymbol
	"Purpose: for each included spatial entities, changes background color to a given color (to draw observer attention to the neighbourhood)
Argument: aColorSymbol = <ByteSymbol>
Example: self colorI: #pink"
	
	self includedEntities isNil
		ifFalse: [self includedEntities do: [:v | v color: aColorSymbol]]