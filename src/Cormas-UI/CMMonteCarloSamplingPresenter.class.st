Class {
	#name : 'CMMonteCarloSamplingPresenter',
	#superclass : 'CMNumericalSamplingPresenter',
	#instVars : [
		'numberOfValuesInput'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'initialization' }
CMMonteCarloSamplingPresenter >> connectPresenters [

	super connectPresenters.
	
	numberOfValuesInput whenNumberChangedDo: [ :number |
		sampler numberOfValues: number.
		whenChangedBlock value ].
]

{ #category : 'layout' }
CMMonteCarloSamplingPresenter >> defaultLayout [

	^ SpGridLayout new
		borderWidth: 0;
		beColumnNotHomogeneous;
		column: 2 expand: true;
		build: [ :builder | builder
			add: 'From';
			add: lowNumberInput;
			nextRow;
			add: 'To';
			add: highNumberInput;
			nextRow;
			add: 'Size';
			add: numberOfValuesInput;
			nextRow ];
		yourself
]

{ #category : 'as yet unclassified' }
CMMonteCarloSamplingPresenter >> exampleFloat [
	<script: 'self exampleFloat'>
]

{ #category : 'as yet unclassified' }
CMMonteCarloSamplingPresenter >> exampleInteger [
	<script: 'self exampleInteger'>
]

{ #category : 'initialization' }
CMMonteCarloSamplingPresenter >> initializeNumberInputs [

	super initializeNumberInputs.
	numberOfValuesInput := self newNumberInput
]

{ #category : 'accessing' }
CMMonteCarloSamplingPresenter >> initializeSampler [

	super initializeSampler.
	sampler numberOfValues: 10.
	sampler isInteger: parameter isIntegerParameter
]

{ #category : 'as yet unclassified' }
CMMonteCarloSamplingPresenter >> samplerClass [

	^ CMMonteCarloSamplingMethod
]

{ #category : 'accessing' }
CMMonteCarloSamplingPresenter >> showValues [

	super showValues.
	numberOfValuesInput number: sampler numberOfValues
]
