Class {
	#name : 'CMParameterValueGenerator',
	#superclass : 'Object',
	#instVars : [
		'lowValue',
		'highValue',
		'numberOfValues'
	],
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

{ #category : 'translating' }
CMParameterValueGenerator >> generate [

	self subclassResponsibility
]

{ #category : 'accessing' }
CMParameterValueGenerator >> highValue [

	^ highValue
]

{ #category : 'accessing' }
CMParameterValueGenerator >> highValue: aHighValue [

	highValue := aHighValue
]

{ #category : 'initialization' }
CMParameterValueGenerator >> initialize [

	super initialize.
	lowValue := 0.
	highValue := 0
]

{ #category : 'accessing' }
CMParameterValueGenerator >> lowValue [

	^ lowValue
]

{ #category : 'accessing' }
CMParameterValueGenerator >> lowValue: aLowValue [

	lowValue := aLowValue
]

{ #category : 'accessing' }
CMParameterValueGenerator >> numberOfValues [

	^ numberOfValues
]

{ #category : 'accessing' }
CMParameterValueGenerator >> numberOfValues: aNumber [

	(aNumber isInteger and: [ aNumber >= 0 ])
		ifFalse: [ self error: 'Number of values must be a non-negative integer' ].
		
	numberOfValues := aNumber.
]
