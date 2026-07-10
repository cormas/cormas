Class {
	#name : 'CMRangeSamplingMethod',
	#superclass : 'CMNumericalSamplingMethod',
	#instVars : [
		'step'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'as yet unclassified' }
CMRangeSamplingMethod class >> samplingName [
	
	^ 'Range'
]

{ #category : 'as yet unclassified' }
CMRangeSamplingMethod class >> samplingPresenterFor: aParameter [

	^ CMRangeSamplingPresenter 
]

{ #category : 'translating' }
CMRangeSamplingMethod >> generate [

	| currentValue |
	currentValue := lowValue - step.

	^ (1 to: self numberOfValues) collect: [ :i |
		currentValue := currentValue + step.
		currentValue ]
]

{ #category : 'accessing' }
CMRangeSamplingMethod >> numberOfValues [

	^ ((highValue - lowValue) / step) floor + 1
]

{ #category : 'printing' }
CMRangeSamplingMethod >> printOn: aStream [

	aStream
		<< self numberOfValues asString 
		<< ' numbers from '
		<< lowValue asString
		<< ' to '
		<< highValue asString
		<< ' by '
		<< step asString
]

{ #category : 'accessing' }
CMRangeSamplingMethod >> step [

	^ step
]

{ #category : 'accessing' }
CMRangeSamplingMethod >> step: aNumber [

	step := aNumber
]
