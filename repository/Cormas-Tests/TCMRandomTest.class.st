Class {
	#name : 'TCMRandomTest',
	#superclass : 'TestCase',
	#instVars : [
		'cormasModel'
	],
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'running' }
TCMRandomTest >> setUp [

	super setUp.
	cormasModel := CMMockModel new.
	cormasModel randomSeed: 42.
]

{ #category : 'tests' }
TCMRandomTest >> testRandom [

	| expected actual |
	
	expected := #(
		0.5302191304649315
		0.46180749473246163
		0.13668158051403312
		0.01818519179624747
		0.20550016556191267).
		
	actual:= (1 to: 5) collect: [ :i | cormasModel random ].

	self assert: expected closeTo: actual precision: 0.00000000001
]

{ #category : 'tests' }
TCMRandomTest >> testSelectRandomlyFrom [

	| collection |
	collection := #(apple banana avocado cherry strawberry).
	
	self assert: (cormasModel selectRandomlyFrom: collection) equals: #avocado
]

{ #category : 'tests' }
TCMRandomTest >> testSelectRandomlyFromSize [

	| collection |
	collection := #(apple banana avocado cherry strawberry).
	
	self
		assert: (cormasModel selectRandomlyFrom: collection size: 3)
		equals: #(cherry strawberry apple) asOrderedCollection
]

{ #category : 'tests' }
TCMRandomTest >> testShuffled [

	| expected actual |
	expected := #(4 5 1 2 3) asOrderedCollection.
	actual := cormasModel shuffled: #(1 2 3 4 5).
	
	self assert: actual equals: expected.
]
