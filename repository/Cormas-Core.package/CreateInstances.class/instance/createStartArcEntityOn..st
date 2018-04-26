locate manually
createStartArcEntityOn: aStartCell
	
	| aClass initNode |
	self isNbEntitiesToCreatePositive ifFalse: [^self stopLocateManually].
	aClass := self entity value asSymbol class
	self reduceNbEntitiesToCreateBy: 1.
	newArcInstance := cormasModel newEntity: aClass.
	(initMethod value isNil or: [initMethod value = ''])
		ifFalse:
			[(initMethod value includes: $:)
				ifFalse: [newArcInstance perform: initMethod value asSymbol]
				ifTrue:
					[newArcInstance
						perform: initMethod value asSymbol
						with: (Cormas askUserArgumentsForMethod: initMethod value)]].
	initNode := newArcInstance newEntity: newArcInstance startNodeType.
	initNode isMovedTo: aStartCell.
	newArcInstance startNode: initNode.
	initNode checkToReplaceNode	"must be repeated when creating an arc from a place where others nodes already exist "