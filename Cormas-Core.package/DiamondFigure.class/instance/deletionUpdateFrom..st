changing
deletionUpdateFrom: aFigure
	"Since we're probably connected to the figure that was deleted, remove ourself"
	
	| anElementActivity depts |
	depts := (aFigure dependents
		select: [:fig | Figure allSubclasses includes: fig class])
		asOrderedCollection.
	depts remove: self.
	depts isEmpty
		ifTrue:
			[aFigure removeDependent: self.
			^self removeDependent: aFigure].
	depts size > 1 ifTrue: [self halt].
	anElementActivity := depts first model.
	self model disconnectFromDestination: anElementActivity.
	aFigure removeDependent: self.
	self removeDependent: aFigure