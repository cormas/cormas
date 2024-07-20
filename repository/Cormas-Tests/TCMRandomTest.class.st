Class {
	#name : 'TCMRandomTest',
	#superclass : 'TestCase',
	#instVars : [
		'cormasModel'
	],
	#category : 'Cormas-Tests-Communication',
	#package : 'Cormas-Tests',
	#tag : 'Communication'
}

{ #category : 'running' }
TCMRandomTest >> setUp [

	super setUp.
	cormasModel := CMMockModel new.
	cormasModel randomSeed: 42.
]

{ #category : 'tests' }
TCMRandomTest >> testShuffled [

	| expected actual |
	expected := #(4 5 1 2 3) asOrderedCollection.
	actual := cormasModel shuffled: #(1 2 3 4 5).
	
	self assert: actual equals: expected.
]
