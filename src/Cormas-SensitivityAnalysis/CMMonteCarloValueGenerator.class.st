Class {
	#name : 'CMMonteCarloValueGenerator',
	#superclass : 'CMParameterValueGenerator',
	#traits : 'TCMRandom',
	#classTraits : 'TCMRandom classTrait',
	#instVars : [
		'context',
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
	
	self flag: 'TODO'.
	"A temporary hack to use TCMRandom and make the test pass"
	context := CMSimulationContext new.
	self beFloat.
]

{ #category : 'testing' }
CMMonteCarloValueGenerator >> isInteger [

	^ isInteger 
]

{ #category : 'as yet unclassified' }
CMMonteCarloValueGenerator >> simulationContext [

	^ context
]
