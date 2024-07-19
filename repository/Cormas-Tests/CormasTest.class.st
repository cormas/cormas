Class {
	#name : 'CormasTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests-Helpers',
	#package : 'Cormas-Tests',
	#tag : 'Helpers'
}

{ #category : 'tests' }
CormasTest >> testAverage [
	| n |
	n := #(1 2 3 4 5 6 7 8 9 10).
	self assert: (Cormas average: n) equals:  5.5.
]

{ #category : 'tests' }
CormasTest >> testLogisticGrowthRK [
	self assert: (Cormas logisticIncrease: 1.0 r: 2.0 K: 4.0) equals: 1.5.
	self assert: (Cormas logisticGrowth: 1.0 r: 2.0 K: 4.0) equals: 2.5
]

{ #category : 'tests' }
CormasTest >> testMax [
	| n |
	n := #(10 20 58 96 48 76 57 68 19 10).
	self assert: (Cormas max: n) equals: 96
]

{ #category : 'tests' }
CormasTest >> testMaxOfAmongObjects [
	self
		assert: (Cormas maxOf: #abs amongObjects: #(-2 -1 0 1 2))
		equals: 2
]

{ #category : 'tests' }
CormasTest >> testMaximumOfNumbers [
	| aCollection |
	aCollection := #(3 1 5 4 2).
	self assert: (Cormas max: aCollection) equals: 5
]

{ #category : 'tests' }
CormasTest >> testMedian [
"in R with median(c(10,20,58,96,48,76,57,68,19,10)), return
[1] 52.5
"
	| n |
	n := #(10 20 58 96 48 76 57 68 19).
	self assert: (Cormas median: n) equals: 57.
]

{ #category : 'tests' }
CormasTest >> testMixt [
	| aCollection |
	aCollection := #(1 2 3 4 5).
	self assert: ((Cormas mix: aCollection) includes: 1)
]

{ #category : 'tests' }
CormasTest >> testNumberOnCycle [

self assert: (Cormas number: 65 onCycle:40) equals:25
]

{ #category : 'tests' }
CormasTest >> testRandom [
	self assert: (Cormas random between: 0.0 and: 1.0)
]

{ #category : 'tests' }
CormasTest >> testRandomFloat [
	| n |
	n := Cormas randomFloatFrom: -4.1 to: 2.5.
	self assert: n >= -4.1.
	self assert: n < 2.5
]

{ #category : 'tests' }
CormasTest >> testRandomGenerator [
	self
		assert: (Cormas randomGenerator isKindOf: PMFishmanMooreRandomGenerator)
]

{ #category : 'tests' }
CormasTest >> testRandomReturnAValueBetweenZeroAndOne [
	1000 timesRepeat: [ self assert: Cormas random >= 0 ].
	1000 timesRepeat: [ self assert: Cormas random < 1 ]
]

{ #category : 'tests' }
CormasTest >> testRemoveFirstCharacterOfString [
	
	self assert: (Cormas removeFirstCharacterOfString: 'Hello word') equals: 'ello word'.
]

{ #category : 'tests' }
CormasTest >> testRoundToNdigits [
"In R round(4.8750654, digits = 2)
[1] 4.88
"
	self assert: (Cormas round: 4.8750654 toNdigits:  2) equals: 4.88. 
]

{ #category : 'tests' }
CormasTest >> testSeed [
	Cormas seed: 0.
	self assert: Cormas seed equals: 0.
	Cormas releaseRandomSeed
]

{ #category : 'tests' }
CormasTest >> testSelectRandomlyFrom [

	| collection selectedElement |
	collection := #(a b c d e).
	
	selectedElement := Cormas selectRandomlyFrom: collection.
	
	self assert: (collection includes: selectedElement)
]

{ #category : 'tests' }
CormasTest >> testSelectRandomlyFromWithFixedSeed [

	| collection selectedElements expectedElements |
	
	collection := #(a b c d e).
	Cormas seed: 42.
	
	selectedElements := (1 to: 6) collect: [ :each |
		Cormas selectRandomlyFrom: collection ].
	
	expectedElements := #(c c a a b c).
	
	self assert: selectedElements equals: expectedElements.
]

{ #category : 'tests' }
CormasTest >> testSinMinMaxPhasePeriod [
	"Not nice but ... work :-) I need to fin the way in R to build a true test"
	self assert: (Cormas sin: 3 min: -10 max: 20 phase: 0 period: 24) closeTo: 25.606601717798213 
]

{ #category : 'tests' }
CormasTest >> testSum [
	| aCollection |
	aCollection := #(3 1 5 4 2).
	self assert: (Cormas sum: aCollection) equals: 15
]
