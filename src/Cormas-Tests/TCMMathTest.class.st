Class {
	#name : #TCMMathTest,
	#superclass : #TestCase,
	#instVars : [
		'object'
	],
	#category : 'Cormas-Tests'
}

{ #category : #running }
TCMMathTest >> setUp [

	| dummyClass |
	super setUp.
	
	"We create a dummy class that uses the trait just to test its methods"
	dummyClass := Object << #DummyClass
		traits: { TCMMath };
		build.
		
	object := dummyClass new.
]

{ #category : #tests }
TCMMathTest >> testLogisticGrowthRK [
	self assert: (object logisticIncrease: 1.0 r: 2.0 k: 4.0) equals: 1.5.
	self assert: (object logisticGrowth: 1.0 r: 2.0 k: 4.0) equals: 2.5
]
