"
I test the rules of `CMChart` and of its series: what a series shows, and which series a chart accepts together.
"
Class {
	#name : 'CMChartTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'tests' }
CMChartTest >> testAHistogramHasNoProbeOnY [

	self
		should: [ CMHistogramSeries new x: #age y: #energy ]
		raise: Error
]

{ #category : 'tests' }
CMChartTest >> testAHistogramIsLabelledByItsProbe [

	self
		assert: (CMHistogramSeries new x: #energy ofAll: CMMockAnimal) label
		equals: 'energy'
]

{ #category : 'tests' }
CMChartTest >> testASeriesIsLabelledByItsProbeOnYUntilALabelIsChosen [

	| series |
	series := CMLineSeries new x: #currentTimeStep y: #boars.
	self assert: series label equals: 'boars'.
	series label: 'Boars'.
	self assert: series label equals: 'Boars'
]

{ #category : 'tests' }
CMChartTest >> testASeriesShownTwiceIsNamedInTheError [

	| chart |
	chart := CMChart new
		         areasX: #currentTimeStep y: #state ofAll: CMMockCell;
		         yourself.
	self
		should: [
		chart areasX: #currentTimeStep y: #state ofAll: CMMockCell ]
		raise: Error
		withExceptionDo: [ :error |
				self assert: (error messageText includesSubstring:
						 '#state against #currentTimeStep of all CMMockCell') ]
]

{ #category : 'tests' }
CMChartTest >> testAllTheSeriesOfAChartHaveTheSameProbeOnX [

	| chart |
	chart := CMChart new
		         lineX: #currentTimeStep y: #energy;
		         yourself.
	self should: [ chart pointsX: #age y: #energy ] raise: Error.
	self
		should: [
		chart add: (CMHistogramSeries new x: #energy ofAll: CMMockAnimal) ]
		raise: Error.
	self assert: chart series size equals: 1
]

{ #category : 'tests' }
CMChartTest >> testSeriesOfDifferentKindsCanBeShownTogether [

	| chart |
	chart := CMChart new
		         add:
			         (CMBoxSeries new
				          x: #currentTimeStep
				          y: #energy
				          ofAll: CMMockAnimal);
		         add:
			         (CMLineSeries new
				          x: #currentTimeStep
				          y: #energy
				          ofAll: CMMockAnimal);
		         add: (CMPointSeries new x: #currentTimeStep y: #energy);
		         yourself.
	self assert: chart series size equals: 3
]

{ #category : 'tests' }
CMChartTest >> testShowingOnlyTheShownStepGivesTheChartAStepSlider [

	| chart |
	chart := CMChart new
		         lineX: #age y: #energy;
		         yourself.
	self deny: chart hasSeriesAtShownStep.
	chart add: (CMPointSeries new
			 x: #age y: #energy ofAll: CMMockAnimal;
			 atShownStep;
			 yourself).
	self assert: chart hasSeriesAtShownStep
]

{ #category : 'tests' }
CMChartTest >> testTheSameSeriesCannotBeShownTwice [

	| chart |
	chart := CMChart new
		         lineX: #currentTimeStep y: #energy;
		         linesX: #currentTimeStep y: #energy ofAll: CMMockAnimal;
		         yourself.
	self
		should: [
				chart add: (CMLineSeries new
						 x: #currentTimeStep y: #energy;
						 label: 'Energy';
						 yourself) ]
		raise: Error.
	self
		should: [
		chart linesX: #currentTimeStep y: #energy ofAll: CMMockAnimal ]
		raise: Error.
	chart
		linesX: #currentTimeStep y: #energy ofAll: CMMockGoat;
		pointsX: #currentTimeStep y: #energy.
	self assert: chart series size equals: 4
]
