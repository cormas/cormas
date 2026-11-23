Extension { #name : 'CMSpreadSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMSpreadSeries >> addSeriesDataOfAll: someDataTables to: someSeries [
	"Add to someSeries one series whose value at each step is the collection of the values of my probe of the instances recorded at that step"

	| spreads steps |
	spreads := Dictionary new.
	someDataTables do: [ :data |
			(self numbersInInstanceData: data)
				with: data steps
				do: [ :value :step |
					(spreads at: step ifAbsentPut: [ OrderedCollection new ]) add:
						value ] ].
	steps := spreads keys sorted asArray.
	someSeries add: (CMSeriesData
			 named: label
			 color: (self roassalColorAt: someSeries size + 1)
			 steps: steps
			 values: (steps collect: [ :each | (spreads at: each) asArray ]))
]
