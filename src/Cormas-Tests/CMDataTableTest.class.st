Class {
	#name : 'CMDataTableTest',
	#superclass : 'TestCase',
	#instVars : [
		'table'
	],
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'running' }
CMDataTableTest >> setUp [

	super setUp.
	table := CMDataTable withColumns: #( #bag #boars )
]

{ #category : 'tests' }
CMDataTableTest >> testAColumnKeepsBooleans [

	table addStep: 0 values: #( true 40 ).
	table addStep: 1 values: #( false 38 ).
	self assert: (table column: #bag) asArray equals: #( true false )
]

{ #category : 'tests' }
CMDataTableTest >> testAColumnKeepsIntegersAndFloats [

	table addStep: 0 values: #( 3 40 ).
	table addStep: 1 values: #( 2.5 38 ).
	self assert: (table column: #bag) asArray equals: #( 3 2.5 )
]

{ #category : 'tests' }
CMDataTableTest >> testAColumnKeepsStrings [

	table addStep: 0 values: #( 'forest' 40 ).
	table addStep: 1 values: #( #urban 38 ).
	self
		assert: (table column: #bag) asArray
		equals: #( 'forest' #urban )
]

{ #category : 'tests' }
CMDataTableTest >> testAColumnThatWasNotRecordedRaisesARecordingError [

	self should: [ table column: #energy ] raise: CMRecordingError
]

{ #category : 'tests' }
CMDataTableTest >> testAFractionIsWrittenAsCsvAsAFloat [

	table addStep: 0 values: {
			(1 / 4).
			3 }.
	self
		assert:
			(String streamContents: [ :stream | table writeCsvOn: stream ])
				lines second
		equals: '0,0.25,3'
]

{ #category : 'tests' }
CMDataTableTest >> testARejectedRowLeavesTheTableUnchanged [

	table addStep: 0 values: #( 3 40 ).
	[ table addStep: 1 values: { 4. nil } ]
		on: CMRecordingError
		do: [ :error | error return ].
	self assert: table size equals: 1.
	self assert: (table column: #bag) asArray equals: #( 3 )
]

{ #category : 'tests' }
CMDataTableTest >> testAStepThatIsNotAfterTheLastOneRaisesARecordingError [

	table addStep: 5 values: #( 3 40 ).
	self
		should: [ table addStep: 5 values: #( 4 38 ) ]
		raise: CMRecordingError
]

{ #category : 'tests' }
CMDataTableTest >> testAStringIsWrittenAsCsvBetweenQuotes [
	table addStep: 0 values: #( 'big "bag", full' 4 ).
	self
		assert: (String streamContents: [ :stream | table writeCsvOn: stream ]) lines second
		equals: '0,"big ""bag"", full",4'
]

{ #category : 'tests' }
CMDataTableTest >> testATableIsWrittenAsCsvWithItsStepsThenItsColumns [
	table addStep: 0 values: #( 1.5 true ).
	table addStep: 2 values: #( 3 false ).
	self
		assert: (String streamContents: [ :stream | table writeCsvOn: stream ]) lines asArray
		equals: #( 'step,bag,boars' '0,1.5,true' '2,3,false' )
]

{ #category : 'tests' }
CMDataTableTest >> testATableWithoutRowsHasNoSummaries [

	self assert: table summaries isEmpty
]

{ #category : 'tests' }
CMDataTableTest >> testAValueOfAnotherKindThanItsColumnRaisesARecordingError [

	table addStep: 0 values: #( 3 40 ).
	self
		should: [ table addStep: 1 values: #( 'forest' 38 ) ]
		raise: CMRecordingError
]

{ #category : 'tests' }
CMDataTableTest >> testAValueThatIsNotANumberABooleanOrAStringRaisesARecordingError [

	self
		should: [
				table addStep: 0 values: {
						(3 @ 4).
						40 } ]
		raise: CMRecordingError
]

{ #category : 'tests' }
CMDataTableTest >> testColumnsKeepTheirOrder [

	self assert: table columnNames asArray equals: #( #bag #boars )
]

{ #category : 'tests' }
CMDataTableTest >> testEachRowHasItsStepThenItsValues [

	table addStep: 0 values: #( 3 40 ).
	table addStep: 1 values: #( 5 38 ).
	self assert: table rows asArray equals: #( #( 0 3 40 ) #( 1 5 38 ) )
]

{ #category : 'tests' }
CMDataTableTest >> testEachRowKeepsItsStep [

	table addStep: 4 values: #( 3 40 ).
	table addStep: 7 values: #( 5 38 ).
	self assert: table steps asArray equals: #( 4 7 )
]

{ #category : 'tests' }
CMDataTableTest >> testManyRowsAreKept [

	1 to: 1000 do: [ :step |
			table addStep: step values: {
					step.
					(step * 2) } ].
	self assert: table size equals: 1000.
	self assert: (table column: #boars) last equals: 2000.
	self assert: table steps first equals: 1
]

{ #category : 'tests' }
CMDataTableTest >> testNewTableHasNoRows [

	self assert: table size equals: 0.
	self assert: table steps isEmpty.
	self assert: (table column: #bag) isEmpty
]

{ #category : 'tests' }
CMDataTableTest >> testNilRaisesARecordingError [

	self
		should: [ table addStep: 0 values: { nil. 40 } ]
		raise: CMRecordingError
]

{ #category : 'tests' }
CMDataTableTest >> testOnlyColumnsOfNumbersAreSummarized [

	| summaries |
	table := CMDataTable withColumns: #( #bag #name #hunted #boars ).
	table addStep: 0 values: #( 1 'a' true 5 ).
	table addStep: 1 values: #( 3 'b' false 7 ).
	summaries := table summaries.
	self assert: summaries keys asArray equals: #( #bag #boars ).
	self assert: (summaries at: #bag) mean equals: 2.
	self assert: (summaries at: #boars) maximum equals: 7
]

{ #category : 'tests' }
CMDataTableTest >> testRowsAreReadByColumn [

	table addStep: 0 values: #( 3 40 ).
	table addStep: 1 values: #( 5 38 ).
	self assert: table size equals: 2.
	self assert: (table column: #bag) asArray equals: #( 3 5 ).
	self assert: (table column: #boars) asArray equals: #( 40 38 )
]
