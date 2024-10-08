Class {
	#name : 'CMSensitivityAnalysisMonteCarloSettingPresenter',
	#superclass : 'CMSensitivityAnalysisSettingPresenter',
	#instVars : [
		'lowValueInput',
		'highValueInput',
		'numberOfValuesInput',
		'integerCheckbox'
	],
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisMonteCarloSettingPresenter class >> example [
	<example>
	| translator |
	translator := CMEnglishTranslator new.
	
	(self on: translator) open
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisMonteCarloSettingPresenter class >> nameForTranslator: aTranslator [

	^ aTranslator tMonteCarlo
]

{ #category : 'layout' }
CMSensitivityAnalysisMonteCarloSettingPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		borderWidth: 2;
		spacing: 5;
		add: 'from' expand: false;
		add: lowValueInput width: 60;
		add: 'to' expand: false;
		add: highValueInput width: 60;
		add: 'size' expand: false;
		add: numberOfValuesInput width: 60;
		add: integerCheckbox;
		yourself.
]

{ #category : 'initialization' }
CMSensitivityAnalysisMonteCarloSettingPresenter >> initializePresenters [ 

	generator := CMMonteCarloValueGenerator new.

	lowValueInput := self newNumberInput.
	highValueInput := self newNumberInput.
	numberOfValuesInput := self newNumberInput.
	
	integerCheckbox := self newCheckBox
		label: translator tInteger asLowercase;
		whenActivatedDo: [ generator beInteger ];
		whenDeactivatedDo: [ generator beFloat ];
		yourself.
]

{ #category : 'accessing' }
CMSensitivityAnalysisMonteCarloSettingPresenter >> values [

	generator
		lowValue: lowValueInput number;
		highValue: highValueInput number;
		numberOfValues: numberOfValuesInput number.
		
	^ generator generate
]
