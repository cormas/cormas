Class {
	#name : 'CMEnumParameter',
	#superclass : 'CMParameter',
	#instVars : [
		'values'
	],
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}

{ #category : 'instance creation' }
CMEnumParameter class >> newFromPragmaNamedValuesDefault: aPragma [

	^ (self preBuildFromPragma: aPragma)
		customName: aPragma arguments first;
		values: aPragma arguments second;
		defaultValue: aPragma arguments third;
		yourself
]

{ #category : 'instance creation' }
CMEnumParameter class >> newFromPragmaValuesDefault: aPragma [

	^ (self preBuildFromPragma: aPragma)
		values: aPragma arguments first;
		defaultValue: aPragma arguments second;
		yourself
]

{ #category : 'as yet unclassified' }
CMEnumParameter class >> pragmaDict [

	^ Dictionary newFrom: { 
		#parameterValues:default: -> #newFromPragmaValuesDefault: .
		#parameter:values:default: -> #newFromPragmaNamedValuesDefault: }
]

{ #category : 'testing' }
CMEnumParameter >> isValidValue: aValue [

	^ aValue isSymbol and: [ values includes: aValue ]
]

{ #category : 'accessing' }
CMEnumParameter >> values [

	^ values
]

{ #category : 'accessing' }
CMEnumParameter >> values: anObject [

	values := anObject
]
