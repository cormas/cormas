Class {
	#name : 'CMLineChartRoassalTest',
	#superclass : 'TestCase',
	#instVars : [
		'chart',
		'simulation',
		'model'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'private' }
CMLineChartRoassalTest >> canvasHiding: aSet [

	^ chart canvasOf: self lines hiding: aSet
]

{ #category : 'private' }
CMLineChartRoassalTest >> legendEntryNamed: aString in: aCanvas [

	^ aCanvas allChildren detect: [ :each |
			  (each isKindOf: RSComposite) and: [
					  each children anySatisfy: [ :child |
						  (child isKindOf: RSLabel) and: [ child text = aString ] ] ] ]
]

{ #category : 'private' }
CMLineChartRoassalTest >> lines [

	^ chart seriesDataOf: model in: simulation
]

{ #category : 'private' }
CMLineChartRoassalTest >> plotShapesNamed: aString in: aCanvas [
	"The lines drawn for a chart line: the polylines of its color, or transparent ones when it is hidden"

	| color |
	color := (self lines detect: [ :each | each name = aString ]) color.
	^ aCanvas allChildren select: [ :each |
			  (each isKindOf: RSPolyline) and: [
				  each color = color or: [ each color = Color transparent ] ] ]
]

{ #category : 'private' }
CMLineChartRoassalTest >> seriesNamed: someNumbers [

	^ someNumbers collect: [ :each |
			  CMSeriesData new
				  setName: 'Rabbit ' , each printString
				  color: Color red
				  steps: #( 0 1 2 )
				  values: #( 1 2 3 ) ]
]

{ #category : 'running' }
CMLineChartRoassalTest >> setUp [

	super setUp.
	simulation := (CMSimulation for: CMMockModel new)
		              randomSeed: 41;
		              activeInitSelector: #initFixed;
		              activeControlSelector: #step;
		              initializeSimulation;
		              yourself.
	3 timesRepeat: [ simulation runStep ].
	model := simulation cormasModel.
	chart := CMLineChart new
		         line: #numberOfAliveCells;
		         line: #numberOfDeadCells;
		         yourself
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testAChosenColorIsUsed [

	chart := CMLineChart new
		         line: #numberOfAliveCells;
		         add: (CMLineSeries new probe: #numberOfDeadCells;
				          color: Color brown;
				          yourself);
		         yourself.
	self assert: self lines second color equals: Color brown
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testAChosenColorIsUsedForTheLinesOfAllInstances [

	chart := CMLineChart new
		         add: (CMLineSeries new probe: #energy ofAll: CMMockAnimal;
				          color: Color gray;
				          yourself);
		         yourself.
	self assert: self lines size > 1.
	self assert:
		(self lines allSatisfy: [ :each | each color = Color gray ])
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testAHiddenLegendIsNotDrawn [

	chart hideLegend.
	self deny: ((self textsOf: (self canvasHiding: Set new)) includes:
			 'numberOfDeadCells')
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testAHiddenLineIsDrawnTransparent [

	| canvas |
	canvas := self canvasHiding: (Set with: 'numberOfDeadCells').
	self assert:
		((self plotShapesNamed: 'numberOfDeadCells' in: canvas) allSatisfy: [
			 :each | each color = Color transparent ])
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testALegendTooBigForThreeLinesIsReplacedByANote [

	| texts |
	texts := self textsOf:
		         (chart
			          canvasOf: (self seriesNamed: (1 to: 100))
			          hiding: Set new).
	self deny: (texts includes: 'Rabbit 1').
	self assert: (texts includes: '(legend is too big to be displayed)')
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testALegendWiderThanTheChartWrapsOnSeveralLines [

	| canvas entries |
	canvas := chart
		          canvasOf: (self seriesNamed: (1 to: 20))
		          hiding: Set new.
	entries := (1 to: 20) collect: [ :each |
		           self
			           legendEntryNamed: 'Rabbit ' , each printString
			           in: canvas ].
	self assert:
		(entries collect: [ :each | each position y ] as: Set) size > 1.
	self assert: (entries allSatisfy: [ :each |
			 each encompassingRectangle right <= 800 ])
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testALineOfAMethodThatIsNotAProbeRaisesAnError [

	chart := CMLineChart new
		         line: #numberOfCows;
		         yourself.
	self should: [ self lines ] raise: Error withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: '#numberOfCows').
			self assert: (error messageText includesSubstring: 'CMMockModel') ]
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testALineOfAnInstanceIsNamedAfterItsInstance [
	| cow |
	chart := CMLineChart new
		         add: (CMLineSeries new probe: #energy ofAll: CMMockAnimal;
				          label: 'Energy';
				          yourself);
		         yourself.
	cow := (model entitiesOfClass: CMMockCow) first.
	self assert: self lines first name equals: (simulation dataOf: cow) label
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testALineOfValuesThatAreNotNumbersRaisesAnError [

	chart := CMLineChart new
		         lines: #state ofAll: CMMockCell;
		         yourself.
	self should: [ self lines ] raise: Error withExceptionDo: [ :error |
		self assert: (error messageText includesSubstring: 'state') ]
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testAProbeThatWasNotRecordedCannotBeDrawn [

	simulation
		doNotRecord: #numberOfDeadCells of: CMMockModel;
		initializeSimulation.
	self
		should: [ self lines ]
		raise: CMRecordingError
		withExceptionDo: [ :error |
				self assert:
					(error messageText includesSubstring: 'numberOfDeadCells') ]
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testAxesOfNonNegativeValuesStartAtZero [

	| canvas |
	canvas := chart
		          canvasOf: { (CMSeriesData new
				           setName: 'a'
				           color: Color red
				           steps: #( 12 13 14 )
				           values: #( 30 40 50 )) }
		          hiding: Set new.
	self
		assert: ((self textsOf: canvas) count: [ :each | each = '0' ])
		equals: 2
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testClickingAHiddenLineInTheLegendShowsItAgain [

	| hidden canvas |
	hidden := Set with: 'numberOfDeadCells'.
	canvas := self canvasHiding: hidden.
	(self legendEntryNamed: 'numberOfDeadCells' in: canvas) announce:
		RSMouseClick new.
	self assert: hidden isEmpty.
	self assert:
		((self plotShapesNamed: 'numberOfDeadCells' in: canvas) anySatisfy: [
			 :each | each color = self lines second color ])
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testClickingALegendEntryHidesItsLine [

	| hidden canvas |
	hidden := Set new.
	canvas := self canvasHiding: hidden.
	(self legendEntryNamed: 'numberOfDeadCells' in: canvas) announce:
		RSMouseClick new.
	self assert: (hidden includes: 'numberOfDeadCells').
	self assert:
		((self plotShapesNamed: 'numberOfDeadCells' in: canvas) allSatisfy: [
			 :each | each color = Color transparent ])
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testEachLineFollowsItsProbeOverTheRecordedSteps [

	self assert: self lines first steps asArray equals: #( 0 1 2 3 ).
	self assert: self lines first values asArray equals: #( 11 5 11 5 ).
	self assert: self lines second values asArray equals: #( 5 11 5 11 )
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testLinesWithoutAChosenColorGetDifferentColors [

	self deny: self lines first color equals: self lines second color
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testTheCanvasCannotBeZoomedNorDragged [

	| canvas |
	canvas := self canvasHiding: Set new.
	self deny: ({
			 RSMouseWheelEvent new.
			 RSMouseDragStart new.
			 RSMouseDragging new } anySatisfy: [ :event |
				 canvas announcer subscriptions subscriptions anySatisfy: [ :each |
					 each handlesAnnouncement: event ] ])
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testTheCanvasShowsTheTitles [

	| texts |
	chart
		title: 'Cells';
		yTitle: 'Number of cells'.
	texts := self textsOf: (self canvasHiding: Set new).
	self assert: (texts includes: 'Cells').
	self assert: (texts includes: 'Number of cells')
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testTheChartHasAxisLinesButNoFrame [

	self deny:
		((self canvasHiding: Set new) allChildren anySatisfy: [ :each |
				 (each isKindOf: RSBox) and: [
					 each color isNil or: [ each color = Color transparent ] ] ])
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testTheLegendShowsTheLabelOfEachLine [

	| texts |
	chart := CMLineChart new
		         line: #numberOfAliveCells;
		         add: (CMLineSeries new probe: #numberOfDeadCells;
				          label: 'Dead cells';
				          yourself);
		         yourself.
	texts := self textsOf: (self canvasHiding: Set new).
	self assert: (texts includes: 'numberOfAliveCells').
	self assert: (texts includes: 'Dead cells')
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testTheLinesEndWhereTheXAxisEnds [
	| canvas line |
	canvas := chart
		          canvasOf: { (CMSeriesData new
				           setName: 'a'
				           color: Color red
				           steps: #( 12 13 14 )
				           values: #( 30 40 50 )) }
		          hiding: Set new.
	line := canvas allChildren detect: [ :each | each isKindOf: RSPolyline ].
	self
		assert: line encompassingRectangle right
		closeTo: (canvas allChildren detect: [ :each | each isKindOf: RSComposite ]) encompassingRectangle right
		precision: 10
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testTheLinesKeepTheOrderInWhichTheyWereAdded [

	self
		assert: (self lines collect: [ :each | each name ] as: Array)
		equals: #( 'numberOfAliveCells' 'numberOfDeadCells' )
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testTheLinesOfAllInstancesOfAClassAreALineForEachInstance [

	| cow |
	chart := CMLineChart new
		         lines: #energy ofAll: CMMockAnimal;
		         yourself.
	cow := (model entitiesOfClass: CMMockCow) first.
	self assert: self lines size equals: 2.
	self
		assert: self lines first values asArray
		equals: ((simulation dataOf: cow) column: #energy) asArray
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testTheLinesOfAllInstancesOfAClassThatIsNotRecordedCannotBeDrawn [

	simulation
		doNotRecord: CMMockAnimal;
		initializeSimulation.
	chart := CMLineChart new
		         lines: #energy ofAll: CMMockAnimal;
		         yourself.
	self should: [ self lines ] raise: CMRecordingError
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testTheLinesOfAllInstancesOfAMethodThatIsNotAProbeRaiseAnError [

	chart := CMLineChart new
		         lines: #id ofAll: CMMockCow;
		         yourself.
	self should: [ self lines ] raise: Error withExceptionDo: [ :error |
		self assert: (error messageText includesSubstring: 'CMMockCow') ]
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testTheXAxisEndsAtTheLastStep [
	| canvas |
	canvas := chart
		          canvasOf: { (CMSeriesData new
				           setName: 'a'
				           color: Color red
				           steps: #( 12 13 14 )
				           values: #( 30 40 50 )) }
		          hiding: Set new.
	self assert: ((self textsOf: canvas) includes: '10').
	self deny: ((self textsOf: canvas) includes: '15')
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testTheXAxisOfAGrowingChartLeavesRoomUpToTheNextTick [
	| canvas |
	canvas := chart
		          canvasOf: { (CMSeriesData new
				           setName: 'a'
				           color: Color red
				           steps: #( 12 13 14 )
				           values: #( 30 40 50 )) }
		          hiding: Set new
		          leavingRoomToGrow: true.
	self assert: ((self textsOf: canvas) includes: '15')
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testTicksOfDecimalsAreLabelledWithTheDecimalsTheyNeed [
	"The energy of the animals stays at 0.5, so the y axis goes from 0 to 0.5, 0.1 apart"

	| texts |
	chart := CMLineChart new
		         lines: #energy ofAll: CMMockAnimal;
		         yourself.
	texts := self textsOf: (self canvasHiding: Set new).
	self assert: (texts includes: '0.1').
	self assert: (texts includes: '0.5')
]

{ #category : 'tests' }
CMLineChartRoassalTest >> testTicksOfWholeNumbersAreLabelledWithoutDecimals [

	self deny:
		((self textsOf: (self canvasHiding: Set new)) anySatisfy: [ :each |
			 each includesSubstring: '.' ])
]

{ #category : 'private' }
CMLineChartRoassalTest >> textsOf: aCanvas [

	^ (aCanvas allChildren select: [ :each | each isKindOf: RSLabel ])
		  collect: [ :each | each text ]
]
