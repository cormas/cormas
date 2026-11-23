Extension { #name : 'CMAreaSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMAreaSeries >> addCountsIn: someDataTables to: someSeries [
	"Add to someSeries one series for each value of my probe, counting at each step the instances that have it"

	| counts steps |
	counts := Dictionary new.
	steps := Set new.
	someDataTables do: [ :data |
			| column |
			column := data column: probe.
			(column notEmpty and: [ column first isNumber ]) ifTrue: [
					self error:
						('#{1} returned numbers for {2}, and strings or booleans for other instances'
							 format: {
									 probe.
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
			someSeries add: (CMSeriesData
					 named: label , ': ' , value asString
					 color: (self roassalColorAt: someSeries size + 1)
					 steps: steps
					 values:
					 (steps collect: [ :step |
						  (counts at: value) at: step ifAbsent: [ 0 ] ])) ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMAreaSeries >> addSeriesDataOfAll: someDataTables to: someSeries [
	"An area for each instance when my probe returns numbers, or else for each of its values, counting the instances that have it"

	| columns |
	columns := (someDataTables collect: [ :each | each column: probe ])
		           reject: [ :each | each isEmpty ].
	(columns isEmpty or: [ columns first first isNumber ])
		ifTrue: [
		self addSeriesDataOfEachInstanceIn: someDataTables to: someSeries ]
		ifFalse: [ self addCountsIn: someDataTables to: someSeries ]
]
