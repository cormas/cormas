Extension { #name : 'CMBoxSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMBoxSeries class >> plotsOf: someSeriesData on: aChart [
	"A box for each value on x of each series data that has values, spanning the values on y at that x. The boxes of several series data at the same x stand side by side, and a box alone at its x is centered on it"

	| drawn spreadsOfEach |
	drawn := someSeriesData select: [ :each | each values isNotEmpty ].
	spreadsOfEach := drawn collect: [ :each |
			                 | spreads |
			                 spreads := Dictionary new.
			                 each values do: [ :point |
					                 (spreads
						                  at: point x
						                  ifAbsentPut: [ OrderedCollection new ]) add:
						                 point y ].
			                 spreads ].
	^ drawn withIndexCollect: [ :each :index |
			  | spreads xs |
			  spreads := spreadsOfEach at: index.
			  xs := spreads keys sorted asArray.
			  each -> (CMBoxesPlot new
				   x: xs spreads: (xs collect: [ :x | (spreads at: x) asArray ]);
				   places: (xs collect: [ :x |
								    | sharing |
								    sharing := (1 to: drawn size) select: [ :other |
										               (spreadsOfEach at: other) includesKey: x ].
								    (sharing indexOf: index) -> sharing size ]);
				   color: each color;
				   yourself) ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMBoxSeries class >> xMargin [
	"Half a tick on each side, so that the first and last boxes fit"

	^ 1 / 2
]
