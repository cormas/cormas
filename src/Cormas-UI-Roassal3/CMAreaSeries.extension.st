Extension { #name : 'CMAreaSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMAreaSeries >> addCountsIn: someDataTables to: someSeriesData [
	"Add to someSeriesData one series data for each value of my probe on y, with a row worth 1 for each instance having that value at a step, so that the stacked areas count them"

	| rowsOfValue |
	rowsOfValue := Dictionary new.
	someDataTables do: [ :data |
			| column steps xValues |
			column := self valuesOf: y in: data.
			(column isNotEmpty and: [ column first isNumber ]) ifTrue: [
					self error:
						('#{1} returned numbers for {2}, and strings or booleans for other instances'
							 format: {
									 y.
									 data label }) ].
			steps := data steps asArray.
			xValues := self valuesOf: x in: data.
			column doWithIndex: [ :value :index |
					(rowsOfValue at: value ifAbsentPut: [ OrderedCollection new ])
						add: (steps at: index) -> (Point x: (xValues at: index) y: 1) ] ].
	(self chosenCategories select: [ :each |
		 rowsOfValue includesKey: each ])
	, ((rowsOfValue keys reject: [ :each |
			  self chosenCategories includes: each ]) sorted: [ :a :b |
			 a asString <= b asString ]) do: [ :value |
			| rows |
			rows := (rowsOfValue at: value) asArray sort: [ :a :b |
				        a key <= b key ].
			someSeriesData add: (CMSeriesData
					 of: self
					 named: (self labelOfCategory: value)
					 color: (categoryColors
							  at: value
							  ifAbsent: [ self roassalColorAt: someSeriesData size + 1 ])
					 steps: (rows collect: [ :each | each key ])
					 values: (rows collect: [ :each | each value ])) ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMAreaSeries >> addSeriesDataOfTables: someDataTables to: someSeriesData [
	"When I show all the instances of a class, an area for each instance when my probe on y returns numbers, or else for each of its values, counting the instances that have it"

	| columns |
	showsAllInstances ifFalse: [
		^ super addSeriesDataOfTables: someDataTables to: someSeriesData ].
	columns := (someDataTables collect: [ :each |
		            self valuesOf: y in: each ]) reject: [ :each |
		           each isEmpty ].
	(columns isEmpty or: [ columns first first isNumber ])
		ifTrue: [
		self addSeriesDataOfEachTable: someDataTables to: someSeriesData ]
		ifFalse: [ self addCountsIn: someDataTables to: someSeriesData ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMAreaSeries class >> plotsOf: someSeriesData on: aChart [
	"An area for each series data that has values, stacked on the areas before it. Its height at each value on x is the sum of its values on y there, 0 where it has none, for example when its object was not alive"

	| drawn xs tops |
	drawn := someSeriesData select: [ :each | each values isNotEmpty ].
	xs := (drawn flatCollect: [ :each |
		       each values collect: [ :point | point x ] ]) asSet sorted
		      asArray.
	tops := xs collect: [ :each | 0 ].
	^ drawn collect: [ :each |
			  | bottoms sums |
			  bottoms := tops.
			  sums := Dictionary new.
			  each values do: [ :point |
				  sums
					  at: point x
					  put: (sums at: point x ifAbsent: [ 0 ]) + point y ].
			  tops := xs
				          with: bottoms
				          collect: [ :x :bottom |
				          bottom + (sums at: x ifAbsent: [ 0 ]) ].
			  each -> ((RSAreaPlot new x: xs y1: tops y2: bottoms)
				   color: each color;
				   yourself) ]
]
