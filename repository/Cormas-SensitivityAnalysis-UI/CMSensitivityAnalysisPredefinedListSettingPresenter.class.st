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
CMSensitivityAnalysisPredefinedListSettingPresenter >> initialize [

	super initialize.
	generator := CMPredefinedListValueGeneratorTest new.
]

{ #category : 'initialization' }
CMSensitivityAnalysisPredefinedListSettingPresenter >> initializePresenters [

	textInput := self newTextInput
		placeholder: '1, 2, 3, ...';
		yourself.
]

{ #category : 'accessing' }
CMSensitivityAnalysisPredefinedListSettingPresenter >> values [

	| values |
	textInput text ifEmpty: [ self inform: 'The list is empty!' ].
	
	[ values := (textInput text splitOn: $,) collect: #trimmed ] onErrorDo: [ 
		self inform: 'Could not parse the input' ].
	
	[ values := values collect: #asNumber ] onErrorDo: [ "nothing" ].
	^ values
]
