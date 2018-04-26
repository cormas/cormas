actions
addPovMethods
	
	| anEntity aList |
	(anEntity := self observedEntitiesList selection) 
		ifNil: [ 
			self alertMessage: self translator tSelectEntity.
			^ nil].
	self entitySelected value: anEntity name asString.
	aList := anEntity availablePov asOrderedCollection.
	(aList includes: #nil) ifTrue: [aList remove: #nil].
	aList removeAll: self povMethodsList_WithoutDefaultSign list.
	aList isEmpty
		ifTrue: [ ^ self alertMessage: self translator tNoMorPoV ].
	methodsToAddList := self multiSelectionList with: aList.
	self class winAddMethods_title: self translator tPoVMethods.
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