actions
addEntitiesListName: aListName
	
	| aList |
	aList := self entitiesList copy.
	aList removeAll: (self perform: aListName) list.
	aList isEmpty
		ifTrue: [^self cormas warn: 'No more entities can be added to this list'].
	entitiesToAddList := MultiSelectionInList with: aList.
	aListName = #createEntitiesList
		ifTrue: [self class winAddEntities_title: 'Entities to be Created'].
	aListName = #manipEntitiesList
		ifTrue: [self class winAddEntities_title: 'Manipulation Entities'].
	aListName = #observedEntitiesList
		ifTrue: [self class winAddEntities_title: 'Observed Entities'].
	(self openDialogInterface: #winAddEntities) ifFalse: [^nil].
	(self perform: aListName) list addAll: entitiesToAddList selections.
	(self perform: aListName) list sort: [:x :y | x name < y name].
	(self perform: aListName) selection: entitiesToAddList selections first.
	aListName = #manipEntitiesList
		ifTrue:
			[entitiesToAddList selections
				do:
					[:aClass | 
					self canBeMoved at: aClass put: true.
					self manipWholePop at: aClass put: true.
					self canChangeValues at: aClass put: true]]