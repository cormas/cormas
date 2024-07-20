Class {
	#name : 'CormasTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests-Helpers',
	#package : 'Cormas-Tests',
	#tag : 'Helpers'
}

{ #category : 'tests' }
CormasTest >> testLogisticGrowthRK [
	self assert: (Cormas logisticIncrease: 1.0 r: 2.0 K: 4.0) equals: 1.5.
	self assert: (Cormas logisticGrowth: 1.0 r: 2.0 K: 4.0) equals: 2.5
]

{ #category : 'tests' }
CormasTest >> testMix [
	| aCollection |
	aCollection := #(1 2 3 4 5).
	self assert: ((Cormas mix: aCollection) includes: 1)
]

{ #category : 'tests' }
CormasTest >> testRandom [
	self assert: (Cormas random between: 0.0 and: 1.0)
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
CormasTest >> testSeed [
	Cormas seed: 0.
	self assert: Cormas seed equals: 0.
	Cormas releaseRandomSeed
]
