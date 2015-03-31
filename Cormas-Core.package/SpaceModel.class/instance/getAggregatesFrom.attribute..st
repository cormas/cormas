private - regular polygons
getAggregatesFrom: baseEntity attribute: attributeName
	"Return a collection of sets of contiguous components holding the same attributeName value"
	
	| newCollection seed setOfComponents neighbours newNeighbours theLLEntities |
	self boundaries = #closed ifFalse: [^self warningBoundaries].
	newCollection := OrderedCollection new.
	theLLEntities := ((self cormasModel
		perform: ('the' , baseEntity name asString , 's') asSymbol)
		select: [:c | (c perform: attributeName) isNil not]) copy
		asOrderedCollection.
	[theLLEntities isEmpty]
		whileFalse:
			[setOfComponents := Set new.
			seed := theLLEntities first.
			setOfComponents add: seed.
			neighbours := seed neighbourhood
				select:
					[:v | (v perform: attributeName) = (seed perform: attributeName)].
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
											[:u | 
											(u perform: attributeName) = (seed perform: attributeName)
												and: [(setOfComponents includes: u) not]])].
					neighbours := newNeighbours].
			newCollection add: setOfComponents.
			setOfComponents do: [:c | theLLEntities remove: c]].
	^newCollection