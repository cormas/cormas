Extension { #name : 'CMBoxplot' }

{ #category : '*Cormas-UI-Roassal3' }
CMBoxplot >> addSeriesOf: aSelector ofAll: aClass in: someDataTables to: someSeries [

	self
		addSpreadOf: aSelector
		ofAll: aClass
		in: someDataTables
		to: someSeries
]

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
