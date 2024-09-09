Class {
	#name : 'CMSensitivityAnalysisPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'sensitivityAnalysis',
		'translator',
		'initializationSettings',
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

{ #category : 'initialization' }
CMSensitivityAnalysisPresenter >> connectPresenters [

	initializationSettings whenChangedDo: [ 
		self setModelInitializationSettings ].
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
				add: initializationSettings height: 190;
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

{ #category : 'initialization' }
CMSensitivityAnalysisPresenter >> initializePresenters [

	initializationSettings := self
		instantiate: CMModelInitializationSettingsPresenter
		on: translator.
		
	initializationSettings modelClass: sensitivityAnalysis modelClass.
	self setModelInitializationSettings.
	
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

{ #category : 'initialization' }
CMSensitivityAnalysisPresenter >> setModelInitializationSettings [

	sensitivityAnalysis activeInitSelector: initializationSettings initSelector.
	sensitivityAnalysis activeControlSelector: initializationSettings controlSelector
]
