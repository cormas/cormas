actions
addObservedEntities
	
	| old new test |
	old := self observedEntitiesList list copy.
	self addEntitiesListName: #observedEntitiesList.
	new := self observedEntitiesList list.
	test := false.
	old size = new size
		ifTrue:
			[1
				to: old size
				do: [:i | (old at: i) ~= (new at: i) ifTrue: [test := true]]]
		ifFalse: [test := true].
	test
		ifTrue:
			[(self spaceInterface)
				initMenuPov;
				initMenuInfo;
				initMenuTrack]