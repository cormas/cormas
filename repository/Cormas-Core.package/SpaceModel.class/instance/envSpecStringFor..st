user interface
envSpecStringFor: spatialEntityName
	"compute the description of the environnment (for the spaceInterface title)"
	
	| s nb |
	s := (String new: 100) writeStream.
	s
		nextPutAll:
			(self boundaries = #torroidal
				ifTrue: ['Torroidal ']
				ifFalse: ['Closed ']).
	(spatialEntityName = self cellClass name
		and: [self gridCellShape ~= #irregular])
		ifTrue:
			[s
				print: self line;
				nextPutAll: ' x ';
				print: self column.
			nb := self elementaryEntities size.
			self line * self column > nb
				ifTrue:
					[s
						nextPutAll: ' restricted to ';
						print: nb].
			self nbNeighbours = #eight | (self nbNeighbours = 8)
				ifTrue: [s nextPutAll: ' (8)'].
			self nbNeighbours = #six | (self nbNeighbours = 6)
				ifTrue: [s nextPutAll: ' (6)'].
			self nbNeighbours = #four | (self nbNeighbours = 4)
				ifTrue: [s nextPutAll: ' (4)']]
		ifFalse:
			[s
				print:
					(self cormasModel
						perform: ('the' , spatialEntityName asString , 's') asSymbol) size].
	s nextPutAll: '  '.
	^s contents