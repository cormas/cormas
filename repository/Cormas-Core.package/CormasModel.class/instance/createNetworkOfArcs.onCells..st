+ instance creation - nodes & arcs
createNetworkOfArcs: anArcClass onCells: listOfCells
	"create a Network of arcs (instances of anArcClass) located on the listOfCells"
	
	| anArc network |
	listOfCells size < 2 ifTrue: [^nil].
	anArc := (self newEntity: anArcClass)
		initFromCell: listOfCells first
		toCell: (listOfCells at: 2).
	listOfCells size < 3 ifTrue: [^anArc fullNetwork].
	3
		to: listOfCells size
		do:
			[:i | 
			anArc := (self newEntity: anArcClass)
				initFromCell: (listOfCells at: i - 1)
				toCell: (listOfCells at: i)].
	network := anArc fullNetwork.
	self updateEntities.
	^network