save
saveValues: anOrderedCollection
	"Copy aValue on the right Excel cell then increase the current line."
	
	self dataSavedByLine
		ifTrue: [self fillFirstLineWith: anOrderedCollection]
		ifFalse: [self fillFirstColumnWith: anOrderedCollection]