locate manually
createInstancesOnCell: aCell
	
	| aClass aE |
	self isNbEntitiesToCreatePositive ifFalse: [^self stopLocateManually].
	aClass := self entity value asSymbol class.
	self reduceNbEntitiesToCreateBy: 1.
	aE := cormasModel newEntity: aClass.
	(initMethod value isNil or: [initMethod value = ''])
		ifFalse:
			[(initMethod value includes: $:)
				ifFalse: [aE perform: initMethod value asSymbol]
				ifTrue:
					[aE
						perform: initMethod value asSymbol
						with: (Cormas askUserArgumentsForMethod: initMethod value)]].
	aE isArcEntity
		ifTrue:
			[aE
				initFromCell: aCell
				toCell: aCell randomNeighbour]
		ifFalse:
			[aClass isObjectLocationClass
				ifTrue: [aE isMovedTo: aCell]
				ifFalse: [aE moveTo: aCell]].
	self isNbEntitiesToCreatePositive ifFalse: [self stopLocateManually].
	cormasModel updateEntities.
	self updateNbOfEntities