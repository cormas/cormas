Class {
	#name : 'CMRangeSamplingPresenter',
	#superclass : 'CMNumericalSamplingPresenter',
	#instVars : [
		'stepInput'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'initialization' }
CMRangeSamplingPresenter >> connectPresenters [

	super connectPresenters.
	
	stepInput whenNumberChangedDo: [ :number |
		number = 0 ifFalse: [
			sampler step: number.
			whenChangedBlock value ] ].
]

{ #category : 'layout' }
CMRangeSamplingPresenter >> defaultLayout [

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
			add: 'Step';
			add: stepInput;
			nextRow ];
		yourself
]

{ #category : 'examples' }
CMRangeSamplingPresenter >> exampleFloat [
	<script: 'self exampleFloat'>
]

{ #category : 'examples' }
CMRangeSamplingPresenter >> exampleInteger [
	<script: 'self exampleInteger'>
]

{ #category : 'initialization' }
CMRangeSamplingPresenter >> initializeNumberInputs [

	super initializeNumberInputs.
	
	stepInput := self newNumberInput.
	parameter isFloatParameter ifTrue: [ stepInput beFloat ].
]

{ #category : 'initialization' }
CMRangeSamplingPresenter >> initializeSampler [

	super initializeSampler.
	sampler step: 1
]

{ #category : 'as yet unclassified' }
CMRangeSamplingPresenter >> samplerClass [

	^ CMRangeSamplingMethod
]

{ #category : 'accessing' }
CMRangeSamplingPresenter >> showValues [

	super showValues.
	stepInput number: sampler step
]
