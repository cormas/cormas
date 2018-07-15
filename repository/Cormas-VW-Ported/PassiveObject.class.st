"
PassiveObject is an empty class.
An instance of this class or its subclass should be a simple entity of the model, but should belong to the 'world' (it should have a sense in term of the model).
"
Class {
	#name : #PassiveObject,
	#superclass : #CMEntity,
	#instVars : [
		'destroyed'
	],
	#category : 'Cormas-VW-Ported'
}

{ #category : #'star control' }
PassiveObject >> delete [
"Purpose: gets rid of this object. The collectGarbage is IMMEDIATELY performed  (ie. the receiver of class X is removed from 'theXXXs' collection)"
	self destroyed: true.
	self collector isNil ifFalse:[self collector removeEntity: self]
]

{ #category : #'- initialize-release' }
PassiveObject >> destroyed [
	"Answer if the entity is destroyed or not"
	
	^destroyed ifNil: [destroyed := false]
]

{ #category : #'- initialize-release' }
PassiveObject >> destroyed: aBoolean [
	
	destroyed := aBoolean.
	(aBoolean and: [self isSituated]) ifTrue: [self leave]
]

{ #category : #'+ testing' }
PassiveObject >> isPassiveObject [
	
	^true
]
