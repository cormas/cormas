Class {
	#name : 'CMFloatParameter',
	#superclass : 'CMNumberParameter',
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}

{ #category : 'as yet unclassified' }
CMFloatParameter class >> pragmaDict [

	^ Dictionary newFrom: { 
		#parameterFloatDefault: -> #newFromPragmaDefault: .
		#parameterFloatMin:max:default: -> #newFromPragmaMinMaxDefault: .
		#parameterFloatMin:max:step:default: -> #newFromPragmaMinMaxStepDefault: .
		#parameterFloat:default: -> #newFromPragmaNamedDefault: .
		#parameterFloat:min:max:default: -> #newFromPragmaNamedMinMaxDefault: .
		#parameterFloat:min:max:step:default: -> #newFromPragmaNamedMinMaxStepDefault: }
]

{ #category : 'testing' }
CMFloatParameter >> isFloatParameter [

	^ true
]

{ #category : 'testing' }
CMFloatParameter >> isValidValue: aValue [

	^ (super isValidValue: aValue) and: [ aValue isNumber ]
	
	
]
