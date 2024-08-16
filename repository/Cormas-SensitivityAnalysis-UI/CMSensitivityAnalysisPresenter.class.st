Class {
	#name : 'CMSensitivityAnalysisPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'simulation',
		'translator',
		'fixRandomSeedCheckbox',
		'randomSeedInput',
		'releaseRandomSeedCheckbox',
		'initMethodDropList',
		'controlMethodDropList',
		'finalStepInput',
		'numberOfRepetitionsInput',
		'probesList',
		'runButton'
	],
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisPresenter class >> example [
	<example>
	
	| model |
	model := CMMockModel new.
	
	(self forModel: model translator: CMEnglishTranslator new) open.
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisPresenter class >> forModel: aCormasModel translator: aTranslator [

	^ self on: { aCormasModel . aTranslator }
]

{ #category : 'layout' }
CMSensitivityAnalysisPresenter >> defaultLayout [

	| labelHeight buttonHeight numberInputWidth |
	
	labelHeight := self class labelHeight.
	buttonHeight := self class buttonHeight.
	numberInputWidth := 90.

	^ SpBoxLayout newTopToBottom
		spacing: 5;
		borderWidth: 5;
		add: (SpBoxLayout newLeftToRight
			spacing: 10;
			add: (SpBoxLayout newTopToBottom
				spacing: 12;
				add: (SpBoxLayout newLeftToRight
					add: fixRandomSeedCheckbox;
					add: randomSeedInput width: numberInputWidth;
					yourself) height: 25;
				add: (SpBoxLayout newTopToBottom
					add: translator tInitMethod height: labelHeight;
					add: initMethodDropList height: buttonHeight;
					yourself) height: labelHeight + buttonHeight;
				add: releaseRandomSeedCheckbox height: 25;
				add: (SpBoxLayout newTopToBottom
					add: translator tControlMethod height: labelHeight;
					add: controlMethodDropList height: buttonHeight;
					yourself) height: labelHeight + buttonHeight;
				add: (SpBoxLayout newTopToBottom
					spacing: 5;
					add: (SpBoxLayout newLeftToRight
						add: translator tFinalStep;
						add: finalStepInput width: numberInputWidth;
						yourself) height: 25;
					add: (SpBoxLayout newLeftToRight
						add: translator tNumberOfRepetitions;
						add: numberOfRepetitionsInput width: numberInputWidth;
						yourself) height: 25;
					yourself) height: 55;
				yourself) width: 300;
			add: (SpBoxLayout newTopToBottom
				add: translator tProbesToBeMeasured height: labelHeight;
				add: probesList;
				yourself);
			yourself);
		add: runButton height: buttonHeight;
		yourself.
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisPresenter >> disableRandomSeedPresenters [
	"Will be called when Fix random seed checkbox is deactivated"
	
	randomSeedInput beNotEditable.
	randomSeedInput disable.
	releaseRandomSeedCheckbox disable.
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisPresenter >> enableRandomSeedPresenters [
	"Will be called when Fix random seed checkbox is activated"
	
	randomSeedInput beEditable.
	randomSeedInput enable.
	releaseRandomSeedCheckbox enable.
]

{ #category : 'initialization' }
CMSensitivityAnalysisPresenter >> initializePresenters [
	
	fixRandomSeedCheckbox := self newCheckBox
		label: translator tFixRandomSeed;
		whenActivatedDo: [ self enableRandomSeedPresenters ];
		whenDeactivatedDo: [ self disableRandomSeedPresenters ];
		yourself.
		
	randomSeedInput := self newNumberInput.
	
	releaseRandomSeedCheckbox := self newCheckBox
		label: translator tReleaseRandomSeedAfterInitialization;
		yourself.
		
	self disableRandomSeedPresenters.
	
	initMethodDropList := self newDropList
		items: simulation availableInitMethods;
		display: [ :method | method selector ];
		whenSelectedItemChangedDo: [ :method | simulation activeInitMethod: method ];
		yourself.
		
	controlMethodDropList := self newDropList
		items: simulation availableControlMethods;
		display: [ :method | method selector ];
		whenSelectedItemChangedDo: [ :method | simulation activeControlMethod: method ];
		yourself.
		
	finalStepInput := self newNumberInput
		beInteger;
		climbRate: 50;
		minimum: 0;
		number: simulation finalTimeStep;
		yourself.

	numberOfRepetitionsInput := self newNumberInput
		beInteger;
		minimum: 1;
		number: 10;
		yourself.

	probesList := self
		instantiate: CMSensitivityAnalysisProbesListPresenter
		on: { simulation . translator }.
		
	runButton := self newButton
		label: translator tRun;
		yourself.

]

{ #category : 'initialization' }
CMSensitivityAnalysisPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: translator tSensitivityAnalysis;
		initialExtent: 920@500.
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisPresenter >> setModelBeforeInitialization: aCollection [

	| cormasModel |
	cormasModel := aCollection first.
	simulation := CMSimulation for: cormasModel.
	translator := aCollection second
]
