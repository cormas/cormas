- deprecated
aggregatesInstancesOf: entityE condition: methodName
	
	| nameEntitiesE theInterestingEntitiesE setOfComponents seed neighbours newNeighbours |
	self halt.	"should not implement anymore"
	nameEntitiesE := 'the' , entityE name asString , 's'.
	theInterestingEntitiesE := ((self cormasModel
		perform: nameEntitiesE asSymbol) select: [:c | c perform: methodName])
		copy asOrderedCollection.
	[theInterestingEntitiesE isEmpty]
		whileFalse:
			[setOfComponents := Set new.
			seed := theInterestingEntitiesE first.
			setOfComponents add: seed.
			neighbours := seed neighbourhood select: [:v | v perform: methodName].
			[neighbours isEmpty]
				whileFalse:
					[setOfComponents addAll: neighbours.
					newNeighbours := Set new.
					neighbours
						do:
							[:v | 
							newNeighbours
								addAll:
									(v neighbourhood
										select:
											[:u | (u perform: methodName) and: [(setOfComponents includes: u) not]])].
					neighbours := newNeighbours].
			setOfComponents size > 1
				ifTrue:
					[setOfComponents := setOfComponents asOrderedCollection.
					setOfComponents
						remove: seed;
						addFirst: seed.
					self aggregate: setOfComponents].
			setOfComponents do: [:c | theInterestingEntitiesE remove: c]]