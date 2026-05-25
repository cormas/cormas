Class {
	#name : 'CMIntegerParameter',
	#superclass : 'CMNumberParameter',
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}

{ #category : 'as yet unclassified' }
CMIntegerParameter class >> pragmaDict [

	^ Dictionary newFrom: { 
		#parameterIntegerDefault: -> #newFromPragmaDefault: .
		#parameterIntegerMin:max:default: -> #newFromPragmaMinMaxDefault: .
		#parameterIntegerMin:max:step:default: -> #newFromPragmaMinMaxStepDefault: .
		#parameterInteger:default: -> #newFromPragmaNamedDefault: .
		#parameterInteger:min:max:default: -> #newFromPragmaNamedMinMaxDefault: .
		#parameterInteger:min:max:step:default: -> #newFromPragmaNamedMinMaxStepDefault: }
]

{ #category : 'testing' }
CMIntegerParameter >> isValidValue: aValue [

	^ (super isValidValue: aValue) and: [ aValue isInteger ]
	
	
]
