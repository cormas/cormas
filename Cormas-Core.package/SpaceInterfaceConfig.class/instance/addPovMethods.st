actions
addPovMethods
	
	| anEntity aList |
	anEntity := self observedEntitiesList selection.
	anEntity
		ifNil:
			[self cormas warn: 'An entity must be selected'.
			^nil].
	self entitySelected value: anEntity name asString.
	aList := anEntity availablePov asList.
	(aList includes: #nil) ifTrue: [aList remove: #nil].
	aList removeAll: self povMethodsList_WithoutDefaultSign list.
	aList isEmpty
		ifTrue: [^self cormas warn: 'No more pov can be added to this list'].
	methodsToAddList := MultiSelectionInList with: aList.
	self class winAddMethods_title: 'POV Methods'.
	(self openDialogInterface: #winAddMethods) ifFalse: [^nil].
	aList := self povMethodsList list copy.
	aList addAll: methodsToAddList selections.
	aList sort: [:x :y | x < y].
	self povMethodsList
		setList: aList
		selecting: Array new.
	self povMethods
		at: self observedEntitiesList selection
		put: self povMethodsList_WithoutDefaultSign list.
	self spaceInterface initMenuPov