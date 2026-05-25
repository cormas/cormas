Class {
	#name : 'CMNumberParameter',
	#superclass : 'CMParameter',
	#instVars : [
		'minValue',
		'maxValue',
		'step'
	],
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}

{ #category : 'instance creation' }
CMNumberParameter class >> newFromPragmaMinMaxDefault: aPragma [

	^ (self preBuildFromPragma: aPragma)
		minValue: aPragma arguments first;
		maxValue: aPragma arguments second;
		defaultValue: aPragma arguments third;
		yourself
]

{ #category : 'instance creation' }
CMNumberParameter class >> newFromPragmaMinMaxStepDefault: aPragma [

	^ (self preBuildFromPragma: aPragma)
		minValue: aPragma arguments first;
		maxValue: aPragma arguments second;
		step: aPragma arguments third;
		defaultValue: aPragma arguments fourth;
		yourself
]

{ #category : 'instance creation' }
CMNumberParameter class >> newFromPragmaNamedMinMaxDefault: aPragma [

	^ (self preBuildFromPragma: aPragma)
		customName: aPragma arguments first;
		minValue: aPragma arguments second;
		maxValue: aPragma arguments third;
		defaultValue: aPragma arguments fourth;
		yourself
]

{ #category : 'instance creation' }
CMNumberParameter class >> newFromPragmaNamedMinMaxStepDefault: aPragma [

	^ (self preBuildFromPragma: aPragma)
		customName: aPragma arguments first;
		minValue: aPragma arguments second;
		maxValue: aPragma arguments third;
		step: aPragma arguments fourth;
		defaultValue: aPragma arguments fifth;
		yourself
]

{ #category : 'testing' }
CMNumberParameter >> isValidValue: aValue [

	| steps |

	aValue isNumber ifFalse: [ ^ false ].
	
	minValue ifNotNil: [ aValue < minValue ifTrue: [ ^ false ] ].
	maxValue ifNotNil: [ aValue > maxValue ifTrue: [ ^ false ] ].
	
	step ifNotNil: [ 
		steps := (aValue - minValue) / step.
		((steps - steps rounded) abs closeTo: 0) ifFalse: [ ^ false ] ].
	
	^ true
]

{ #category : 'accessing' }
CMNumberParameter >> maxValue [

	^ maxValue
]

{ #category : 'accessing' }
CMNumberParameter >> maxValue: anObject [

	maxValue := anObject
]

{ #category : 'accessing' }
CMNumberParameter >> minValue [

	^ minValue
]

{ #category : 'accessing' }
CMNumberParameter >> minValue: anObject [

	minValue := anObject
]

{ #category : 'accessing' }
CMNumberParameter >> step [

	^ step
]

{ #category : 'accessing' }
CMNumberParameter >> step: anObject [

	step := anObject
]
