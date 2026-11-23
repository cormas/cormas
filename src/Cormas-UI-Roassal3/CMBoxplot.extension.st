Extension { #name : 'CMBoxplot' }

{ #category : '*Cormas-UI-Roassal3' }
CMBoxplot >> plotsOf: someSeries [
	"A box at each step for each series that has values, side by side when there are several"

	| drawn |
	drawn := someSeries select: [ :each | each steps isNotEmpty ].
	^ drawn withIndexCollect: [ :each :index |
			  each -> (CMBoxesPlot new
				   steps: each steps spreads: each values;
				   place: index of: drawn size;
				   color: each color;
				   yourself) ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMBoxplot >> xMargin [
	"Half a step on each side, so that the boxes of the first and last steps fit"

	^ 1 / 2
]
