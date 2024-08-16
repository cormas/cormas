Class {
	#name : 'CMSensitivityAnalysisMonteCarloSettingPresenter',
	#superclass : 'CMSensitivityAnalysisSettingPresenter',
	#instVars : [
		'lowValueInput',
		'highValueInput',
		'numberOfValuesInput'
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
		yourself.
]

{ #category : 'initialization' }
CMSensitivityAnalysisMonteCarloSettingPresenter >> initializePresenters [ 

	lowValueInput := self newNumberInput.
	highValueInput := self newNumberInput.
	numberOfValuesInput := self newNumberInput.
]
