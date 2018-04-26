private - regular polygons
getAggregatesFrom: baseEntity verifying: aBlock
	
	| eeInstances set seed neighbours newNeighbours collec |
	self boundaries = #closed ifFalse: [^self warningBoundaries].
	eeInstances := ((self cormasModel
		perform: ('the' , baseEntity name asString , 's') asSymbol)
		select: [:c | aBlock value: c]) copy asOrderedCollection.
	collec := OrderedCollection new.	"collec est une collection de set (composants des agregats)"
	[eeInstances isEmpty]
		whileFalse:
			[set := OrderedCollection new.
			seed := eeInstances first.
			set add: seed.
			neighbours := seed neighbourhood select: [:v | aBlock value: v].
			[neighbours isEmpty]
				whileFalse:
					[set addAll: neighbours.
					newNeighbours := OrderedCollection new.
					neighbours
						do:
							[:v | 
							newNeighbours
								addAll:
									(v neighbourhood
										select: [:u | (aBlock value: u) and: [(set includes: u) not]])].
					neighbours := newNeighbours].
			set do: [:c | eeInstances remove: c].
			collec add: set].
	^collec