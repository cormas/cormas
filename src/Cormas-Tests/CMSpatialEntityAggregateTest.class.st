Class {
	#name : 'CMSpatialEntityAggregateTest',
	#superclass : 'TestCase',
	#instVars : [
		'model'
	],
	#category : 'Cormas-Tests-Model',
	#package : 'Cormas-Tests',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
CMSpatialEntityAggregateTest >> createAggregate [

	^ model createAggregate: CMMockAggregate from: (model cells select: [ :cell | cell coordinates x = 2 or: [ cell coordinates y = 2 ] ])
]

{ #category : 'as yet unclassified' }
CMSpatialEntityAggregateTest >> createModel [

	model := CMMockModel new.
	model initFixed.
	model simulationContext randomSeed: 42.
]

{ #category : 'running' }
CMSpatialEntityAggregateTest >> setUp [

	super setUp.
	self createModel
]

{ #category : 'tests' }
CMSpatialEntityAggregateTest >> testSetSurroundCanBeFixedWithRandomSeed [

	| aggregate firstSurround secondSurround |
	
	self createModel.
	aggregate := self createAggregate.
	aggregate setSurround.
	firstSurround := aggregate surround.
	
	self createModel.
	aggregate := self createAggregate.
	aggregate setSurround.
	secondSurround := aggregate surround.
	
	self
		assert: (firstSurround collect: #id)
		equals: (secondSurround collect: #id)
]
