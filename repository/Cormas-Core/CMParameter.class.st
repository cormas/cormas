Class {
	#name : 'CMParameter',
	#superclass : 'Object',
	#instVars : [
		'receiverClass',
		'getterMethod',
		'setterMethod'
	],
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}

{ #category : 'instance creation' }
CMParameter class >> getterMethod: aGetterMethod setterMethod: aSetterMethod receiverClass: anObject [

	^ self new
		initailizeGetterMethod: aGetterMethod
		setterMethod: aSetterMethod
		receiverClass: anObject;
		yourself
]

{ #category : 'comparing' }
CMParameter >> = anObject [

	anObject class = self class
		ifFalse: [ ^ false ].
		
	^ anObject receiverClass = receiverClass
		and: [ anObject getterMethod = getterMethod
			and: [ anObject setterMethod = setterMethod ] ]
]

{ #category : 'accessing' }
CMParameter >> getterMethod [

	^ getterMethod
]

{ #category : 'comparing' }
CMParameter >> hash [
		
	^ receiverClass hash bitXor: (getterMethod hash bitXor: setterMethod hash)
]

{ #category : 'initialization' }
CMParameter >> initailizeGetterMethod: aGetterMethod setterMethod: aSetterMethod receiverClass: anObject [
	
	getterMethod := aGetterMethod.
	setterMethod := aSetterMethod.
	receiverClass := anObject.
]

{ #category : 'accessing' }
CMParameter >> name [

	^ setterMethod selector allButLast
]

{ #category : 'printing' }
CMParameter >> printOn: aStream [

	super printOn: aStream.
	aStream
		<< $(
		<< receiverClass class name
		<< ' >> '
		<< self name
		<< ' = '
		<< self value asString
		<< $).
]

{ #category : 'accessing' }
CMParameter >> receiverClass [

	^ receiverClass 
]

{ #category : 'accessing' }
CMParameter >> setterMethod [

	^ setterMethod
]

{ #category : 'evaluating' }
CMParameter >> value [

	^ getterMethod valueWithReceiver: receiverClass
]

{ #category : 'evaluating' }
CMParameter >> value: anObject [
	"Set value of a parameter on receiver class and all its subclasses"
	
	receiverClass withAllSubclasses do: [ :aClass |
		setterMethod valueWithReceiver: aClass arguments: { anObject } ]
]
