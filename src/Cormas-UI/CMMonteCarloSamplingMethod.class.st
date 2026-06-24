Class {
	#name : 'CMMonteCarloSamplingMethod',
	#superclass : 'CMNumericalSamplingMethod',
	#instVars : [
		'isInteger',
		'numberOfValues'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'as yet unclassified' }
CMMonteCarloSamplingMethod class >> samplingName [
	
	^ 'Monte Carlo'
]

{ #category : 'as yet unclassified' }
CMMonteCarloSamplingMethod class >> samplingPresenterFor: aParameter [

	^ CMMonteCarloSamplingPresenter
]

{ #category : 'generation' }
CMMonteCarloSamplingMethod >> generate [

	| rand values |
	rand := Random new.

	values := (1 to: numberOfValues) collect: [ :i |
		self randomBetween: lowValue and: highValue using: rand ].
	
	isInteger ifTrue: [ values := values collect: #rounded ].
	^ values sorted
]

{ #category : 'initialization' }
CMMonteCarloSamplingMethod >> initialize [

	super initialize.
	isInteger := false
]

{ #category : 'testing' }
CMMonteCarloSamplingMethod >> isInteger [

	^ isInteger 
]

{ #category : 'accessing' }
CMMonteCarloSamplingMethod >> isInteger: aBoolean [

	isInteger := aBoolean 
]

{ #category : 'accessing' }
CMMonteCarloSamplingMethod >> numberOfValues [

	^ numberOfValues
]

{ #category : 'accessing' }
CMMonteCarloSamplingMethod >> numberOfValues: aNumber [

	(aNumber isInteger and: [ aNumber >= 0 ])
		ifFalse: [ self error: 'Number of values must be a non-negative integer' ].
		
	numberOfValues := aNumber.
]

{ #category : 'printing' }
CMMonteCarloSamplingMethod >> printOn: aStream [

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
CMMonteCarloSamplingMethod >> randomBetween: lowerBound and: higherBound using: generator [

	^ lowerBound + (generator next * (higherBound - lowerBound))
]
