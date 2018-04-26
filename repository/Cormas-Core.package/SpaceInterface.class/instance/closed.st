menu - actions
closed
	
	spaceModel boundaries ~= #closed
		ifTrue:
			[spaceModel boundaries: #closed.
			spaceModel
				initNeighbourhood;
				initEdge.
			self boundariesChanged]