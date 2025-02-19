Class {
	#name : 'CMSensitivityAnalysisParameterRowPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'availableParameters',
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

{ #category : 'examples' }
CMSensitivityAnalysisParameterRowPresenter class >> example [
	<example>
	
	(self
		forParameters: CMMockModel parameters
		translator: CMEnglishTranslator new) open
]

{ #category : 'instance creation' }
CMSensitivityAnalysisParameterRowPresenter class >> forParameters: aCollectionOfParameters translator: aTranslator [

	^ self on: { aCollectionOfParameters . aTranslator }
]

{ #category : 'layout' }
CMSensitivityAnalysisParameterRowPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		spacing: 5;
		borderWidth: 2;
		add: classDropList width: 180;
		add: parameterDropList width: 200;
		add: strategyDropList width: 150;
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

	| parameterClasses |
	
	parameterClasses := (availableParameters collect: [ :parameter |
		parameter receiver ]) asSet asOrderedCollection.

	classDropList := (self instantiate: CMDropListWithPlaceholderPresenter)
		items: parameterClasses;
		display: [ :aClass | aClass name ];
		placeholder: translator tClass asLowercase respondingTo: #name;
		whenSelectedItemChangedDo: [ :aClass |
			parameterDropList items: (
				availableParameters select: [ :p | p receiver = aClass ]) ]
		yourself.
		
	parameterDropList := (self instantiate: CMDropListWithPlaceholderPresenter)
		placeholder: translator tParameter asLowercase respondingTo: #name;
		display: [ :parameter | parameter name ];
		yourself.
		
	strategyDropList := (self instantiate: CMDropListWithPlaceholderPresenter)
		placeholder: translator tStrategy asLowercase respondingTo: #nameForTranslator:;
		display: [ :aClass | aClass nameForTranslator: translator ];
		items: CMSensitivityAnalysisSettingPresenter allSubclasses;
		whenSelectedItemChangedDo: [ :strategyClass |
			settingsPresenter updatePresenter ];
		yourself.
		
	settingsPresenter := self newPresenterSelector
		when: [ strategyDropList isPlaceholderSelected not ]
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

{ #category : 'testing' }
CMSensitivityAnalysisParameterRowPresenter >> isFullyDefined [

	[ self parameter ] onErrorDo: [ ^ false ].
	[ self values ifEmpty: [ ^ false ] ] onErrorDo: [ ^ false ].

	^ true
]

{ #category : 'accessing' }
CMSensitivityAnalysisParameterRowPresenter >> parameter [

	parameterDropList isPlaceholderSelected ifTrue: [ self error: 'Parameter was not selected' ].
	^ parameterDropList selectedItem
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisParameterRowPresenter >> setModelBeforeInitialization: aCollection [

	availableParameters := aCollection first.
	translator := aCollection second
]

{ #category : 'accessing' }
CMSensitivityAnalysisParameterRowPresenter >> values [

	strategyDropList isPlaceholderSelected ifTrue: [ self error: 'Values were not specified' ].
	^ settingsPresenter showingPresenter values
]
