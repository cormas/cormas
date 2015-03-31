+ environment - sensing - space
wayTo: anotherCell constraint: aBlock
	"Purpose: gets the shortest way satisfying a constraint to anotherCell 
Arguments: anotherCell = <SpatialEntityElement>
			aBlock = <BlockClosure>
Return value: <Collection(SpatialEntityElement)>
Example: self wayTo: self spaceModel centralLocation constraint: [:c | c isClosed not]"
	
	| distance newRound road step alreadyComputed newRound2 |
	self spaceModel elementaryEntities do: [:c | c resetFlag].
	road := OrderedCollection new.
	alreadyComputed := Set new.
	alreadyComputed add: anotherCell.
	distance := 0.
	anotherCell flag: 0.
	newRound := anotherCell neighbourhood select: [:c | aBlock value: c].
	[newRound isEmpty not and: [(newRound includes: self) not]]
		whileTrue:
			[distance := distance + 1.
			newRound do: [:c | c flag: distance].
			alreadyComputed addAll: newRound.
			newRound2 := Set new.
			newRound
				do:
					[:c | 
					newRound2
						addAll:
							(c neighbourhood
								select:
									[:cc | (aBlock value: cc) and: [(alreadyComputed includes: cc) not]])].
			newRound := newRound2].	"S'il y a un chemin possible, on le reconstruit en remontant le gradient, a partir de l'origine"
	(newRound includes: self)
		ifTrue:
			[step := self.
			[step = anotherCell]
				whileFalse:
					[road add: step.
					step := ((step neighbourhood select: [:c | c flag isNil not])
						asSortedCollection: [:p :s | p flag < s flag]) first].
			road add: step].
	^road