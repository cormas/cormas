private - regular cells - instance creation
initEdge
	
	| n |
	self gridCellShape = #irregular ifTrue: [^self setIrregularEntitiesEdge].
	nbNeighbours == #four
		ifTrue: [n := 4]
		ifFalse:
			[nbNeighbours == #six
				ifTrue: [n := 6]
				ifFalse:
					[nbNeighbours == #eight
						ifTrue: [n := 8]
						ifFalse: [self halt]]].
	self elementaryEntities
		do:
			[:p | 
			p neighbourhood size = n
				ifTrue: [p edge: false]
				ifFalse: [p edge: true]]