save
saveCollection: anOrderedCollection
	"Copy aValue on the right Excel cell then increase the current line.
 !! anOrderedCollection = only numbers  !!"
	
	self dataSavedByLine
		ifTrue: [self fillLineWith: anOrderedCollection]
		ifFalse: [self fillColumnWith: anOrderedCollection]