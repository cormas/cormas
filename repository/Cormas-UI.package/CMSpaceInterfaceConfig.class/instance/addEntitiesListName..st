actions
addEntitiesListName: aListName
	| aList |
	aList := self entitiesList copy.
	aList removeAll: (self perform: aListName) list.
	aList isEmpty
		ifTrue: [ ^ self alertMessage: self translator tNoMoreEntities ].
	entitiesToAddList := self multiSelectionList with: aList.
	aListName = #createEntitiesList
		ifTrue: [ self class winAddEntities_title: self translator tEntitiesToCreate ].
	aListName = #manipEntitiesList
		ifTrue: [ self class winAddEntities_title: self translator tManipulationEntities ].
	aListName = #observedEntitiesList
		ifTrue: [ self class winAddEntities_title: self translator tObservedEntities ].
	(self openDialogInterface: #winAddEntities)
		ifFalse: [ ^ nil ].
	(self perform: aListName) list addAll: entitiesToAddList selections.
	(self perform: aListName) list sort: [ :x :y | x name < y name ].
	(self perform: aListName) selection: entitiesToAddList selections first.
	aListName = #manipEntitiesList
		ifTrue: [ entitiesToAddList selections
				do: [ :aClass | 
					self canBeMoved at: aClass put: true.
					self manipWholePop at: aClass put: true.
					self canChangeValues at: aClass put: true ] ]