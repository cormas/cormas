CSE (regular) - dynamics
swell: compoundEntityClass verifying: aConditionBlock
	"Each instance of compoundEntityClass swells on its surround layer. According to aConditionBlock on the surrounded cells, it swells if its size equals to its given size and if there is enough space arround it. 
	Returns a boolean indicating if at least one aggregate has spread.
	compoundEntityClass = aClass, subclass of SpatialEntitySet"
	
	| newCells haveSpread |
	haveSpread := false.
	(self spatialEntities at: compoundEntityClass name)
		do:
			[:aggregate | 
			newCells := aggregate surround
				select:
					[:c | (c isComponentOf: compoundEntityClass) not and: [aConditionBlock value: c]].
			newCells isEmpty
				ifFalse:
					[(Cormas mixt: newCells)
						do:
							[:nc | 
							aggregate size < aggregate givenSize
								ifTrue:
									[haveSpread := true.
									aggregate addSilentlyComponent: nc]].
					aggregate setSurround]].
	(self spatialEntities at: compoundEntityClass name) do: [:c | c show].
	^haveSpread