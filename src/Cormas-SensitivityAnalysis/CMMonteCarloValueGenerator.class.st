Class {
	#name : 'CMMonteCarloValueGenerator',
	#superclass : 'CMParameterValueGenerator',
	#traits : 'TCMRandom',
	#classTraits : 'TCMRandom classTrait',
	#instVars : [
		'isInteger'
	],
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

{ #category : 'accessing' }
CMMonteCarloValueGenerator >> beFloat [

	isInteger := false
]

{ #category : 'accessing' }
CMMonteCarloValueGenerator >> beInteger [

	isInteger := true
]

{ #category : 'generation' }
CMMonteCarloValueGenerator >> generate [

	| values |

	values := (1 to: numberOfValues) collect: [ :i |
		self randomBetween: lowValue and: highValue ].
	
	isInteger ifTrue: [ values := values collect: #rounded ].
	^ values sorted
]

{ #category : 'initialization' }
CMMonteCarloValueGenerator >> initialize [

	super initialize.
	randomNumberGenerator := PMFishmanMooreRandomGenerator new.
	self beFloat.
]

{ #category : 'testing' }
CMMonteCarloValueGenerator >> isInteger [

	^ isInteger 
]
