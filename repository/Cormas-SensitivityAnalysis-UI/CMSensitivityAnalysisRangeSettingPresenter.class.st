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
CMSensitivityAnalysisRangeSettingPresenter >> initialize [

	super initialize.
	generator := CMRangeValueGenerator new.
]

{ #category : 'initialization' }
CMSensitivityAnalysisRangeSettingPresenter >> initializePresenters [ 

	lowValueInput := self newNumberInput.
	highValueInput := self newNumberInput.
	
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
		
	numberOfValuesInput := self newNumberInput
		beInteger;
		minimum: 1;
		number: 1;
		whenNumberChangedDo: [ :number |
			number > 0 ifTrue: [
				generator
					lowValue: lowValueInput number;
					highValue: highValueInput number;
					numberOfValues: number.
				
				stepInput number: generator step asFloat ] ];
		yourself.
]

{ #category : 'accessing' }
CMSensitivityAnalysisRangeSettingPresenter >> values [

	^ generator generate
]
