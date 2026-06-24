Class {
	#name : 'CMNumericalSamplingPresenter',
	#superclass : 'CMSamplingPresenter',
	#instVars : [
		'lowNumberInput',
		'highNumberInput'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'as yet unclassified' }
CMNumericalSamplingPresenter class >> exampleFloat [

	(self on: CMParameterFixture parameterFloatMinMaxStep) open
]

{ #category : 'as yet unclassified' }
CMNumericalSamplingPresenter class >> exampleInteger [

	(self on: CMParameterFixture parameterIntMinMaxStep) open
]

{ #category : 'initialization' }
CMNumericalSamplingPresenter >> connectPresenters [

	lowNumberInput whenNumberChangedDo: [ :number |
		sampler lowValue: number.
		whenChangedBlock value ].
	
	highNumberInput whenNumberChangedDo: [ :number |
		sampler highValue: number.
		whenChangedBlock value ].
]

{ #category : 'initialization' }
CMNumericalSamplingPresenter >> initializeNumberInputs [

	lowNumberInput := self newNumberInput.
	highNumberInput := self newNumberInput.
]

{ #category : 'initialization' }
CMNumericalSamplingPresenter >> initializePresenters [

	self initializeNumberInputs.
	self initializeSampler.
	self showValues
]

{ #category : 'initialization' }
CMNumericalSamplingPresenter >> initializeSampler [

	sampler := self samplerClass new
		lowValue: (parameter minValue ifNil: [ 0 ]);
		highValue: (parameter maxValue ifNil: [ 10 ]);
		yourself
]

{ #category : 'as yet unclassified' }
CMNumericalSamplingPresenter >> samplerClass [

	self subclassResponsibility
]

{ #category : 'accessing' }
CMNumericalSamplingPresenter >> showValues [

	lowNumberInput number: sampler lowValue.
	highNumberInput number: sampler highValue
]
