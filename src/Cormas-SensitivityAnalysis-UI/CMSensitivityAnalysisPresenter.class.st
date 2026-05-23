Class {
	#name : 'CMSensitivityAnalysisPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'sensitivityAnalysis',
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
	
	(self forModelClass: CMMockModel) open.
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisPresenter class >> forModelClass: aClass [

	^ self on: aClass
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
						add: 'Final step';
						add: finalStepInput width: numberInputWidth;
						yourself) height: 25;
					add: (SpBoxLayout newLeftToRight
						add: 'Number of repetitions';
						add: numberOfRepetitionsInput width: numberInputWidth;
						yourself) height: 25;
					yourself) height: 55;
				yourself) width: 300;
			add: (SpBoxLayout newTopToBottom
				add: 'Probes to be measured' height: labelHeight;
				add: probesList;
				yourself);
			yourself) height: 300;
		add: parametersTable;
		add: runButton height: buttonHeight;
		yourself.
]

{ #category : 'initialization' }
CMSensitivityAnalysisPresenter >> initializePresenters [

	"initializationSettings := self
		instantiate: CMSimulationInitializationSettingsPresenter
		on: translator."
		
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
		on: sensitivityAnalysis modelClass availableProbes.
		
	parametersTable := self
		instantiate: CMSensitivityAnalysisParametersListPresenter
		on: sensitivityAnalysis modelClass allParameters.
		
	runButton := self newButton
		label: 'Run';
		action: [ self openRunner ];
		yourself.

]

{ #category : 'initialization' }
CMSensitivityAnalysisPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'Sensitivity Analysis';
		initialExtent: 1020@600.
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisPresenter >> openRunner [

	sensitivityAnalysis clearSimulations.
	sensitivityAnalysis clearData.
	
	sensitivityAnalysis stopAfterStep: finalStepInput number.
	
	initializationSettings isFixRandomSeed
		ifTrue: [ sensitivityAnalysis randomSeed: initializationSettings randomSeed ]
		ifFalse: [ sensitivityAnalysis randomSeed: nil ].
		
	sensitivityAnalysis shouldReleaseRandomSeedAfterInitialization:
		initializationSettings isReleaseRandomSeedAfterInitialization.
	
	sensitivityAnalysis numberOfRepetitions: numberOfRepetitionsInput number.
			
	parametersTable parameterValues keysAndValuesDo: [ :parameter :values |
		values do: [ :value |
			sensitivityAnalysis addSimulationForParameter: parameter value: value ] ].
	
	sensitivityAnalysis dataCollectors: probesList dataCollectors.
			
	(self
		instantiate: CMSensitivityAnalysisDataPresenter
		on: sensitivityAnalysis)
		open.
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisPresenter >> setModelBeforeInitialization: aClass [

	sensitivityAnalysis := CMSensitivityAnalysis for: aClass.
]

{ #category : 'initialization' }
CMSensitivityAnalysisPresenter >> setModelInitializationSettings [

	sensitivityAnalysis activeInitSelector: initializationSettings initSelector.
	sensitivityAnalysis activeControlSelector: initializationSettings controlSelector
]
