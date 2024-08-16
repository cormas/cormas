Class {
	#name : 'CMMonteCarloValueGenerator',
	#superclass : 'CMParameterValueGenerator',
	#traits : 'TCMRandom',
	#classTraits : 'TCMRandom classTrait',
	#instVars : [
		'lowValue',
		'highValue',
		'numberOfValues'
	],
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

{ #category : 'instance creation' }
CMMonteCarloValueGenerator >> from: aLowValue to: aHighValue numberOfValues: aNumber [

	lowValue := aLowValue.
	highValue := aHighValue.
	numberOfValues := aNumber
]

{ #category : 'instance creation' }
CMMonteCarloValueGenerator >> generate [

	^ (1 to: numberOfValues) collect: [ :i |
		self randomBetween: lowValue and: highValue ].
]

{ #category : 'initialization' }
CMMonteCarloValueGenerator >> initialize [

	super initialize.
	randomNumberGenerator := PMFishmanMooreRandomGenerator new.
]

{ #category : 'accessing' }
CMMonteCarloValueGenerator >> numberOfValues [

	^ numberOfValues
]
