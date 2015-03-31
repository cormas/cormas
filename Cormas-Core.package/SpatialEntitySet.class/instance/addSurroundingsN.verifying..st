+ components - managing
addSurroundingsN: nbNewCells verifying: aCondition
	"Purpose: swells on its outer perimeter by a givent number of new components verifying a specified condition
Arguments: nbNewCells = <Integer>
			aCondition = <BlockClosure>
Return value: <Boolean> (has it spread or not)
Example: self swellWithNbCells: 10 verifying: [:c | c isClosed not]"
	
	| newCells targetSize nbRemainingAdditions |
	nbRemainingAdditions := nbNewCells.
	targetSize := self size + nbNewCells.
	[nbRemainingAdditions > 0]
		whileTrue:
			[newCells := self surround
				select:
					[:c | (c isComponentOf: self class) not and: [aCondition value: c]].
			newCells := Cormas
				selectRandomlyFrom: newCells
				subCollectionSize: targetSize - self size.
			nbRemainingAdditions := newCells isEmpty
				ifTrue: [0]
				ifFalse: [nbRemainingAdditions - newCells size].
			self addComponents: newCells].
	^newCells isEmpty not