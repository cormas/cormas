Class {
	#name : 'CMSeriesDataTest',
	#superclass : 'TestCase',
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'tests' }
CMSeriesDataTest >> testASeriesAtAStepKeepsOnlyTheValuesOfThatStep [

	| series |
	series := (CMSeriesData
		           of:
		           (CMPointSeries new x: #age y: #energy ofAll: CMMockAnimal)
		           named: 'energy'
		           color: Color brown
		           steps: #( 0 0 1 1 1 )
		           values: #( 1 2 3 4 5 )) atStep: 1.
	self assert: series steps asArray equals: #( 1 1 1 ).
	self assert: series values asArray equals: #( 3 4 5 )
]

{ #category : 'tests' }
CMSeriesDataTest >> testASeriesUpToAStepKeepsOnlyTheValuesUntilThatStep [

	| series |
	series := (CMSeriesData
		           of: (CMLineSeries new x: #currentTimeStep y: #boars)
		           named: 'boars'
		           color: Color brown
		           steps: #( 0 2 4 )
		           values: #( 40 38 41 )) upToStep: 3.
	self assert: series steps asArray equals: #( 0 2 ).
	self assert: series values asArray equals: #( 40 38 ).
	self assert: series name equals: 'boars'
]
