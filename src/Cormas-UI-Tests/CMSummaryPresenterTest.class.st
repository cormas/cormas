"
I test `CMSummaryPresenter`, the table of summary statistics shown above recorded data.
"
Class {
	#name : 'CMSummaryPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'presenter'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'running' }
CMSummaryPresenterTest >> setUp [

	| table |
	super setUp.
	table := CMDataTable withColumns: #( #bag #name #boars ).
	table addStep: 0 values: #( 1 'a' 5 ).
	table addStep: 1 values: #( 2 'b' 0.25 ).
	presenter := CMSummaryPresenter new.
	presenter showSummariesOf: table
]

{ #category : 'tests' }
CMSummaryPresenterTest >> testATableWithoutRowsShowsNoStatistics [

	presenter showSummariesOf: (CMDataTable withColumns: #( #bag )).
	self
		assert:
		(presenter table columns collect: [ :each | each title ]) asArray
		equals: #( 'statistic' )
]

{ #category : 'tests' }
CMSummaryPresenterTest >> testOtherNumbersAreShownWithThreeDecimals [

	self assert: (self textOf: 'mean' in: 'bag') equals: '1.500'.
	self assert: (self textOf: 'min' in: 'boars') equals: '0.250'
]

{ #category : 'tests' }
CMSummaryPresenterTest >> testThereIsAColumnForEachColumnOfNumbers [

	self
		assert:
		(presenter table columns collect: [ :each | each title ]) asArray
		equals: #( 'statistic' 'bag' 'boars' )
]

{ #category : 'tests' }
CMSummaryPresenterTest >> testThereIsARowForEachStatistic [

	self
		assert: (presenter table items collect: [ :each |
				 presenter table columns first readObject: each ]) asArray
		equals:
		#( 'count' 'mean' 'std dev' 'min' '25%' 'median' '75%' 'max' )
]

{ #category : 'tests' }
CMSummaryPresenterTest >> testWholeNumbersAreShownAsTheyAre [

	self assert: (self textOf: 'count' in: 'bag') equals: '2'.
	self assert: (self textOf: 'max' in: 'bag') equals: '2'
]

{ #category : 'private' }
CMSummaryPresenterTest >> textOf: aStatistic in: aColumnTitle [

	| row |
	row := presenter table items detect: [ :each |
		       (presenter table columns first readObject: each) = aStatistic ].
	^ (presenter table columns detect: [ :each |
		   each title = aColumnTitle ]) readObject: row
]
