Class {
	#name : 'CMMonteCarloValueGenerator',
	#superclass : 'CMParameterValueGenerator',
	#traits : 'TCMRandom',
	#classTraits : 'TCMRandom classTrait',
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

{ #category : 'generation' }
CMMonteCarloValueGenerator >> generate [

	^ (1 to: numberOfValues) collect: [ :i |
		self randomBetween: lowValue and: highValue ].
]

{ #category : 'initialization' }
CMMonteCarloValueGenerator >> initialize [

	super initialize.
	randomNumberGenerator := PMFishmanMooreRandomGenerator new.
]
