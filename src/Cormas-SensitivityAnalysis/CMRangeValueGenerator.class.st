Class {
	#name : 'CMRangeValueGenerator',
	#superclass : 'CMParameterValueGenerator',
	#instVars : [
		'step'
	],
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

{ #category : 'translating' }
CMRangeValueGenerator >> generate [

	| currentValue |
	currentValue := lowValue - step.

	^ (1 to: numberOfValues) collect: [ :i |
		currentValue := currentValue + step.
		currentValue ]
]

{ #category : 'accessing' }
CMRangeValueGenerator >> highValue: aNumber [

	super highValue: aNumber.
	
	(step isNil or: [ step = 0 or: [ lowValue = aNumber ] ]) ifFalse: [ 
		self inferNumberOfValues ].
]

{ #category : 'accessing' }
CMRangeValueGenerator >> inferNumberOfValues [

	numberOfValues := ((highValue - lowValue) / step) floor
]

{ #category : 'accessing' }
CMRangeValueGenerator >> lowValue: aNumber [

	super lowValue: aNumber.
	
	(step isNil or: [ step = 0 or: [ highValue = aNumber ] ]) ifFalse: [ 
		self inferNumberOfValues ].
]

{ #category : 'accessing' }
CMRangeValueGenerator >> numberOfValues: aNumber [

	super numberOfValues: aNumber.
	
	(numberOfValues isNil or: [ numberOfValues = 0 ]) ifFalse: [
		step := (highValue - lowValue) / numberOfValues ].
]

{ #category : 'accessing' }
CMRangeValueGenerator >> step [

	^ step
]

{ #category : 'accessing' }
CMRangeValueGenerator >> step: aStep [

	step := aStep.
	
	(step isNil or: [ step = 0 ]) ifFalse: [ 
		 self inferNumberOfValues ].
]
