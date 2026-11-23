Class {
	#name : 'CMLineChartTest',
	#superclass : 'TestCase',
	#instVars : [
		'chart'
	],
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'running' }
CMLineChartTest >> setUp [

	super setUp.
	chart := CMLineChart new
		         line: #boars;
		         line: #urbanBoars;
		         yourself
]

{ #category : 'tests' }
CMLineChartTest >> testAConfiguredLineShowsTheSameProbeAsASimpleOne [

	self
		should: [
				chart add: ((CMLineSeries probe: #boars)
						 label: 'Boars';
						 yourself) ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'boars') ]
]

{ #category : 'tests' }
CMLineChartTest >> testALineIsLabelledByItsProbeUntilALabelIsChosen [

	| line |
	line := CMLineSeries probe: #urbanBoars.
	self assert: line label equals: 'urbanBoars'.
	line label: 'Boars in towns'.
	self assert: line label equals: 'Boars in towns'
]

{ #category : 'tests' }
CMLineChartTest >> testASeriesOfAnotherKindCannotBeAdded [

	self
		should: [ chart add: (CMAreaSeries probe: #sheep) ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'CMAreaSeries') ]
]

{ #category : 'tests' }
CMLineChartTest >> testTheLinesOfAllInstancesOfAClassCannotBeShownTwice [
	chart lines: #energy ofAll: CMMockAnimal.
	self
		should: [ chart lines: #energy ofAll: CMMockAnimal ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'CMMockAnimal') ]
]

{ #category : 'tests' }
CMLineChartTest >> testTheSameProbeCannotBeShownTwice [

	self
		should: [ chart line: #boars ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'boars') ]
]
