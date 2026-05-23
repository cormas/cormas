Class {
	#name : 'CMBooleanParameter',
	#superclass : 'CMParameter',
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}

{ #category : 'as yet unclassified' }
CMBooleanParameter class >> pragmaDict [

	^ Dictionary newFrom: { 
		#parameterBooleanDefault: -> #newFromPragmaDefault: .
		#parameterBoolean:default: -> #newFromPragmaNamedDefault: }
]

{ #category : 'testing' }
CMBooleanParameter >> isValidValue: aValue [

	^ #(true false) includes: aValue 
]
