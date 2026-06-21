Class {
	#name : 'CMSampling',
	#superclass : 'Object',
	#instVars : [
		'lowValue',
		'highValue',
		'numberOfValues'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'as yet unclassified' }
CMSampling class >> samplingName [

	^ self name
]

{ #category : 'translating' }
CMSampling >> generate [

	self subclassResponsibility
]

{ #category : 'accessing' }
CMSampling >> highValue [

	^ highValue
]

{ #category : 'accessing' }
CMSampling >> highValue: aHighValue [

	highValue := aHighValue
]

{ #category : 'initialization' }
CMSampling >> initialize [

	super initialize.
	lowValue := 0.
	highValue := 0
]

{ #category : 'accessing' }
CMSampling >> lowValue [

	^ lowValue
]

{ #category : 'accessing' }
CMSampling >> lowValue: aLowValue [

	lowValue := aLowValue
]

{ #category : 'accessing' }
CMSampling >> numberOfValues [

	^ numberOfValues
]

{ #category : 'accessing' }
CMSampling >> numberOfValues: aNumber [

	(aNumber isInteger and: [ aNumber >= 0 ])
		ifFalse: [ self error: 'Number of values must be a non-negative integer' ].
		
	numberOfValues := aNumber.
]
