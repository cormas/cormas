manipulate
processManipulateMenuAt: globalPoint local: localPoint forSelectedFigures: sFigs localFigures: lFigs
	
	| valueResult entities chossenMethod chossenEntityClass |
	sFigs isEmpty
		ifTrue:
			[entities := (lFigs
				select:
					[:f | 
					((f isKindOf: TrackFigure)
						or:
							[(f isKindOf: TentativePositionHandle)
								or:
									[(f isKindOf: IndexedTrackHandle) or: [f isKindOf: TrackHandle]]])
						not]) collect: [:f | f model entity].
			model entityForManipulation ~= #any
				ifTrue:
					[entities := entities
						select: [:e | e class name = model entityForManipulation]]]
		ifFalse: [entities := sFigs collect: [:f | f model entity]].
	entities isEmpty ifTrue: [^self].
	(entities asSet collect: [:e | e class]) size > 1
		ifTrue:
			[valueResult := self
				trackMenu:
					(self manipulationMenuForMultipleTypeEntities: entities copy)
				at: globalPoint
				centered: true]
		ifFalse:
			[valueResult := self
				trackMenu: (self manipulationMenuForSingleTypeEntities: entities copy)
				at: globalPoint
				centered: true].
	(valueResult isNil or: [valueResult value isNil]) ifTrue: [^self].
	chossenMethod := valueResult value value.
	chossenEntityClass := valueResult value key.
	entities copy
		do:
			[:aEntity | 
			chossenEntityClass = aEntity class
				ifTrue:
					[(chossenMethod includes: $:)
						ifFalse: [aEntity perform: chossenMethod]
						ifTrue:
							[aEntity
								perform: chossenMethod
								withArguments:
									((Cormas askUserArgumentsForMethod: chossenMethod) ifNil: [^nil])]]]