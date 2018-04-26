actions
addProbeMethods
	| anEntity aList |
	anEntity := self observedEntitiesList selection.
	anEntity
		ifNil: [ self alertMessage: 'An entity must be selected'.
			^ nil ].
	self entitySelected value: anEntity name asString.
	aList := anEntity probes asList.
	aList removeAll: self probeMethodsList list.
	aList isEmpty
		ifTrue: [ ^ self alertMessage: 'No more probe can be added to this list' ].
	methodsToAddList := self multiSelectionList with: aList.
	self class winAddMethods_title: 'Probe Methods'.
	(self openDialogInterface: #winAddMethods)
		ifFalse: [ ^ nil ].
	aList := self probeMethodsList list copy.
	aList addAll: methodsToAddList selections.
	self probeMethodsList setList: aList selecting: Array new.
	self probeMethods
		at: self observedEntitiesList selection
		put: self probeMethodsList list