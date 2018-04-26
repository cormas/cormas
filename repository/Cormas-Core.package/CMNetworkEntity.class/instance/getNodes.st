+ ways
getNodes
	" Calculates and returns the nodes of the network"
	
	nodes := OrderedCollection new.
	self arcs do: [ : arc | 
			arc startNode isNil ifFalse: [ nodes add: arc startNode ].
			arc stopNode isNil ifFalse: [ nodes add: arc stopNode ] ].
	^ nodes