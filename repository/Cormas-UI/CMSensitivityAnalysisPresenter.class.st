Class {
	#name : 'CMSensitivityAnalysisPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'simulation',
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
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisPresenter class >> example [
	<example>
	
	| model |
	model := ECECModel new.
	
	(self on: model) open.
]

{ #category : 'layout' }
CMSensitivityAnalysisPresenter >> defaultLayout [

	| labelHeight buttonHeight |
	
	labelHeight := self class labelHeight.
	buttonHeight := self class buttonHeight.

	^ SpBoxLayout newTopToBottom
		spacing: 5;
		borderWidth: 5;
		add: (SpBoxLayout newLeftToRight
			spacing: 10;
			add: (SpBoxLayout newTopToBottom
				spacing: 12;
				add: (SpBoxLayout newLeftToRight
					add: fixRandomSeedCheckbox;
					add: randomSeedInput width: 100;
					yourself) height: 25;
				add: (SpBoxLayout newTopToBottom
					add: 'Active init method' height: labelHeight;
					add: initMethodDropList height: buttonHeight;
					yourself) height: labelHeight + buttonHeight;
				add: releaseRandomSeedCheckbox height: 25;
				add: (SpBoxLayout newTopToBottom
					add: 'Active control method' height: labelHeight;
					add: controlMethodDropList height: buttonHeight;
					yourself) height: labelHeight + buttonHeight;
				add: (SpBoxLayout newTopToBottom
					spacing: 5;
					add: (SpBoxLayout newLeftToRight
						add: 'Final step:';
						add: finalStepInput width: 100;
						yourself) height: 25;
					add: (SpBoxLayout newLeftToRight
						add: 'Number of repetitions:';
						add: numberOfRepetitionsInput width: 100;
						yourself) height: 25;
					yourself) height: 55;
				yourself) width: 250;
			add: (SpBoxLayout newTopToBottom
				add: 'Probes to be measured' height: labelHeight;
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

	| probePresenters |
	
	fixRandomSeedCheckbox := self newCheckBox
		label: 'Fix random seed to:';
		whenActivatedDo: [ self enableRandomSeedPresenters ];
		whenDeactivatedDo: [ self disableRandomSeedPresenters ];
		yourself.
		
	randomSeedInput := self newNumberInput.
	
	releaseRandomSeedCheckbox := self newCheckBox
		label: 'Release random seed after initialization';
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

	numberOfRepetitionsInput := self newNumberInput.

	probePresenters := simulation probes collect: [ :probe |
		CMSensitivityAnalysisProbePresenter
			forProbe: probe on: simulation ].
		
	probesList := self newComponentList
		items: probePresenters;
		yourself.
		
	runButton := self newButton
		label: 'Run';
		yourself.

]

{ #category : 'initialization' }
CMSensitivityAnalysisPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'Sensitivity Analisis';
		initialExtent: 800@500.
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisPresenter >> setModelBeforeInitialization: aCormasModel [

	simulation := CMSimulation for: aCormasModel
]
