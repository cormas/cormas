Extension { #name : 'CMStackedSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMStackedSeries >> addCountsIn: someDataTables to: someSeriesData [
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
CMStackedSeries >> addSeriesDataOfTables: someDataTables to: someSeriesData [
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
CMStackedSeries class >> plotX: someValues from: someBottoms to: someTops [
	"Return the Roassal plot that draws, at each of someValues on x, my mark from the bottom to the top at the same index"

	^ self subclassResponsibility
]

{ #category : '*Cormas-UI-Roassal3' }
CMStackedSeries class >> plotsOf: someSeriesData on: aChart [
	"A stack for each series data that has values. At each value on x, its height is the sum of its values on y there, 0 where it has none, for example when its object was not alive. A positive sum is stacked on the positive sums of the series data before it, a negative sum below their negative sums"

	| drawn xs positiveTops negativeBottoms |
	drawn := someSeriesData select: [ :each | each values isNotEmpty ].
	xs := (drawn flatCollect: [ :each |
		       each values collect: [ :point | point x ] ]) asSet sorted
		      asArray.
	positiveTops := xs collect: [ :each | 0 ].
	negativeBottoms := xs collect: [ :each | 0 ].
	^ drawn collect: [ :each |
			  | sums bottoms tops |
			  sums := Dictionary new.
			  each values do: [ :point |
				  sums
					  at: point x
					  put: (sums at: point x ifAbsent: [ 0 ]) + point y ].
			  bottoms := Array new: xs size.
			  tops := Array new: xs size.
			  xs doWithIndex: [ :x :index |
					  | sum |
					  sum := sums at: x ifAbsent: [ 0 ].
					  sum >= 0
						  ifTrue: [
								  bottoms at: index put: (positiveTops at: index).
								  positiveTops at: index put: (positiveTops at: index) + sum.
								  tops at: index put: (positiveTops at: index) ]
						  ifFalse: [
								  tops at: index put: (negativeBottoms at: index).
								  negativeBottoms
									  at: index
									  put: (negativeBottoms at: index) + sum.
								  bottoms at: index put: (negativeBottoms at: index) ] ].
			  each -> ((self plotX: xs from: bottoms to: tops)
				   color: each color;
				   yourself) ]
]
