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
CMLineChartTest >> testAColorForAProbeThatIsNotShownRaisesAnError [

	self
		should: [ chart color: Color red for: #bag ]
		raise: Error
		withExceptionDo: [ :error |
		self assert: (error messageText includesSubstring: 'bag') ]
]

{ #category : 'tests' }
CMLineChartTest >> testALabelForAProbeThatIsNotShownRaisesAnError [

	self
		should: [ chart label: 'Bag' for: #bag ]
		raise: Error
		withExceptionDo: [ :error |
		self assert: (error messageText includesSubstring: 'bag') ]
]

{ #category : 'tests' }
CMLineChartTest >> testALabelReplacesTheProbeName [

	chart label: 'Boars in towns' for: #urbanBoars.
	self assert: (chart labelFor: #urbanBoars) equals: 'Boars in towns'.
	self assert: (chart labelFor: #boars) equals: 'boars'
]

{ #category : 'tests' }
CMLineChartTest >> testALineHasNoColorUntilOneIsChosen [

	self assert: (chart colorFor: #boars ifNone: [ #none ]) equals: #none.
	chart color: Color brown for: #boars.
	self
		assert: (chart colorFor: #boars ifNone: [ #none ])
		equals: Color brown
]

{ #category : 'tests' }
CMLineChartTest >> testALineIsLabelledByItsProbe [

	self assert: (chart labelFor: #boars) equals: 'boars'
]

{ #category : 'tests' }
CMLineChartTest >> testAProbeShownTwiceCannotBeLabelled [
	chart lines: #boars ofAll: CMMockAnimal.
	self
		should: [ chart label: 'Boars' for: #boars ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'more than once') ]
]

{ #category : 'tests' }
CMLineChartTest >> testLinesKeepTheirOrder [

	self
		assert: chart shownSelectors asArray
		equals: #( #boars #urbanBoars )
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
CMLineChartTest >> testTheLinesOfAllInstancesOfAClassShowTheirProbe [
	chart lines: #energy ofAll: CMMockAnimal.
	self assert: (chart shownSelectors includes: #energy)
]

{ #category : 'tests' }
CMLineChartTest >> testTheSameProbeCannotBeShownTwice [

	self
		should: [ chart line: #boars ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'boars') ]
]
