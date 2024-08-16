Class {
	#name : 'CMSensitivityAnalysisRangeSettingPresenter',
	#superclass : 'CMSensitivityAnalysisSettingPresenter',
	#instVars : [
		'lowValueInput',
		'highValueInput',
		'stepInput',
		'numberOfValuesInput'
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
		add: 'step' expand: false;
		add: stepInput width: 60;
		add: 'size' expand: false;
		add: numberOfValuesInput width: 60;
		yourself.
]

{ #category : 'initialization' }
CMSensitivityAnalysisRangeSettingPresenter >> initializePresenters [ 

	lowValueInput := self newNumberInput.
	highValueInput := self newNumberInput.
	stepInput := self newNumberInput.
	numberOfValuesInput := self newNumberInput.
]
