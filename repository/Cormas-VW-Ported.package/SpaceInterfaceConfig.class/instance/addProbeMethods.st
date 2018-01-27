actions
addProbeMethods
	
	| anEntity aList |
	anEntity := self observedEntitiesList selection.
	anEntity
		ifNil:
			[self cormas warn: 'An entity must be selected'.
			^nil].
	self entitySelected value: anEntity name asString.
	aList := anEntity probes asList.
	aList removeAll: self probeMethodsList list.
	aList isEmpty
		ifTrue: [^self cormas warn: 'No more probe can be added to this list'].
	methodsToAddList := MultiSelectionInList with: aList.
	self class winAddMethods_title: 'Probe Methods'.
	(self openDialogInterface: #winAddMethods) ifFalse: [^nil].
	aList := self probeMethodsList list copy.
	aList addAll: methodsToAddList selections.
	self probeMethodsList
		setList: aList
		selecting: Array new.
	self probeMethods
		at: self observedEntitiesList selection
		put: self probeMethodsList list