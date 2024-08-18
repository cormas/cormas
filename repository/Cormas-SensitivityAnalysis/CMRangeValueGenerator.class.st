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
CMRangeValueGenerator >> numberOfValues: aNumber [

	super numberOfValues: aNumber.
	step := (highValue - lowValue) / numberOfValues.
]

{ #category : 'accessing' }
CMRangeValueGenerator >> step [

	^ step
]

{ #category : 'accessing' }
CMRangeValueGenerator >> step: aStep [

	step := aStep.
	
	numberOfValues := ((highValue - lowValue) / step) floor.
]
