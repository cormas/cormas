private - regular cells - instance creation
initNeighbourhood
	
	gridCellShape == #squared
		ifTrue:
			[(nbNeighbours == #four or: [nbNeighbours = 4])
				ifTrue: [self initNeighbourhood4]
				ifFalse: [self initNeighbourhood8]]
		ifFalse:
			[(nbNeighbours == #six or: [nbNeighbours = 6])
				ifTrue: [self initNeighbourhood6]
				ifFalse: [self voisinsPolygonesNoeuds: self elementaryEntities]].
	self elementaryEntities do: [:p | p initNeighbourhood]