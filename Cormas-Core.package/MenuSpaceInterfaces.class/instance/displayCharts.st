actions
displayCharts
	
	| item class id agent |
	item := self occupantsList selection.
	item notNil
		ifTrue:
			[class := (item tokensBasedOn: Character space) first asSymbol.
			id := (item tokensBasedOn: $#) last asNumber.
			agent := theOccupants
				detect: [:a | a class name = class and: [a id = id]].
			self halt	"self openChartsOn: idList"]