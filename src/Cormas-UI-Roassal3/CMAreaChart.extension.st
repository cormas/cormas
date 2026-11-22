Extension { #name : 'CMAreaChart' }

{ #category : '*Cormas-UI-Roassal3' }
CMAreaChart >> addCountsOf: aSelector in: someDataTables to: someSeries [
	"Add to someSeries one series for each value of the probe aSelector, counting at each step the instances that have it"

	| counts steps |
	counts := Dictionary new.
	steps := Set new.
	someDataTables do: [ :data |
			| column |
			column := data column: aSelector.
			(column notEmpty and: [ column first isNumber ]) ifTrue: [
					self error:
						('#{1} returned numbers for {2}, and strings or booleans for other instances'
							 format: {
									 aSelector.
									 data label }) ].
			column with: data steps do: [ :value :step |
					| countsOfValue |
					steps add: step.
					countsOfValue := counts at: value ifAbsentPut: [ Dictionary new ].
					countsOfValue
						at: step
						put: (countsOfValue at: step ifAbsent: [ 0 ]) + 1 ] ].
	steps := steps sorted asArray.
	(counts keys sorted: [ :a :b | a asString <= b asString ]) do: [
			:value |
			someSeries add: (CMChartSeries
					 named: (self labelFor: aSelector) , ': ' , value asString
					 color: (self roassalColorFor: aSelector at: someSeries size + 1)
					 steps: steps
					 values:
					 (steps collect: [ :step |
						  (counts at: value) at: step ifAbsent: [ 0 ] ])) ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMAreaChart >> addSeriesOf: aSelector ofAll: aClass in: someDataTables to: someSeries [
	"An area for each instance when the probe returns numbers, or else for each of its values, counting the instances that have it"

	| columns |
	columns := (someDataTables collect: [ :each | each column: aSelector ])
		           reject: [ :each | each isEmpty ].
	(columns isEmpty or: [ columns first first isNumber ])
		ifTrue: [
				self
					addSeriesOfEachInstance: aSelector
					in: someDataTables
					to: someSeries ]
		ifFalse: [
		self addCountsOf: aSelector in: someDataTables to: someSeries ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMAreaChart >> plotsOf: someSeries [
	"An area for each series that has values, stacked on the areas before it. A series has no value at a step when its object was not alive"

	| drawn steps tops |
	drawn := someSeries select: [ :each | each steps isNotEmpty ].
	steps := (drawn flatCollect: [ :each | each steps ]) asSet sorted
		         asArray.
	tops := steps collect: [ :each | 0 ].
	^ drawn collect: [ :each |
			  | bottoms valuesAtSteps |
			  bottoms := tops.
			  valuesAtSteps := Dictionary
				                   newFromKeys: each steps
				                   andValues: each values.
			  tops := steps
				          with: bottoms
				          collect: [ :step :bottom |
				          bottom + (valuesAtSteps at: step ifAbsent: [ 0 ]) ].
			  each -> ((RSAreaPlot new x: steps y1: tops y2: bottoms)
				   color: each color;
				   yourself) ]
]
