Class {
	#name : 'CMMonteCarloSampling',
	#superclass : 'CMSampling',
	#traits : 'TCMRandom',
	#classTraits : 'TCMRandom classTrait',
	#instVars : [
		'context',
		'isInteger'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'as yet unclassified' }
CMMonteCarloSampling class >> samplingName [
	
	^ 'Monte Carlo'
]

{ #category : 'generation' }
CMMonteCarloSampling >> generate [

	| values |

	values := (1 to: numberOfValues) collect: [ :i |
		self randomBetween: lowValue and: highValue ].
	
	isInteger ifTrue: [ values := values collect: #rounded ].
	^ values sorted
]

{ #category : 'initialization' }
CMMonteCarloSampling >> initialize [

	super initialize.
	
	self flag: 'TODO'.
	"A temporary hack to use TCMRandom and make the test pass"
	context := CMSimulationContext new.
	isInteger := false
]

{ #category : 'testing' }
CMMonteCarloSampling >> isInteger [

	^ isInteger 
]

{ #category : 'accessing' }
CMMonteCarloSampling >> isInteger: aBoolean [

	isInteger := aBoolean 
]

{ #category : 'printing' }
CMMonteCarloSampling >> printOn: aStream [

	aStream
		<< numberOfValues asString
		<< ' random '
		<< (isInteger ifTrue: [ 'integers' ] ifFalse: [ 'floats' ])
		<< ' from '
		<< lowValue asString
		<< ' to '
		<< highValue asString
]

{ #category : 'as yet unclassified' }
CMMonteCarloSampling >> simulationContext [

	^ context
]
