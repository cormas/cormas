Class {
	#name : 'CMSimulationContextTest',
	#superclass : 'TestCase',
	#instVars : [
		'context'
	],
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'running' }
CMSimulationContextTest >> setUp [
	super setUp.
	context := CMSimulationContext new.
]

{ #category : 'tests' }
CMSimulationContextTest >> testDefaultRandomNumberGenerator [

	self assert: context randomNumberGenerator class equals: PMFishmanMooreRandomGenerator
]

{ #category : 'tests' }
CMSimulationContextTest >> testDefaultRandomSeed [

	self assert: context randomSeed isNumber
]

{ #category : 'tests' }
CMSimulationContextTest >> testRandomSeed [

	context randomSeed: 42.
	self assert: context randomSeed equals: 42.
	self assert: context randomNumberGenerator seed equals: 42
]

{ #category : 'tests' }
CMSimulationContextTest >> testRandomSeedThenRandomNumberGenerator [

	context randomSeed: 42.
	context randomNumberGenerator: Random new.
	
	self assert: context randomSeed equals: 42.
	self assert: context randomNumberGenerator seed equals: 42.
	
	"Not sure if this makes sense"
	context randomNumberGenerator: (Random seed: 100).
	
	self assert: context randomSeed equals: 42.
	self assert: context randomNumberGenerator seed equals: 42.
]
