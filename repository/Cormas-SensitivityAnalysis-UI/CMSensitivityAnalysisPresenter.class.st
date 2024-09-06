Class {
	#name : 'CMSensitivityAnalysisPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'sensitivityAnalysis',
		'translator',
		'fixRandomSeedCheckbox',
		'randomSeedInput',
		'releaseRandomSeedCheckbox',
		'initMethodDropList',
		'controlMethodDropList',
		'finalStepInput',
		'numberOfRepetitionsInput',
		'probesList',
		'parametersTable',
		'runButton'
	],
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisPresenter class >> example [
	<example>
	
	(self forModelClass: CMMockModel translator: CMEnglishTranslator new) open.
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisPresenter class >> forModelClass: aClass translator: aTranslator [

	^ self on: { aClass . aTranslator }
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
			yourself) height: 300;
		add: parametersTable;
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
	
	initMethodDropList := (self instantiate: CMDropListWithPlaceholderPresenter)
		items: sensitivityAnalysis modelClass availableInitMethods;
		display: [ :method | method selector ];
		placeholder: translator tInitMethod asLowercase respondingTo: #selector;
		whenSelectedItemChangedDo: [ :method |
			sensitivityAnalysis activeInitMethod: (initMethodDropList isPlaceholderSelected
				ifTrue: [ nil ]
				ifFalse: [ method ]) ];
		yourself.
		
	controlMethodDropList := (self instantiate: CMDropListWithPlaceholderPresenter) 
		items: sensitivityAnalysis modelClass availableControlMethods;
		display: [ :method | method selector ];
		placeholder: translator tControlMethod asLowercase respondingTo: #selector;
		whenSelectedItemChangedDo: [ :method | 
			sensitivityAnalysis activeControlMethod: (controlMethodDropList isPlaceholderSelected
				ifTrue: [ nil ]
				ifFalse: [ method ]) ];
		yourself.
		
	finalStepInput := self newNumberInput
		beInteger;
		climbRate: 50;
		minimum: 0;
		number: CMSimulation defaultFinalTimeStep;
		yourself.

	numberOfRepetitionsInput := self newNumberInput
		beInteger;
		minimum: 1;
		number: 10;
		yourself.

	probesList := self
		instantiate: CMSensitivityAnalysisProbesListPresenter
		on: { sensitivityAnalysis modelClass availableProbes . translator }.
		
	parametersTable := self
		instantiate: CMSensitivityAnalysisParametersListPresenter
		on: { sensitivityAnalysis modelClass parameters . translator }.
		
	runButton := self newButton
		label: translator tRun;
		action: [ self openRunner ];
		yourself.

]

{ #category : 'initialization' }
CMSensitivityAnalysisPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: translator tSensitivityAnalysis;
		initialExtent: 1020@600.
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisPresenter >> openRunner [

	sensitivityAnalysis clearSimulations.
	sensitivityAnalysis clearData.
	
	sensitivityAnalysis numberOfRepetitions: numberOfRepetitionsInput number.
			
	parametersTable parameterValues keysAndValuesDo: [ :parameter :values |
		values do: [ :value |
			sensitivityAnalysis addSimulationForParameter: parameter value: value ] ].
	
	sensitivityAnalysis dataCollectors: probesList dataCollectors.
			
	(self
		instantiate: CMSensitivityAnalysisDataPresenter
		on: { sensitivityAnalysis . translator })
		open.
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisPresenter >> setModelBeforeInitialization: aCollection [

	| modelClass |
	modelClass := aCollection first.
	sensitivityAnalysis := CMSensitivityAnalysis for: modelClass.
	translator := aCollection second
]
