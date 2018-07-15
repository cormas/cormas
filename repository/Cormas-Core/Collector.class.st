"
Collector stores the new entities creating during the simulation.

The entities are collected by CormasModel at the end of each time step.

Instance Variables:
	entities	<Dictionary> description of entities
	cormasModel	<CormasModel> private access to CormasModel


"
Class {
	#name : #Collector,
	#superclass : #Object,
	#instVars : [
		'entities',
		'cormasModel'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #action }
Collector >> collect: anEntity [
	
	(self entitiesAt: anEntity class) add: anEntity
]

{ #category : #private }
Collector >> cormasModel: cm [
	
	cormasModel := cm
]

{ #category : #action }
Collector >> empty [
	
	entities := nil
]

{ #category : #action }
Collector >> empty: aClass [
	
	^self entities
		at: aClass
		put: OrderedCollection new
]

{ #category : #accessing }
Collector >> entities [
	
	^entities ifNil: [entities := Dictionary new]
]

{ #category : #accessing }
Collector >> entities: anObject [
	
	entities := anObject
]

{ #category : #action }
Collector >> entitiesAt: aClass [
	
	^self entities
		at: aClass
		ifAbsentPut: [OrderedCollection new]
]

{ #category : #private }
Collector >> removeDeadEntities [
	"removes all the dead or destroyed intances"
	
	cormasModel removeDestroyedEntities
]

{ #category : #private }
Collector >> removeEntity: anEntity [
	"removes the dead or destroyed Entity"
	
	cormasModel removeEntity: anEntity
]

{ #category : #private }
Collector >> updateEntities [
	"adds (or removes) all newly created (or dead) intances"
	
	cormasModel updateEntities
]
