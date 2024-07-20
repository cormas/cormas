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
