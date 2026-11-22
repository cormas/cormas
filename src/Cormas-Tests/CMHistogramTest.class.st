Class {
	#name : 'CMHistogramTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'tests' }
CMHistogramTest >> testBarsCanBeLabelled [

	| chart |
	chart := CMHistogram new
		         bars: #energy ofAll: CMMockAnimal;
		         label: 'Energy' for: #energy;
		         yourself.
	self assert: (chart labelFor: #energy) equals: 'Energy'
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
