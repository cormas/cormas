manipulate
processManipulateMenuAt: globalPoint local: localPoint for: aFigure
	
	| valueResult |
	((aFigure isKindOf: TrackFigure)
		or:
			[(aFigure isKindOf: TentativePositionHandle)
				or:
					[(aFigure isKindOf: IndexedTrackHandle) or: [aFigure isKindOf: TrackHandle]]])
		ifTrue: [^nil].
	valueResult := self
		trackMenu: (aFigure manipulationMenuAt: localPoint)
		at: globalPoint
		centered: true.
	valueResult isNil ifTrue: [^self].
	(valueResult isKindOf: MenuItem)
		ifTrue: [valueResult := valueResult value].
	valueResult isSymbol
		ifTrue:
			[(self localMenuItem: valueResult)
				ifTrue:
					[aFigure isDrawing ifFalse: [view selection: aFigure].
					view perform: valueResult]
				ifFalse:
					[(aFigure model notNil and: [aFigure model entity respondsTo: valueResult])
						ifTrue:
							[(valueResult includes: $:)
								ifFalse: [aFigure model entity perform: valueResult]
								ifTrue:
									[| arg |
									arg := Cormas askUserArgumentsForMethod: valueResult value.
									arg ifNil: [^self].
									aFigure model entity
										perform: valueResult value
										withArguments: arg]]
						ifFalse: [aFigure perform: valueResult]]]
		ifFalse: [valueResult value]