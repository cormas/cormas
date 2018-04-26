- obsolete
swell
	"The aggregat swells on its surround layer. It swells if there is enough space arround it.
Returns a boolean indicating if it has spread"
	
	| newCells |
	newCells := self surround select: [:c | (c isComponentOf: self class) not].	"newCells := Cormas selectRandomlyFrom: newCells subCollectionSize: nbOfNewCells."
	newCells isEmpty ifTrue: [^false].
	self addComponents: newCells.
	self setSurround.
	^true