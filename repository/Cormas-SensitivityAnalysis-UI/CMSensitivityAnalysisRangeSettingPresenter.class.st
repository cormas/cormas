Class {
	#name : 'CMSensitivityAnalysisRangeSettingPresenter',
	#superclass : 'CMSensitivityAnalysisSettingPresenter',
	#instVars : [
		'lowValueInput',
		'highValueInput',
		'numberOfValuesInput',
		'stepInput'
	],
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisRangeSettingPresenter class >> example [
	<example>
	| translator |
	translator := CMEnglishTranslator new.
	
	(self on: translator) open
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisRangeSettingPresenter class >> nameForTranslator: aTranslator [

	^ aTranslator tRange
]

{ #category : 'layout' }
CMSensitivityAnalysisRangeSettingPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		borderWidth: 2;
		spacing: 5;
		add: 'from' expand: false;
		add: lowValueInput width: 60;
		add: 'to' expand: false;
		add: highValueInput width: 60;
		add: 'size' expand: false;
		add: numberOfValuesInput width: 60;
		add: 'step' expand: false;
		add: stepInput width: 60;
		yourself.
]

{ #category : 'initialization' }
CMSensitivityAnalysisRangeSettingPresenter >> initializeHighValueInput [

	highValueInput := self newNumberInput
		number: generator highValue;
		whenNumberChangedDo: [ :number | generator highValue: number ];
		yourself.
]

{ #category : 'initialization' }
CMSensitivityAnalysisRangeSettingPresenter >> initializeLowValueInput [

	lowValueInput := self newNumberInput
		number: generator lowValue;
		whenNumberChangedDo: [ :number | generator lowValue: number ];
		yourself.
]

{ #category : 'initialization' }
CMSensitivityAnalysisRangeSettingPresenter >> initializeNumberOfValuesInput [

	numberOfValuesInput := self newNumberInput
		beInteger;
		minimum: 1;
		number: 1;
		whenNumberChangedDo: [ :number |
			number = 0 ifFalse: [
				generator
					lowValue: lowValueInput number;
					highValue: highValueInput number;
					numberOfValues: number.
				
				stepInput number: generator step asFloat ] ];
		yourself.
]

{ #category : 'initialization' }
CMSensitivityAnalysisRangeSettingPresenter >> initializePresenters [

	generator := CMRangeValueGenerator new.
	
	self initializeLowValueInput.
	self initializeHighValueInput.
	self initializeNumberOfValuesInput.
	self initializeStepInput.
]

{ #category : 'initialization' }
CMSensitivityAnalysisRangeSettingPresenter >> initializeStepInput [

	stepInput := self newNumberInput
		number: 1;
		whenNumberChangedDo: [ :number |
			number > 0 ifTrue: [
				generator
					lowValue: lowValueInput number;
					highValue: highValueInput number;
					step: number.
				
				numberOfValuesInput number: generator numberOfValues ] ];
		yourself.
]

{ #category : 'accessing' }
CMSensitivityAnalysisRangeSettingPresenter >> values [

	^ generator generate
]
