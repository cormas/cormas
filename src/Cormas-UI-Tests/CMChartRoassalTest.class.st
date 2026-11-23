Class {
	#name : 'CMChartRoassalTest',
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
CMChartRoassalTest >> canvasHiding: aSet [

	^ chart canvasOf: self lines hiding: aSet
]

{ #category : 'private' }
CMChartRoassalTest >> legendEntryNamed: aString in: aCanvas [

	^ aCanvas allChildren detect: [ :each |
			  (each isKindOf: RSComposite) and: [
					  each children anySatisfy: [ :child |
						  (child isKindOf: RSLabel) and: [ child text = aString ] ] ] ]
]

{ #category : 'helpers' }
CMChartRoassalTest >> lineData [

	^ CMSeriesData
		  of: (CMLineSeries new x: #currentTimeStep y: #a)
		  named: 'a'
		  color: Color red
		  steps: #( 12 13 14 )
		  values: {
				  (12 @ 30).
				  (13 @ 40).
				  (14 @ 50) }
]

{ #category : 'private' }
CMChartRoassalTest >> lines [

	^ chart seriesDataOf: model in: simulation
]

{ #category : 'private' }
CMChartRoassalTest >> plotShapesNamed: aString in: aCanvas [
	"The lines drawn for a chart line: the polylines of its color, or transparent ones when it is hidden"

	| color |
	color := (self lines detect: [ :each | each name = aString ]) color.
	^ aCanvas allChildren select: [ :each |
			  (each isKindOf: RSPolyline) and: [
				  each color = color or: [ each color = Color transparent ] ] ]
]

{ #category : 'helpers' }
CMChartRoassalTest >> seriesNamed: someNumbers [

	^ someNumbers collect: [ :each |
			  CMSeriesData
				  of:
				  (CMLineSeries new
					   x: #currentTimeStep
					   y: #energy
					   ofAll: CMMockAnimal)
				  named: 'Rabbit ' , each printString
				  color: Color red
				  steps: #( 0 1 2 )
				  values: {
						  (0 @ 1).
						  (1 @ 2).
						  (2 @ 3) } ]
]

{ #category : 'running' }
CMChartRoassalTest >> setUp [

	super setUp.
	simulation := (CMSimulation for: CMMockModel new)
		              randomSeed: 41;
		              activeInitSelector: #initFixed;
		              activeControlSelector: #step;
		              initializeSimulation;
		              yourself.
	3 timesRepeat: [ simulation runStep ].
	model := simulation cormasModel.
	chart := CMChart new
		         lineX: #currentTimeStep y: #numberOfAliveCells;
		         lineX: #currentTimeStep y: #numberOfDeadCells;
		         yourself
]

{ #category : 'tests' }
CMChartRoassalTest >> testAChosenColorIsUsed [

	chart := CMChart new
		         lineX: #currentTimeStep y: #numberOfAliveCells;
		         add: (CMLineSeries new x: #currentTimeStep y: #numberOfDeadCells;
				          color: Color brown;
				          yourself);
		         yourself.
	self assert: self lines second color equals: Color brown
]

{ #category : 'tests' }
CMChartRoassalTest >> testAChosenColorIsUsedForTheLinesOfAllInstances [

	chart := CMChart new
		         add: (CMLineSeries new x: #currentTimeStep y: #energy ofAll: CMMockAnimal;
				          color: Color gray;
				          yourself);
		         yourself.
	self assert: self lines size > 1.
	self assert:
		(self lines allSatisfy: [ :each | each color = Color gray ])
]

{ #category : 'tests' }
CMChartRoassalTest >> testAFixedYRangeSetsTheYAxis [

	| texts |
	chart yFrom: 20 to: 100.
	texts := self textsOf:
		         (chart canvasOf: { self lineData } hiding: Set new).
	self assert: (texts includes: '100').
	self assert: (texts count: [ :each | each = '0' ]) equals: 1
]

{ #category : 'tests' }
CMChartRoassalTest >> testAHiddenLegendIsNotDrawn [

	chart hideLegend.
	self deny: ((self textsOf: (self canvasHiding: Set new)) includes:
			 'numberOfDeadCells')
]

{ #category : 'tests' }
CMChartRoassalTest >> testAHiddenLineIsDrawnTransparent [

	| canvas |
	canvas := self canvasHiding: (Set with: 'numberOfDeadCells').
	self assert:
		((self plotShapesNamed: 'numberOfDeadCells' in: canvas) allSatisfy: [
			 :each | each color = Color transparent ])
]

{ #category : 'tests' }
CMChartRoassalTest >> testALegendTooBigForThreeLinesIsReplacedByANote [

	| texts |
	texts := self textsOf:
		         (chart
			          canvasOf: (self seriesNamed: (1 to: 100))
			          hiding: Set new).
	self deny: (texts includes: 'Rabbit 1').
	self assert: (texts includes: '(legend is too big to be displayed)')
]

{ #category : 'tests' }
CMChartRoassalTest >> testALegendWiderThanTheChartWrapsOnSeveralLines [

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
CMChartRoassalTest >> testALineBetweenTwoProbesJoinsTheirValuesInTheOrderOfTheSteps [

	| plot |
	chart := CMChart new
		         lineX: #numberOfAliveCells y: #numberOfDeadCells;
		         yourself.
	plot := (chart plotsOf: self lines) first value.
	self assert: plot xValues asArray equals: #( 11 5 11 5 ).
	self assert: plot yValues asArray equals: #( 5 11 5 11 )
]

{ #category : 'tests' }
CMChartRoassalTest >> testALineOfAMethodThatIsNotAProbeRaisesAnError [

	chart := CMChart new
		         lineX: #currentTimeStep y: #numberOfCows;
		         yourself.
	self should: [ self lines ] raise: Error withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: '#numberOfCows').
			self assert: (error messageText includesSubstring: 'CMMockModel') ]
]

{ #category : 'tests' }
CMChartRoassalTest >> testALineOfAnInstanceIsNamedAfterItsInstance [
	| cow |
	chart := CMChart new
		         add: (CMLineSeries new x: #currentTimeStep y: #energy ofAll: CMMockAnimal;
				          label: 'Energy';
				          yourself);
		         yourself.
	cow := (model entitiesOfClass: CMMockCow) first.
	self assert: self lines first name equals: (simulation dataOf: cow) label
]

{ #category : 'tests' }
CMChartRoassalTest >> testALineOfValuesThatAreNotNumbersRaisesAnError [

	chart := CMChart new
		         linesX: #currentTimeStep y: #state ofAll: CMMockCell;
		         yourself.
	self should: [ self lines ] raise: Error withExceptionDo: [ :error |
		self assert: (error messageText includesSubstring: 'state') ]
]

{ #category : 'tests' }
CMChartRoassalTest >> testAProbeThatWasNotRecordedCannotBeDrawn [

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
CMChartRoassalTest >> testAReferenceLineAtXIsDrawnAcrossTheChartAtItsValue [

	| canvas pointX |
	chart lineAtX: 13 label: 'Harvest'.
	canvas := chart canvasOf: { self lineData } hiding: Set new.
	pointX := (canvas allChildren detect: [ :each |
		           each isKindOf: RSPolyline ]) controlPoints second x.
	self assert: (canvas allChildren anySatisfy: [ :each |
				 (each isKindOf: RSLine) and: [
						 (each startPoint x closeTo: pointX) and: [
								 (each endPoint x closeTo: pointX) and: [
									 (each endPoint y - each startPoint y) abs > 300 ] ] ] ])
]

{ #category : 'tests' }
CMChartRoassalTest >> testAReferenceLineAtYIsDrawnAcrossTheChartAtItsValue [

	| canvas pointY |
	chart lineAtY: 40 label: 'Target'.
	canvas := chart canvasOf: { self lineData } hiding: Set new.
	pointY := (canvas allChildren detect: [ :each |
		           each isKindOf: RSPolyline ]) controlPoints second y.
	self assert: (canvas allChildren anySatisfy: [ :each |
				 (each isKindOf: RSLine) and: [
						 (each startPoint y closeTo: pointY) and: [
								 (each endPoint y closeTo: pointY) and: [
									 each endPoint x - each startPoint x > 700 ] ] ] ])
]

{ #category : 'tests' }
CMChartRoassalTest >> testAReferenceLineIsLabelledOnTheChartRatherThanInTheLegend [

	| canvas |
	chart
		lineAtY: 40 label: 'Target';
		lineAtX: 13 label: 'Harvest';
		hideLegend.
	canvas := chart canvasOf: { self lineData } hiding: Set new.
	self assert:
		((self textsOf: canvas) includesAll: #( 'Target' 'Harvest' ))
]

{ #category : 'tests' }
CMChartRoassalTest >> testAxesOfNonNegativeValuesStartAtZero [

	| canvas |
	canvas := chart
		          canvasOf: { (self lineData) }
		          hiding: Set new.
	self
		assert: ((self textsOf: canvas) count: [ :each | each = '0' ])
		equals: 2
]

{ #category : 'tests' }
CMChartRoassalTest >> testClickingAHiddenLineInTheLegendShowsItAgain [

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
CMChartRoassalTest >> testClickingALegendEntryHidesItsLine [

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
CMChartRoassalTest >> testEachLineFollowsItsProbeOverTheRecordedSteps [

	self assert: self lines first steps asArray equals: #( 0 1 2 3 ).
	self assert: self lines first values asArray equals: {
			(0 @ 11).
			(1 @ 5).
			(2 @ 11).
			(3 @ 5) }.
	self
		assert:
		(self lines second values collect: [ :each | each y ]) asArray
		equals: #( 5 11 5 11 )
]

{ #category : 'tests' }
CMChartRoassalTest >> testLinesWithoutAChosenColorGetDifferentColors [

	self deny: self lines first color equals: self lines second color
]

{ #category : 'tests' }
CMChartRoassalTest >> testSeriesOfDifferentKindsAreDrawnTogether [

	| plots |
	chart := CMChart new
		         boxesX: #currentTimeStep y: #energy ofAll: CMMockAnimal;
		         lineX: #currentTimeStep y: #numberOfAliveCells;
		         yourself.
	plots := chart plotsOf: self lines.
	self
		assert: (plots collect: [ :each | each value class ]) asArray
		equals: {
				CMBoxesPlot.
				RSLinePlot }
]

{ #category : 'tests' }
CMChartRoassalTest >> testTheAxesReachTheReferenceLines [

	| texts |
	chart
		lineAtY: 80 label: 'High';
		lineAtX: 25 label: 'Late'.
	texts := self textsOf:
		         (chart canvasOf: { self lineData } hiding: Set new).
	self assert: (texts includesAll: #( '80' '25' ))
]

{ #category : 'tests' }
CMChartRoassalTest >> testTheCanvasCannotBeZoomedNorDragged [

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
CMChartRoassalTest >> testTheCanvasShowsTheTitles [

	| texts |
	chart
		title: 'Cells';
		yTitle: 'Number of cells'.
	texts := self textsOf: (self canvasHiding: Set new).
	self assert: (texts includes: 'Cells').
	self assert: (texts includes: 'Number of cells')
]

{ #category : 'tests' }
CMChartRoassalTest >> testTheChartHasAxisLinesButNoFrame [

	self deny:
		((self canvasHiding: Set new) allChildren anySatisfy: [ :each |
				 (each isKindOf: RSBox) and: [
					 each color isNil or: [ each color = Color transparent ] ] ])
]

{ #category : 'tests' }
CMChartRoassalTest >> testTheLegendShowsTheLabelOfEachLine [

	| texts |
	chart := CMChart new
		         lineX: #currentTimeStep y: #numberOfAliveCells;
		         add: (CMLineSeries new x: #currentTimeStep y: #numberOfDeadCells;
				          label: 'Dead cells';
				          yourself);
		         yourself.
	texts := self textsOf: (self canvasHiding: Set new).
	self assert: (texts includes: 'numberOfAliveCells').
	self assert: (texts includes: 'Dead cells')
]

{ #category : 'tests' }
CMChartRoassalTest >> testTheLinesEndWhereTheXAxisEnds [
	| canvas line |
	canvas := chart
		          canvasOf: { (self lineData) }
		          hiding: Set new.
	line := canvas allChildren detect: [ :each | each isKindOf: RSPolyline ].
	self
		assert: line encompassingRectangle right
		closeTo: (canvas allChildren detect: [ :each | each isKindOf: RSComposite ]) encompassingRectangle right
		precision: 10
]

{ #category : 'tests' }
CMChartRoassalTest >> testTheLinesKeepTheOrderInWhichTheyWereAdded [

	self
		assert: (self lines collect: [ :each | each name ] as: Array)
		equals: #( 'numberOfAliveCells' 'numberOfDeadCells' )
]

{ #category : 'tests' }
CMChartRoassalTest >> testTheLinesOfAllInstancesOfAClassAreALineForEachInstance [

	| cow |
	chart := CMChart new
		         linesX: #currentTimeStep y: #energy ofAll: CMMockAnimal;
		         yourself.
	cow := (model entitiesOfClass: CMMockCow) first.
	self assert: self lines size equals: 2.
	self
		assert:
		(self lines first values collect: [ :each | each y ]) asArray
		equals: ((simulation dataOf: cow) column: #energy) asArray
]

{ #category : 'tests' }
CMChartRoassalTest >> testTheLinesOfAllInstancesOfAClassThatIsNotRecordedCannotBeDrawn [

	simulation
		doNotRecord: CMMockAnimal;
		initializeSimulation.
	chart := CMChart new
		         linesX: #currentTimeStep y: #energy ofAll: CMMockAnimal;
		         yourself.
	self should: [ self lines ] raise: CMRecordingError
]

{ #category : 'tests' }
CMChartRoassalTest >> testTheLinesOfAllInstancesOfAMethodThatIsNotAProbeRaiseAnError [

	chart := CMChart new
		         linesX: #currentTimeStep y: #id ofAll: CMMockCow;
		         yourself.
	self should: [ self lines ] raise: Error withExceptionDo: [ :error |
		self assert: (error messageText includesSubstring: 'CMMockCow') ]
]

{ #category : 'tests' }
CMChartRoassalTest >> testTheStepIsTheValueOfCurrentTimeStep [

	self
		assert:
		(self lines first values collect: [ :each | each x ]) asArray
		equals: simulation modelData steps asArray
]

{ #category : 'tests' }
CMChartRoassalTest >> testTheXAxisEndsAtTheLastStep [
	| canvas |
	canvas := chart
		          canvasOf: { (self lineData) }
		          hiding: Set new.
	self assert: ((self textsOf: canvas) includes: '10').
	self deny: ((self textsOf: canvas) includes: '15')
]

{ #category : 'tests' }
CMChartRoassalTest >> testTheXAxisOfAGrowingChartLeavesRoomUpToTheNextTick [
	| canvas |
	canvas := chart
		          canvasOf: { (self lineData) }
		          hiding: Set new
		          leavingRoomToGrow: true.
	self assert: ((self textsOf: canvas) includes: '15')
]

{ #category : 'tests' }
CMChartRoassalTest >> testTicksOfDecimalsAreLabelledWithTheDecimalsTheyNeed [
	"The energy of the animals stays at 0.5, so the y axis goes from 0 to 0.5, 0.1 apart"

	| texts |
	chart := CMChart new
		         linesX: #currentTimeStep y: #energy ofAll: CMMockAnimal;
		         yourself.
	texts := self textsOf: (self canvasHiding: Set new).
	self assert: (texts includes: '0.1').
	self assert: (texts includes: '0.5')
]

{ #category : 'tests' }
CMChartRoassalTest >> testTicksOfWholeNumbersAreLabelledWithoutDecimals [

	self deny:
		((self textsOf: (self canvasHiding: Set new)) anySatisfy: [ :each |
			 each includesSubstring: '.' ])
]

{ #category : 'tests' }
CMChartRoassalTest >> testValuesBeyondAFixedYRangeWidenTheYAxis [

	chart yFrom: 0 to: 1.
	self assert:
		((self textsOf: (chart canvasOf: { self lineData } hiding: Set new))
			 includes: '50')
]

{ #category : 'private' }
CMChartRoassalTest >> textsOf: aCanvas [

	^ (aCanvas allChildren select: [ :each | each isKindOf: RSLabel ])
		  collect: [ :each | each text ]
]
