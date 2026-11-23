Class {
	#name : 'CMBoxplotTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'tests' }
CMBoxplotTest >> testBoxesNeedAllTheInstancesOfAClass [

	self
		should: [ CMBoxSeries probe: #energy ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'probe:ofAll:') ]
]

{ #category : 'tests' }
CMBoxplotTest >> testTheBoxesOfAllInstancesOfAClassCannotBeShownTwice [

	| chart |
	chart := CMBoxplot new
		         boxes: #energy ofAll: CMMockAnimal;
		         yourself.
	self
		should: [ chart boxes: #energy ofAll: CMMockAnimal ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'CMMockAnimal') ]
]
