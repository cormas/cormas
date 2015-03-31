+ components - managing
addSurroundingsN: nbNewCells
	"Purpose: swells on its outer perimeter by a givent number of new components
Argument: nbNewCells = <Integer>
Return value: <Boolean> (has it spread or not)
Example: self swellWithNbCells: 10"
	
	^self
		addSurroundingsN: nbNewCells
		verifying: [:c | true]