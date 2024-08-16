Class {
	#name : 'CMParameterValueGenerator',
	#superclass : 'Object',
	#instVars : [
		'parameter'
	],
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

{ #category : 'translating' }
CMParameterValueGenerator >> generate [

	self subclassResponsibility
]

{ #category : 'accessing' }
CMParameterValueGenerator >> numberOfValues [

	self subclassResponsibility
]
