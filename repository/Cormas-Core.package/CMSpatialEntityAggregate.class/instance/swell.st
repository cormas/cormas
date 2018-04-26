- control
swell
	"The aggregat swells on its surround layer. It swells if there is enough space arround it and if its size is below givenSize.
	Returns a boolean indicating if it has spread"
	
	| newCells |
	givenSize ifNil: [^super swell].
	self components size >= givenSize ifTrue: [^false].
	newCells := self surround select: [:c | (c isComponentOf: self class) not].	"newCells := Cormas selectRandomlyFrom: newCells subCollectionSize: nbOfNewCells."
	newCells isEmpty ifTrue: [^false].
	self components size + newCells size >= givenSize
		ifTrue:
			[newCells := Cormas
				selectRandomlyFrom: newCells
				subCollectionSize: givenSize - self components size].
	self addComponents: newCells.
	^true