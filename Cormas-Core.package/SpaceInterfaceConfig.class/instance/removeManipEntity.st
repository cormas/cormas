actions
removeManipEntity
	
	| anEntity |
	anEntity := self manipEntitiesList selection.
	self removeEntityListName: #manipEntitiesList.
	(anEntity isNil not and: [self canBeMoved keys includes: anEntity])
		ifTrue: [self canBeMoved at: anEntity put: false].
	(anEntity isNil not and: [self manipWholePop keys includes: anEntity])
		ifTrue: [self manipWholePop at: anEntity put: false].
	(anEntity isNil not and: [self canChangeValues keys includes: anEntity])
		ifTrue: [self canChangeValues at: anEntity put: false]