Class {
	#name : #CMProbe,
	#superclass : #Object,
	#instVars : [
		'name',
		'object',
		'isActive',
		'method',
		'colorString'
	],
	#category : #'Cormas-Core-Analysis'
}

{ #category : #'as yet unclassified' }
CMProbe class >> name: aString colorString: aColorString method: aCompiledMethod on: anObject [

	^ self new
		name: aString;
		colorString: aColorString;
		method: aCompiledMethod;
		object: anObject;
		yourself
]

{ #category : #comparing }
CMProbe >> = anObject [
	"for tessting"
	
	anObject class = self class ifFalse: [ ^ false ].
	'class is the same' traceCr.
		
	anObject name = name ifFalse: [ ^ false ].
	'name is the same' traceCr.
	anObject method = method ifFalse: [ ^ false ].
	'method is the same' traceCr.
	anObject object = object ifFalse: [ ^ false ].
	'object is the same' traceCr.
	anObject isActive = isActive ifFalse: [ ^ false ].
	'isActive is the same' traceCr.
	anObject colorString = colorString ifFalse: [ ^ false ].
	'colorString is the same' traceCr.
	
	^ true
]

{ #category : #accessing }
CMProbe >> colorString [

	^ colorString
]

{ #category : #accessing }
CMProbe >> colorString: aString [

	colorString := aString
]

{ #category : #comparing }
CMProbe >> hash [
	"for tessting"

	^ name hash bitXor:
		  (method hash bitXor:
				(object hash bitXor:
					(isActive hash bitXor: colorString hash))) 
]

{ #category : #initialization }
CMProbe >> initialize [

	super initialize.
	isActive := true.
]

{ #category : #accessing }
CMProbe >> isActive [

	^ isActive
]

{ #category : #accessing }
CMProbe >> isActive: anObject [

	isActive := anObject
]

{ #category : #accessing }
CMProbe >> method [

	^ method
]

{ #category : #accessing }
CMProbe >> method: aCompiledMethod [

	method := aCompiledMethod
]

{ #category : #accessing }
CMProbe >> name [

	^ name
]

{ #category : #accessing }
CMProbe >> name: aString [

	name := aString
]

{ #category : #accessing }
CMProbe >> object [

	^ object
]

{ #category : #accessing }
CMProbe >> object: anObject [

	object := anObject
]

{ #category : #printing }
CMProbe >> printOn: aStream [

	super printOn: aStream.
	aStream << $( << name << object asString << isActive asString << method asString << colorString << $)
]

{ #category : #evaluating }
CMProbe >> value [

	^ method valueWithReceiver: object
]
