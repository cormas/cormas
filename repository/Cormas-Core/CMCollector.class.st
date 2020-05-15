"
Collector stores the new entities creating during the simulation.

The entities are collected by CormasModel at the end of each time step.

Instance Variables:
	entities	<Dictionary> description of entities
	cormasModel	<CormasModel> private access to CormasModel


"
Class {
	#name : #CMCollector,
	#superclass : #Object,
	#instVars : [
		'entities',
		'cormasModel'
	],
	#category : #'Cormas-Core-Tools'
}

{ #category : #action }
CMCollector >> collect: anEntity [
	
	(self entitiesAt: anEntity class) add: anEntity
]

{ #category : #private }
CMCollector >> cormasModel: cm [
	
	cormasModel := cm
]

{ #category : #action }
CMCollector >> empty [
	
	entities := nil
]

{ #category : #action }
CMCollector >> empty: aClass [
	
	^self entities
		at: aClass
		put: OrderedCollection new
]

{ #category : #accessing }
CMCollector >> entities [
	
	^entities ifNil: [entities := Dictionary new]
]

{ #category : #accessing }
CMCollector >> entities: anObject [
	
	entities := anObject
]

{ #category : #action }
CMCollector >> entitiesAt: aClass [
	
	^self entities
		at: aClass
		ifAbsentPut: [OrderedCollection new]
]

{ #category : #private }
CMCollector >> removeDeadEntities [
	"removes all the dead or destroyed intances"
	
	cormasModel removeDestroyedEntities
]

{ #category : #private }
CMCollector >> removeEntity: anEntity [
	"removes the dead or destroyed Entity"
	
	cormasModel removeEntity: anEntity
]

{ #category : #private }
CMCollector >> updateEntities [
	"adds (or removes) all newly created (or dead) intances"
	
	cormasModel updateEntities
]
