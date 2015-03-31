+ components - managing
addSurroundings
	"Purpose: swells on its outer perimeter by the surrounding components 
Return value: <Boolean> (has it spread or not)"
	
	^self addSurroundingsVerifying: [:c | true]