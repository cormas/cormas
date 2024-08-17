Class {
	#name : 'CMSensitivityAnalysisParameterRowPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'cormasModel',
		'translator',
		'classDropList',
		'parameterDropList',
		'strategyDropList',
		'settingsPresenter',
		'inspectButton',
		'deleteButton'
	],
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'default values' }
CMSensitivityAnalysisParameterRowPresenter class >> classDropListWidth [

	^ 180
]

{ #category : 'examples' }
CMSensitivityAnalysisParameterRowPresenter class >> example [
	<example>
	| model translator |
	
	model := CMMockModel new.
	translator := CMEnglishTranslator new.
	
	(self forModel: model translator: translator) open
]

{ #category : 'instance creation' }
CMSensitivityAnalysisParameterRowPresenter class >> forModel: aCormasModel translator: aTranslator [

	^ self on: { aCormasModel . aTranslator }
]

{ #category : 'default values' }
CMSensitivityAnalysisParameterRowPresenter class >> parameterDropListWidth [

	^ 200
]

{ #category : 'default values' }
CMSensitivityAnalysisParameterRowPresenter class >> strategyDropListWidth [

	^ 150
]

{ #category : 'layout' }
CMSensitivityAnalysisParameterRowPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		spacing: 5;
		borderWidth: 2;
		add: classDropList width: self class classDropListWidth;
		add: parameterDropList width: self class parameterDropListWidth;
		add: strategyDropList width: self class strategyDropListWidth;
		add: settingsPresenter;
		add: (SpBoxLayout newLeftToRight
			spacing: 2;
			add: inspectButton width: 30;
			add: deleteButton width: 30;
			yourself) expand: false;
		yourself.
]

{ #category : 'initialization' }
CMSensitivityAnalysisParameterRowPresenter >> initializePresenters [

	| parameterClassNames |
	
	parameterClassNames := (cormasModel parameters collect: [ :parameter |
		parameter receiverClass name ]) asSet asOrderedCollection.

	classDropList := self newDropList
		items: parameterClassNames;
		whenSelectedItemChangedDo: [ :className |
			parameterDropList items: (
				cormasModel parameters select: [ :p | p receiverClass name = className ]) ]
		yourself.
		
	parameterDropList := self newDropList
		display: [ :parameter | parameter name ];
		yourself.
		
	strategyDropList := self newDropList 
		display: [ :aClass | aClass nameForTranslator: translator ];
		items: CMSensitivityAnalysisSettingPresenter allSubclasses;
		whenSelectedItemChangedDo: [ :strategyClass |
			settingsPresenter updatePresenter ];
		yourself.
		
	settingsPresenter := self newPresenterSelector
		when: [ strategyDropList selectedItem isNotNil ]
		show: [ self instantiate: strategyDropList selectedItem on: translator ];
		defaultShow: [ self newLabel ];
		yourself. 
		
	inspectButton := self newButton
		icon: (self iconNamed: #smallInspectIt);
		action: [ settingsPresenter layout children first values inspect ];
		yourself.
		
	deleteButton := self newButton
		icon: (self iconNamed: #remove);
		action: [ owner items: (owner items copyWithout: self) ];
		yourself.
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisParameterRowPresenter >> setModelBeforeInitialization: aCollection [

	cormasModel := aCollection first.
	translator := aCollection second
]
