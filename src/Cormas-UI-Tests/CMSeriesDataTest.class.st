Class {
	#name : 'CMSeriesDataTest',
	#superclass : 'TestCase',
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'tests' }
CMSeriesDataTest >> testASeriesUpToAStepKeepsOnlyTheValuesUntilThatStep [

	| series |
	series := (CMSeriesData
		           named: 'boars'
		           color: Color brown
		           steps: #( 0 2 4 )
		           values: #( 40 38 41 )) upToStep: 3.
	self assert: series steps asArray equals: #( 0 2 ).
	self assert: series values asArray equals: #( 40 38 ).
	self assert: series name equals: 'boars'
]
