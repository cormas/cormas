Class {
	#name : 'CMProbe',
	#superclass : 'Object',
	#instVars : [
		'name',
		'object',
		'isActive',
		'method',
		'color'
	],
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}

{ #category : 'as yet unclassified' }
CMProbe class >> name: aString color: aColor method: aCompiledMethod on: anObject [

	^ self new
		name: aString;
		color: aColor;
		method: aCompiledMethod;
		object: anObject;
		yourself
]

{ #category : 'comparing' }
CMProbe >> = anObject [
	"for tessting"

	anObject class = self class ifFalse: [ ^ false ].
		
	anObject name = name ifFalse: [ ^ false ].
	anObject method = method ifFalse: [ ^ false ].
	anObject object = object ifFalse: [ ^ false ].
	anObject isActive = isActive ifFalse: [ ^ false ].
	anObject color = color ifFalse: [ ^ false ].
	
	^ true
]

{ #category : 'accessing' }
CMProbe >> color [

	^ color
]

{ #category : 'accessing' }
CMProbe >> color: aColor [

	color := aColor
]

{ #category : 'comparing' }
CMProbe >> hash [
	"for tessting"

	^ name hash bitXor:
		  (method hash bitXor:
				(object hash bitXor:
					(isActive hash bitXor: color hash))) 
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
CMProbe >> method [

	^ method
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
CMProbe >> object [

	^ object
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
