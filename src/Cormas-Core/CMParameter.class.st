Class {
	#name : 'CMParameter',
	#superclass : 'Object',
	#instVars : [
		'getterSelector',
		'setterSelector',
		'receiver'
	],
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}

{ #category : 'instance creation' }
CMParameter class >> getterSelector: aGetterSelector setterSelector: aSetterSelector receiver: anObject [

	^ self new
		initailizeGetterSelector: aGetterSelector
		setterSelector: aSetterSelector
		receiver: anObject;
		yourself
]

{ #category : 'comparing' }
CMParameter >> = anObject [

	anObject class = self class
		ifFalse: [ ^ false ].
		
	^ anObject receiver = receiver
		and: [ anObject getterSelector = getterSelector
			and: [ anObject setterSelector = setterSelector ] ]
]

{ #category : 'accessing' }
CMParameter >> getterSelector [

	^ getterSelector
]

{ #category : 'comparing' }
CMParameter >> hash [
		
	^ receiver hash bitXor: (getterSelector hash bitXor: setterSelector hash)
]

{ #category : 'initialization' }
CMParameter >> initailizeGetterSelector: aGetterSelector setterSelector: aSetterSelector receiver: anObject [
	
	getterSelector := aGetterSelector.
	setterSelector := aSetterSelector.
	receiver := anObject.
]

{ #category : 'accessing' }
CMParameter >> name [

	^ setterSelector allButLast
]

{ #category : 'printing' }
CMParameter >> printOn: aStream [

	super printOn: aStream.
	aStream
		<< $(
		<< receiver class name
		<< ' >> '
		<< self name
		<< ' = '
		<< self value asString
		<< $).
]

{ #category : 'accessing' }
CMParameter >> receiver [

	^ receiver 
]

{ #category : 'accessing' }
CMParameter >> setterSelector [

	^ setterSelector
]

{ #category : 'evaluating' }
CMParameter >> value [

	^ receiver perform: getterSelector
]

{ #category : 'evaluating' }
CMParameter >> value: anObject [
	"Set value of a parameter on receiver class and all its subclasses"
	
	receiver withAllSubclasses do: [ :aClass |
		aClass perform: setterSelector with: anObject ]
]
