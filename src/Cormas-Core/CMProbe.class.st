Class {
	#name : #CMProbe,
	#superclass : #Object,
	#instVars : [
		'name',
		'object',
		'isActive',
		'colorString',
		'selector'
	],
	#category : #'Cormas-Core-Analysis'
}

{ #category : #'as yet unclassified' }
CMProbe class >> name: aString colorString: aColorString selector: aSymbol on: anObject [

	^ self new
		name: aString;
		colorString: aColorString;
		selector: aSymbol;
		object: anObject;
		yourself
]

{ #category : #comparing }
CMProbe >> = anObject [
	"for tessting"
	
	anObject class = self class ifFalse: [ ^ false ].
		
	anObject name = name ifFalse: [ ^ false ].
	anObject selector = selector ifFalse: [ ^ false ].
	anObject object = object ifFalse: [ ^ false ].
	anObject isActive = isActive ifFalse: [ ^ false ].
	anObject colorString = colorString ifFalse: [ ^ false ].
	
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
		  (selector hash bitXor:
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
	aStream << $( << name << object asString << isActive asString << selector asString << colorString << $)
]

{ #category : #accessing }
CMProbe >> selector [

	^ selector
]

{ #category : #accessing }
CMProbe >> selector: aSymbol [

	selector := aSymbol
]

{ #category : #evaluating }
CMProbe >> value [

	^ object perform: selector
]
