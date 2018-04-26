biology
move
	"The Forager examines its current location and around. From those not occupied, he chooses the one containing the plant with the highest energy. If the chosen plant would yield enough food to meet their catabolic rate (2 units), he moves there. If not, he moves instead to a randomly chosen adjacent free place (not occupied by another forager)"
	
	| goodCells |
	goodCells := self patch neighbourhoodAndSelf
		select:
			[:cell | cell biomass > self class catabolicRate and: [cell noOccupant]].
	goodCells isEmpty
		ifTrue: [self randomWalkConstrainedBy: [:c | c noOccupant]]
		ifFalse:
			[self
				moveTo:
					(goodCells asSortedCollection: [:c1 :c2 | c1 biomass > c2 biomass]) first]