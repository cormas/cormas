Class {
	#name : 'CMBoxplotTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'tests' }
CMBoxplotTest >> testBoxesCanBeColored [

	| chart |
	chart := CMBoxplot new
		         boxes: #energy ofAll: CMMockAnimal;
		         color: Color red for: #energy;
		         yourself.
	self
		assert: (chart colorFor: #energy ifNone: [ nil ])
		equals: Color red
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
