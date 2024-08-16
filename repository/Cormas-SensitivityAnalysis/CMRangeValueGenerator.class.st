Class {
	#name : 'CMRangeValueGenerator',
	#superclass : 'CMParameterValueGenerator',
	#instVars : [
		'lowValue',
		'highValue',
		'numberOfValues',
		'step'
	],
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

{ #category : 'instance creation' }
CMRangeValueGenerator >> from: aLowValue to: aHighValue numberOfValues: aNumber [

	lowValue := aLowValue.
	highValue := aHighValue.
	numberOfValues := aNumber.
	
	step := (highValue - lowValue) / numberOfValues.
]

{ #category : 'instance creation' }
CMRangeValueGenerator >> from: aLowValue to: aHighValue step: aStep [

	lowValue := aLowValue.
	highValue := aHighValue.
	step := aStep.
	
	numberOfValues := ((highValue - lowValue) / step) floor.
]

{ #category : 'translating' }
CMRangeValueGenerator >> generate [

	| currentValue |
	currentValue := lowValue - step.

	^ (1 to: numberOfValues) collect: [ :i |
		currentValue := currentValue + step.
		currentValue ]
]

{ #category : 'accessing' }
CMRangeValueGenerator >> numberOfValues [

	^ numberOfValues
]

{ #category : 'accessing' }
CMRangeValueGenerator >> step [

	^ step
]
