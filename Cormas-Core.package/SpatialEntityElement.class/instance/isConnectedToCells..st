+ testing
isConnectedToCells: setOfCells
	"Purpose: answer if the current cell touches at least one of the setOfCells"
	
	self neighbourhoodAndSelf
		do: [:c | (setOfCells includes: c) ifTrue: [^true]].
	^false