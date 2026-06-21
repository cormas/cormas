Class {
	#name : 'CMSensitivityAnalysisRunnerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'analysis',
		'runButton',
		'stopButton',
		'progressBar',
		'progressLabel',
		'notebook',
		'table'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'examples' }
CMSensitivityAnalysisRunnerPresenter class >> example [
	<example>
	| setup randomSeedParameter numberOfCows |
	
	randomSeedParameter := CMIntegerParameter new
		targetClass: CMSimulationContext;
		getterSelector: #randomSeed;
		setterSelector: #randomSeed:;
		defaultValue: (Random new nextInteger: SmallInteger maxVal);
		isClassSide: false;
		yourself.
		
	numberOfCows := CMMockModel parameters detect: [ :each |
		each getterSelector = #initialNumberOfCows ].
	
	setup := CMSensitivityAnalysisSetup new
		modelClass: CMMockModel;
		initSelector: #initFixed;
		controlSelector: #step;
		finalTimeStep: 1000;
		probes: CMMockModel availableProbes;
		parameterSamplings: { 
			randomSeedParameter -> #(42 24) .
			numberOfCows -> #(1 2 3 4)
		} asDictionary;
		yourself.
	
	(self on: setup) open
]

{ #category : 'states' }
CMSensitivityAnalysisRunnerPresenter >> beInFinishedMode [

	self beInInitialMode.
	
	"Just in case"
	runButton action: [ "do nothing" ].
	stopButton action: [ "do nothing" ].
	
	runButton disable.
	stopButton disable.
]

{ #category : 'states' }
CMSensitivityAnalysisRunnerPresenter >> beInInitialMode [

	runButton label: 'Run'.
	runButton icon: CMIcons runIcon.
	
	runButton action: [
		self beInRunningMode.
		analysis run ]
]

{ #category : 'states' }
CMSensitivityAnalysisRunnerPresenter >> beInPauseMode [

	runButton label: 'Resume'.
	runButton icon: CMIcons runIcon.
	
	runButton action: [ 
		self beInRunningMode.
		analysis resume ]
]

{ #category : 'states' }
CMSensitivityAnalysisRunnerPresenter >> beInRunningMode [

	runButton label: 'Pause'.
	runButton icon: CMIcons pauseIcon.
	
	runButton action: [ 
		self beInPauseMode.
		analysis pause ]
]

{ #category : 'initialization' }
CMSensitivityAnalysisRunnerPresenter >> connectPresenters [
	
	analysis whenProgressDo: [ :anAnalysis |
		self updateProgress.
		self updateDataTable ].
	
	analysis whenFinishedDo: [ :anAnalysis |
		self beInFinishedMode ].
	
	stopButton action: [
		analysis stop ]
]

{ #category : 'layout' }
CMSensitivityAnalysisRunnerPresenter >> defaultLayout [
	
	| buttonWidth |
	buttonWidth := 90.

	^ SpBoxLayout newTopToBottom
		borderWidth: 5;
		spacing: 10;
		add: (SpBoxLayout newLeftToRight
			spacing: 20;
			add: (SpBoxLayout newTopToBottom
				vAlignCenter;
				add: (SpBoxLayout newLeftToRight
					spacing: 2;
					add: runButton width: buttonWidth;
					add: stopButton width: buttonWidth;
					yourself) height: 45;
				yourself) expand: false;
			add: (SpBoxLayout newTopToBottom
				add: progressLabel expand: false;
				add: progressBar;
				yourself);
			yourself) expand: false;
		add: notebook;
		yourself
]

{ #category : 'examples' }
CMSensitivityAnalysisRunnerPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMSensitivityAnalysisRunnerPresenter >> initializePresenters [

	runButton := self newButton.
		
	stopButton := self newButton
		label: 'Stop';
		icon: CMIcons stopIcon;
		yourself.
		
	progressBar := self newProgressBar
		fixedAt: 0;
		yourself.
	
	progressLabel := self newLabel
		label: 'Progress';
		yourself.
		
	table := self instantiate: CMDataPresenter.
		
	notebook := self newNotebook.
	notebook addPageTitle: 'Data' provider: [ table ].
	
	self beInInitialMode.
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisRunnerPresenter >> onFinished [

	"do nothing"
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisRunnerPresenter >> setModelBeforeInitialization: aSetup [

	analysis := CMSensitivityAnalysis new
		setup: aSetup;
		yourself
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisRunnerPresenter >> updateDataTable [

	| data |
	data := analysis data.
	data ifEmpty: [ ^ self ].
	
	table columnNames: data first keys.
	table showData: data
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisRunnerPresenter >> updateProgress [
	
	progressBar fixedAt: analysis progress asFloat.
	
	progressLabel label: (String streamContents: [ :stream | 
		stream
			<< analysis numberOfCompletedSimulations asString
			<< ' / '
			<< analysis totalNumberOfSimulations asString
			<< ' completed' ]).
]
