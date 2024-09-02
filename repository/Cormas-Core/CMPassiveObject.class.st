"
PassiveObject is an empty class.
An instance of this class or its subclass should be a simple entity of the model, but should belong to the 'world' (it should have a sense in term of the model).
"
Class {
	#name : 'CMPassiveObject',
	#superclass : 'CMEntity',
	#instVars : [
		'destroyed'
	],
	#category : 'Cormas-Core-Entities',
	#package : 'Cormas-Core',
	#tag : 'Entities'
}

{ #category : 'controlling' }
CMPassiveObject >> delete [

	"Purpose: gets rid of this object. The collectGarbage is IMMEDIATELY performed  (ie. the receiver of class X is removed from 'theXXXs' collection)"

	self destroyed: true.
	cormasModel removeEntity: self.
]

{ #category : 'initialize-release' }
CMPassiveObject >> destroyed [
	"Answer if the entity is destroyed or not"
	
	self deprecated: 'Should use #isDestroyed or #isDead '.
	^ destroyed ifNil: [ destroyed := false ]
]

{ #category : 'initialize-release' }
CMPassiveObject >> destroyed: aBoolean [
	
	destroyed := aBoolean.
	(aBoolean and: [self isSituated]) ifTrue: [self leave]
]

{ #category : 'testing' }
CMPassiveObject >> isDead [
	" See superimplementor's comment "

	^ destroyed ifNil: [ destroyed := false ]
]

{ #category : 'testing' }
CMPassiveObject >> isPassiveObject [
	
	^true
]
