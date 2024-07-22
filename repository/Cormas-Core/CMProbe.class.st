Class {
	#name : 'CMProbe',
	#superclass : 'Object',
	#instVars : [
		'name',
		'object',
		'isActive',
		'method'
	],
	#category : 'Cormas-Core-Kernel',
	#package : 'Cormas-Core',
	#tag : 'Kernel'
}

{ #category : 'as yet unclassified' }
CMProbe class >> name: aString method: aCompiledMethod on: anObject [

	^ self new
		name: aString;
		method: aCompiledMethod;
		object: anObject;
		yourself
]

{ #category : 'initialization' }
CMProbe >> initialize [

	super initialize.
	isActive := true.
]

{ #category : 'accessing' }
CMProbe >> isActive [

	^ isActive
]

{ #category : 'accessing' }
CMProbe >> isActive: anObject [

	isActive := anObject
]

{ #category : 'accessing' }
CMProbe >> method: aCompiledMethod [

	method := aCompiledMethod
]

{ #category : 'accessing' }
CMProbe >> name [

	^ name
]

{ #category : 'accessing' }
CMProbe >> name: aString [

	name := aString
]

{ #category : 'accessing' }
CMProbe >> object: anObject [

	object := anObject
]

{ #category : 'printing' }
CMProbe >> printOn: aStream [

	super printOn: aStream.
	aStream << $( << name << $)
]

{ #category : 'evaluating' }
CMProbe >> value [

	^ method valueWithReceiver: object
]
