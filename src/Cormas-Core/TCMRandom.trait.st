"
I give my users random operations. All of them draw from the same generator: the one of the simulation context, so that a simulation can be replayed from its random seed.

## Responsibility:

- Answer random numbers and colors.
- Pick random elements from a collection, and shuffle a collection.

## Collaborators:

- `CMSimulationContext`: holds the random number generator. My users must answer `simulationContext`.

## Public API and Key Messages

- `random`, `randomBetween:and:`, `randomIntegerBetween:and:`, `randomColor`
- `selectRandomlyFrom:`, which raises an error on an empty collection
- `selectRandomlyFrom:size:`, `shuffled:`

```
self selectRandomlyFrom: self cell neighbourhood
```
"
Trait {
	#name : 'TCMRandom',
	#category : 'Cormas-Core-Traits',
	#package : 'Cormas-Core',
	#tag : 'Traits'
}

{ #category : 'random' }
TCMRandom >> random [

	<api>
	<doc: 'Answer a random float number from the range ] 0 , 1 [ '>
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
	<doc:
	'Returns a random instance of Color (for which the amount of light in red, green, and blue are randomly chosen)'>
	^ Color r: self random g: self random b: self random
]

{ #category : 'random' }
TCMRandom >> randomIntegerBetween: lowNumber and: highNumber [

	<api>
	<doc:
	'Answer a random integer number from the range [lowerBound, higherBound)'>
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
	<doc:
	'Returns a random element from aCollection. Raises an error if aCollection is empty, so check it first when it can be.'>
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
	<doc: 'Returns a copy of aCollection randomly mixed.'>
	^ aCollection asOrderedCollection shuffledBy:
		  self randomNumberGenerator
]
