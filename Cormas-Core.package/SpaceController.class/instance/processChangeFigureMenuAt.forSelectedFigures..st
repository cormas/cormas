manipulate
processChangeFigureMenuAt: aPoint forSelectedFigures: sfigures
	
	| valueResult figures aMenuBuilder color |
	figures := sfigures
		select:
			[:f | 
			((f isKindOf: TrackFigure)
				or:
					[(f isKindOf: TentativePositionHandle)
						or: [(f isKindOf: IndexedTrackHandle) or: [f isKindOf: TrackHandle]]])
				not].
	figures isEmpty ifTrue: [^nil].	"menu for changing color and line of the figure itself"
	aMenuBuilder := MenuBuilder new.
	aMenuBuilder add: 'fill color' -> #fillColor:.	"Refactory.HotDraw.Figure new"
	figures first addLineWidthMenuTo: aMenuBuilder.
	aMenuBuilder add: 'line color' -> #lineColor:.
	valueResult := self
		trackMenu: aMenuBuilder menu
		at: aPoint
		centered: true.
	valueResult isNil ifTrue: [^self].
	(valueResult isKindOf: MenuItem)
		ifTrue: [valueResult := valueResult value].
	valueResult isSymbol
		ifTrue:
			[(valueResult = #fillColor: or: [valueResult = #lineColor:])
				ifTrue:
					[color := PovSetter colorChooser.
					color ifNil: [^nil].
					figures do: [:aFigure | aFigure perform: valueResult with: color]]
				ifFalse: [figures do: [:aFigure | aFigure perform: valueResult]]]
		ifFalse:
			["in such case the the valueresult is a block containing instruction for executing linewidth to a certain size. we here below extract this value and ask directly the figures to perform it"
			figures
				do: [:aFigure | aFigure lineWidth: valueResult copiedValues last]]