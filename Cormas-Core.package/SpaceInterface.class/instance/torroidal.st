menu - actions
torroidal
	
	spaceModel boundaries ~= #torroidal
		ifTrue:
			[spaceModel boundaries: #torroidal.
			spaceModel
				initNeighbourhood;
				initEdge.
			self boundariesChanged]