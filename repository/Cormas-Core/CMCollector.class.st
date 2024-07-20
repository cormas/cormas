"
Collector stores the new entities creating during the simulation.

The entities are collected by CormasModel at the end of each time step.

Instance Variables:
	entities	<Dictionary> description of entities
	cormasModel	<CormasModel> private access to CormasModel


"
Class {
	#name : 'CMCollector',
	#superclass : 'Object',
	#instVars : [
		'entities'
	],
	#category : 'Cormas-Core-Kernel',
	#package : 'Cormas-Core',
	#tag : 'Kernel'
}

{ #category : 'action' }
CMCollector >> collectEntity: anEntity [

	(entities
		at: anEntity class
		ifAbsentPut: [ OrderedCollection new ]) add: anEntity.
]

{ #category : 'accessing' }
CMCollector >> entities [

	^ entities
]

{ #category : 'initialization' }
CMCollector >> initialize [

	super initialize.
	entities := Dictionary new.
]
