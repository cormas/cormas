"
I test `CMColumnSummary`, the summary statistics of a column of recorded numbers.
"
Class {
	#name : 'CMColumnSummaryTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'tests' }
CMColumnSummaryTest >> testCountMinimumMaximumAndMean [

	| summary |
	summary := CMColumnSummary of: #( 4 1 10 3 2 ).
	self assert: summary count equals: 5.
	self assert: summary minimum equals: 1.
	self assert: summary maximum equals: 10.
	self assert: summary mean equals: 4
]

{ #category : 'tests' }
CMColumnSummaryTest >> testFloatsAreSummarized [

	| summary |
	summary := CMColumnSummary of: #( 0.5 1.5 ).
	self assert: summary mean equals: 1.0.
	self assert: summary median equals: 1.0
]

{ #category : 'tests' }
CMColumnSummaryTest >> testQuartilesAreInterpolatedBetweenValues [

	| summary |
	summary := CMColumnSummary of: #( 4 2 1 3 ).
	self assert: summary firstQuartile equals: 1.75.
	self assert: summary median equals: 2.5.
	self assert: summary thirdQuartile equals: 3.25
]

{ #category : 'tests' }
CMColumnSummaryTest >> testQuartilesFallOnValues [

	| summary |
	summary := CMColumnSummary of: #( 4 1 10 3 2 ).
	self assert: summary firstQuartile equals: 2.
	self assert: summary median equals: 3.
	self assert: summary thirdQuartile equals: 4
]

{ #category : 'tests' }
CMColumnSummaryTest >> testStandardDeviationIsThatOfASample [

	self
		assert: (CMColumnSummary of: #( 4 1 10 3 2 )) standardDeviation
		closeTo: 12.5 sqrt
]

{ #category : 'tests' }
CMColumnSummaryTest >> testStandardDeviationOfOneValueIsZero [

	self assert: (CMColumnSummary of: #( 7 )) standardDeviation equals: 0
]
