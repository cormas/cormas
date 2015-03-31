actions
addManipMethods
	
	| anEntity aList |
	anEntity := self manipEntitiesList selection.
	anEntity
		ifNil:
			[self cormas warn: 'An entity must be selected'.
			^nil].
	self entitySelected value: anEntity name asString.
	aList := anEntity methodsForControl asList.
	aList removeAll: self manipMethodsList list.
	aList isEmpty
		ifTrue: [^self cormas warn: 'No more methods can be added to this list'].
	methodsToAddList := MultiSelectionInList with: aList.
	(self openDialogInterface: #winAddMethods) ifFalse: [^nil].
	aList := self manipMethodsList list copy.
	aList addAll: methodsToAddList selections.
	aList sort: [:x :y | x < y].
	self manipMethodsList
		setList: aList
		selecting: Array new.
	self manipMethods
		at: self manipEntitiesList selection
		put: self manipMethodsList list