menu processing
processMenuAt: globalPoint local: localPoint for: aFigure
	
	| valueResult |
	aFigure class = TrackFigure ifTrue: [^nil].
	valueResult := self
		trackMenu: (aFigure menuAt: localPoint)
		at: globalPoint
		centered: true.
	valueResult isNil ifTrue: [^self].
	valueResult := Cormas valueFrom: valueResult.
	valueResult isSymbol
		ifTrue:
			[(self localMenuItem: valueResult)
				ifTrue:
					[aFigure isDrawing ifFalse: [view selection: aFigure].
					view perform: valueResult]
				ifFalse:
					[(aFigure model notNil and: [aFigure model respondsTo: valueResult])
						ifTrue: [aFigure model perform: valueResult]
						ifFalse: [aFigure perform: valueResult]]]
		ifFalse: [valueResult value]