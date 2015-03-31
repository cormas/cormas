actions
addInfoMethods
	
	| anEntity aList |
	anEntity := self observedEntitiesList selection.
	anEntity
		ifNil:
			[self cormas warn: 'An entity must be selected'.
			^nil].
	self entitySelected value: anEntity name asString.
	aList := anEntity availableInfo asList.
	(aList includes: #nil) ifTrue: [aList remove: #nil].
	aList removeAll: self infoMethodsList_WithoutDefaultSign list.
	aList isEmpty
		ifTrue: [^self cormas warn: 'No more info can be added to this list'].
	methodsToAddList := MultiSelectionInList with: aList.
	self class winAddMethods_title: 'Info Methods'.
	(self openDialogInterface: #winAddMethods) ifFalse: [^nil].
	aList := self infoMethodsList list copy.
	aList addAll: methodsToAddList selections.
	aList sort: [:x :y | x < y].
	self infoMethodsList
		setList: aList
		selecting: Array new.
	self infoMethods
		at: self observedEntitiesList selection
		put: self infoMethodsList_WithoutDefaultSign list.
	self spaceInterface initMenuInfo