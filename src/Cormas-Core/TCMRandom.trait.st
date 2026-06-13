"
This is the random generator for Cormas.
randomNumberGenerator is by default an instance of PMFishmanMooreRandomGenerator
"
Trait {
	#name : 'TCMRandom',
	#instVars : [
		'randomNumberGenerator'
	],
	#category : 'Cormas-Core-Traits',
	#package : 'Cormas-Core',
	#tag : 'Traits'
}

{ #category : 'random' }
TCMRandom >> random [
	<api>
	
	^ self randomNumberGenerator next
]

{ #category : 'random' }
TCMRandom >> randomBetween: lowerBound and: higherBound [
	<api>
	<doc: 'Answer a random float number from the range [lowerBound, higherBound)'>
		
	^ lowerBound + (self random * (higherBound - lowerBound))
]

{ #category : 'random' }
TCMRandom >> randomColor [
	<api>

	^ Color
		  r: self random
		  g: self random
		  b: self random
]

{ #category : 'random' }
TCMRandom >> randomIntegerBetween: lowNumber and: highNumber [
	<api>

	^ (self randomBetween: lowNumber and: highNumber) rounded
]

{ #category : 'accessing' }
TCMRandom >> randomNumberGenerator [
	<api>
	
	^ self simulationContext randomNumberGenerator 
]

{ #category : 'random' }
TCMRandom >> selectRandomlyFrom: aCollection [
	<api>

	^ aCollection atRandom: self randomNumberGenerator
]

{ #category : 'random' }
TCMRandom >> selectRandomlyFrom: aCollection size: anInteger [
	<api>
	<doc: 'Returns a subcollection randomly built from a collection (an item may be selected only once). If the collection is empty, or if the collection size is lower than the subcollection size, its returns aCollection randomly mixed.'>
	
	| randomCollection |
	anInteger < 1 ifTrue: [ ^ OrderedCollection new ].
	
	randomCollection := self shuffled: aCollection.
	randomCollection size <= anInteger ifTrue: [ ^ randomCollection ].
	^ randomCollection copyFrom: 1 to: anInteger
]

{ #category : 'random' }
TCMRandom >> shuffled: aCollection [
	<api>

	^ aCollection asOrderedCollection shuffledBy: self randomNumberGenerator
]
