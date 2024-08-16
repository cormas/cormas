Class {
	#name : 'CMSensitivityAnalysisPredefinedListSettingPresenter',
	#superclass : 'CMSensitivityAnalysisSettingPresenter',
	#instVars : [
		'textInput'
	],
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisPredefinedListSettingPresenter class >> example [
	<example>
	| translator |
	translator := CMEnglishTranslator new.
	
	(self on: translator) open
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisPredefinedListSettingPresenter class >> nameForTranslator: aTranslator [

	^ aTranslator tPredefinedList
]

{ #category : 'layout' }
CMSensitivityAnalysisPredefinedListSettingPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: textInput;
		yourself.
]

{ #category : 'initialization' }
CMSensitivityAnalysisPredefinedListSettingPresenter >> initializePresenters [

	textInput := self newTextInput.
]
