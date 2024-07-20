Trait {
	#name : 'TCMRandom',
	#instVars : [
		'randomNumberGenerator'
	],
	#category : 'Cormas-Core-Kernel',
	#package : 'Cormas-Core',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
TCMRandom >> random [

	^ self randomGenerator next
]

{ #category : 'accessing' }
TCMRandom >> randomNumberGenerator: aGenerator [

	randomNumberGenerator := aGenerator
]

{ #category : 'utilities - random' }
TCMRandom >> randomSeed: aNumber [

	randomNumberGenerator seed: aNumber
]

{ #category : 'utilities - random' }
TCMRandom >> selectRandomlyFrom: aCollection [

	^ aCollection atRandom: randomNumberGenerator
]

{ #category : 'as yet unclassified' }
TCMRandom >> selectRandomlyFrom: aCollection size: anInteger [
	"Returns a subcollection randomly built from a collection (an item may be selected only once). If the collection is empty, or if the collection size is lower than the subcollection size, its returns aCollection randomly mixed."
	
	| randomCollection |
	anInteger < 1 ifTrue: [ ^ OrderedCollection new ].
	
	randomCollection := self shuffled: aCollection.
	randomCollection size <= anInteger ifTrue: [ ^ randomCollection ].
	^ randomCollection copyFrom: 1 to: anInteger
]

{ #category : 'as yet unclassified' }
TCMRandom >> shuffled: aCollection [

	^ aCollection asOrderedCollection shuffledBy: randomNumberGenerator
]
