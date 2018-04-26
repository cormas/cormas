actions
addManipMethods
	
	| anEntity aList |
	(anEntity := self manipEntitiesList selection) 
		ifNil: [
			self alertMessage: self translator tSelectEntity.
			^ nil].
	self entitySelected value: anEntity name asString.
	aList := anEntity methodsForControl asOrderedCollection.
	aList removeAll: self manipMethodsList list.
	aList isEmpty
		ifTrue: [ ^ self alertMessage: self translator tNoMoreMethods ].
	methodsToAddList := self multiSelectionList with: aList.
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