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

	^ randomNumberGenerator next
]

{ #category : 'random' }
TCMRandom >> randomBetween: lowerBound and: higherBound [
	"Answer a random float number from the range [lowerBound, higherBound)"
	^ lowerBound + (self random * (higherBound - lowerBound))
]

{ #category : 'random' }
TCMRandom >> randomColor [

	^ Color
		  r: self random
		  g: self random
		  b: self random
]

{ #category : 'accessing' }
TCMRandom >> randomNumberGenerator [
	
	^ randomNumberGenerator 
]

{ #category : 'accessing' }
TCMRandom >> randomNumberGenerator: aGenerator [

	randomNumberGenerator := aGenerator
]

{ #category : 'accessing' }
TCMRandom >> randomSeed: aNumber [

	randomNumberGenerator seed: aNumber
]

{ #category : 'random' }
TCMRandom >> selectRandomlyFrom: aCollection [

	^ aCollection atRandom: randomNumberGenerator
]

{ #category : 'random' }
TCMRandom >> selectRandomlyFrom: aCollection size: anInteger [
	"Returns a subcollection randomly built from a collection (an item may be selected only once). If the collection is empty, or if the collection size is lower than the subcollection size, its returns aCollection randomly mixed."
	
	| randomCollection |
	anInteger < 1 ifTrue: [ ^ OrderedCollection new ].
	
	randomCollection := self shuffled: aCollection.
	randomCollection size <= anInteger ifTrue: [ ^ randomCollection ].
	^ randomCollection copyFrom: 1 to: anInteger
]

{ #category : 'random' }
TCMRandom >> shuffled: aCollection [

	^ aCollection asOrderedCollection shuffledBy: randomNumberGenerator
]
