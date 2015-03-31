private - regular polygons
getSetsOfContiguous: baseEntity conditionalBlocks: blocks conditionalArguments: arguments
	"Return a collection of sets of contiguous components"
	
	| collec seed setOfContiguousComponents neighbours newNeighbours baseEntities valuesB2 valuesB3 |
	self boundaries = #closed ifFalse: [^self warningBoundaries].
	baseEntities := ((self spatialEntities at: baseEntity name)
		select:
			[:c | 
			blocks first
				value: c
				value: arguments first
				value: arguments last]) copy asOrderedCollection.
	collec := OrderedCollection new.
	[baseEntities isEmpty]
		whileFalse:
			[setOfContiguousComponents := Set new.
			seed := baseEntities first.
			setOfContiguousComponents add: seed.
			neighbours := seed neighbourhood
				select:
					[:v | 
					valuesB2 := Array new: 4.
					valuesB2 at: 1 put: v.
					valuesB2 at: 2 put: seed.
					valuesB2
						at: 3
						put: arguments first.
					valuesB2
						at: 4
						put: arguments last.
					(blocks at: 2) valueWithArguments: valuesB2].
			[neighbours isEmpty]
				whileFalse:
					[setOfContiguousComponents addAll: neighbours.
					newNeighbours := Set new.
					neighbours
						do:
							[:v | 
							newNeighbours
								addAll:
									(v neighbourhood
										select:
											[:u | 
											valuesB3 := Array new: 5.
											valuesB3 at: 1 put: u.
											valuesB3 at: 2 put: setOfContiguousComponents.
											valuesB3 at: 3 put: seed.
											valuesB3
												at: 4
												put: arguments first.
											valuesB3
												at: 5
												put: arguments last.
											blocks last valueWithArguments: valuesB3])].
					neighbours := newNeighbours].
			collec add: setOfContiguousComponents.
			setOfContiguousComponents do: [:c | baseEntities remove: c]].
	^collec