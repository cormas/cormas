Class {
	#name : 'CMNumericalSamplingMethod',
	#superclass : 'CMSamplingMethod',
	#instVars : [
		'lowValue',
		'highValue'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'accessing' }
CMNumericalSamplingMethod >> highValue [

	^ highValue
]

{ #category : 'accessing' }
CMNumericalSamplingMethod >> highValue: aHighValue [

	highValue := aHighValue
]

{ #category : 'initialization' }
CMNumericalSamplingMethod >> initialize [

	super initialize.
	lowValue := 0.
	highValue := 0
]

{ #category : 'accessing' }
CMNumericalSamplingMethod >> lowValue [

	^ lowValue
]

{ #category : 'accessing' }
CMNumericalSamplingMethod >> lowValue: aLowValue [

	lowValue := aLowValue
]
