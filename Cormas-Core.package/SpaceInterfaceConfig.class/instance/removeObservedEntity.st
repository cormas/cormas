actions
removeObservedEntity
	
	| old new test |
	old := self observedEntitiesList list copy.
	self removeEntityListName: #observedEntitiesList.
	new := self observedEntitiesList list.
	test := false.
	old
		do:
			[:aClass | 
			(new includes: aClass)
				ifFalse:
					[test := true.
					(self defaultPov keys includes: aClass)
						ifTrue: [self defaultPov removeKey: aClass]]].
	test
		ifTrue:
			[(self spaceInterface)
				initMenuPov;
				initMenuInfo;
				initMenuTrack]