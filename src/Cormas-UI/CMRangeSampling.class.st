Class {
	#name : 'CMRangeSampling',
	#superclass : 'CMSampling',
	#instVars : [
		'step'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'as yet unclassified' }
CMRangeSampling class >> samplingName [
	
	^ 'Range'
]

{ #category : 'translating' }
CMRangeSampling >> generate [

	| currentValue |
	currentValue := lowValue - step.

	^ (1 to: numberOfValues) collect: [ :i |
		currentValue := currentValue + step.
		currentValue ]
]

{ #category : 'accessing' }
CMRangeSampling >> highValue: aNumber [

	super highValue: aNumber.
	
	(step isNil or: [ step = 0 or: [ lowValue = aNumber ] ]) ifFalse: [ 
		self inferNumberOfValues ].
]

{ #category : 'accessing' }
CMRangeSampling >> inferNumberOfValues [

	numberOfValues := ((highValue - lowValue) / step) floor
]

{ #category : 'accessing' }
CMRangeSampling >> lowValue: aNumber [

	super lowValue: aNumber.
	
	(step isNil or: [ step = 0 or: [ highValue = aNumber ] ]) ifFalse: [ 
		self inferNumberOfValues ].
]

{ #category : 'accessing' }
CMRangeSampling >> numberOfValues: aNumber [

	super numberOfValues: aNumber.
	
	(numberOfValues isNil or: [ numberOfValues = 0 ]) ifFalse: [
		step := (highValue - lowValue) / numberOfValues ].
]

{ #category : 'accessing' }
CMRangeSampling >> step [

	^ step
]

{ #category : 'accessing' }
CMRangeSampling >> step: aStep [

	step := aStep.
	
	(step isNil or: [ step = 0 ]) ifFalse: [ 
		 self inferNumberOfValues ].
]
