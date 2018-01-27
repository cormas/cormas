actions
addAttribute
	
	| anEntity aList |
	anEntity := self observedEntitiesList selection.
	anEntity
		ifNil:
			[self cormas warn: 'An entity must be selected'.
			^nil].
	self entitySelected value: anEntity name asString.
	aList := ((OrderedCollection
		withAll: (DefaultAttributesSetter attributsFromClass: anEntity))
		- (self attributesFor: anEntity)) asList.
	aList isEmpty
		ifTrue:
			[^self cormas warn: 'No more attributes can be added to this list'].
	methodsToAddList := MultiSelectionInList with: aList sorted.
	self class winAddMethods_title: 'Attributes'.
	(self openDialogInterface: #winAddMethods) ifFalse: [^nil].
	aList := self attributesList list copy.
	aList addAll: (methodsToAddList selections collect: [:s | s asString]).
	aList sort: [:x :y | x < y].
	self attributesList
		setList: aList
		selecting: Array new.
	self attributes
		at: self observedEntitiesList selection
		put: self attributesList list