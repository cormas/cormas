Extension { #name : 'CMBoxSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMBoxSeries class >> plotsOf: someSeriesData on: aChart [
	"A box for each value on x of each series data that has values, spanning the values on y at that x, side by side when there are several"

	| drawn |
	drawn := someSeriesData select: [ :each | each values isNotEmpty ].
	^ drawn withIndexCollect: [ :each :index |
			  | spreads xs |
			  spreads := Dictionary new.
			  each values do: [ :point |
					  (spreads at: point x ifAbsentPut: [ OrderedCollection new ])
						  add: point y ].
			  xs := spreads keys sorted asArray.
			  each -> (CMBoxesPlot new
				   x: xs spreads: (xs collect: [ :x | (spreads at: x) asArray ]);
				   place: index of: drawn size;
				   color: each color;
				   yourself) ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMBoxSeries class >> xMargin [
	"Half a tick on each side, so that the first and last boxes fit"

	^ 1 / 2
]
