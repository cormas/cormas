Class {
	#name : 'CMHistogramTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'tests' }
CMHistogramTest >> testBarsNeedAllTheInstancesOfAClass [

	self
		should: [ CMBarSeries probe: #energy ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'probe:ofAll:') ]
]

{ #category : 'tests' }
CMHistogramTest >> testTheBarsOfAllInstancesOfAClassCannotBeShownTwice [

	| chart |
	chart := CMHistogram new
		         bars: #energy ofAll: CMMockAnimal;
		         yourself.
	self
		should: [ chart bars: #energy ofAll: CMMockAnimal ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'CMMockAnimal') ]
]
