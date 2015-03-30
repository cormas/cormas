actions
inspect
	
	| item class id |
	item := self occupantsList selection.
	item notNil
		ifTrue:
			[class := (item tokensBasedOn: Character space) first asSymbol.
			id := (item tokensBasedOn: $#) last asNumber.
			(theOccupants detect: [:a | a class name = class and: [a id = id]])
				inspect]