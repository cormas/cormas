Class {
	#name : 'CMPredefinedListValueGenerator',
	#superclass : 'CMParameterValueGenerator',
	#instVars : [
		'values'
	],
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

{ #category : 'translating' }
CMPredefinedListValueGenerator >> generate [

	^ values
]

{ #category : 'accessing' }
CMPredefinedListValueGenerator >> numberOfValues [

	^ values size
]

{ #category : 'accessing' }
CMPredefinedListValueGenerator >> values: aCollection [

	values := aCollection
]
