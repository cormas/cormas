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
	| simulation |
	simulation := (CMSimulation for: FFFirefightersModel new)
		              activeInitSelector: #initSmall;
		              activeControlSelector: #basicStep;
		              stopAfterStep: 20;
		              yourself.
	(self on: ((CMSensitivityAnalysis on: simulation)
			  parameter: #numberOfFirefighters
			  of: FFFirefightersModel
			  values: #( 1 5 10 );
			  replicates: 2;
			  yourself)) open
]

{ #category : 'states' }
CMSensitivityAnalysisRunnerPresenter >> beInFinishedMode [

	self beInInitialMode.
	
	"Just in case"
	runButton action: [ "do nothing" ].
	stopButton action: [ "do nothing" ].
	
	runButton disable.
	stopButton disable.
	
	self showCharts
]

{ #category : 'states' }
CMSensitivityAnalysisRunnerPresenter >> beInInitialMode [

	runButton label: 'Run'.
	runButton icon: CMIcons runIcon.
	
	runButton action: [
		self beInRunningMode.
		analysis runInBackground ]
]

{ #category : 'states' }
CMSensitivityAnalysisRunnerPresenter >> beInPauseMode [

	runButton label: 'Resume'.
	runButton icon: CMIcons runIcon.
	self showCharts.
	
	runButton action: [ 
		self beInRunningMode.
		analysis resume ]
]

{ #category : 'states' }
CMSensitivityAnalysisRunnerPresenter >> beInRunningMode [

	runButton label: 'Pause'.
	runButton icon: CMIcons pauseIcon.
	self hideCharts.
	
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

{ #category : 'updating' }
CMSensitivityAnalysisRunnerPresenter >> hideCharts [

	notebook pages
		detect: [ :page | page title = 'Analysis' ]
		ifFound: [ :page | notebook removePage: page ]
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
	table columnNames: #(  ).
	table modelClass: analysis modelClass.
		
	notebook := self newNotebook.
	notebook addPageTitle: 'Data' provider: [ table ].
	
	self beInInitialMode.
]

{ #category : 'initialization' }
CMSensitivityAnalysisRunnerPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.

	aWindowPresenter 
		title: 'Sensitivity Analysis Runner';
		initialExtent: 800@600
]

{ #category : 'initialization' }
CMSensitivityAnalysisRunnerPresenter >> setModelBeforeInitialization: anAnalysis [

	analysis := anAnalysis
]

{ #category : 'updating' }
CMSensitivityAnalysisRunnerPresenter >> showCharts [
	"Show the views of the analysis once it has results of model probes"

	(analysis results isEmpty or: [ analysis outputs isEmpty ]) ifTrue: [
		^ self ].
	notebook
		addPageTitle: 'Analysis'
		provider: [
		self instantiate: CMSensitivityAnalysisChartPresenter on: analysis ]
]

{ #category : 'updating' }
CMSensitivityAnalysisRunnerPresenter >> updateDataTable [

	| data |
	data := analysis results.
	data ifEmpty: [ ^ self ].

	table columnNames: data first keys.
	table showData: (data collect: [ :row | row values asArray ])
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisRunnerPresenter >> updateProgress [
	
	progressBar fixedAt: analysis progress asFloat.
	
	progressLabel label: (String streamContents: [ :stream | 
		stream
			<< analysis numberOfCompletedRuns asString
			<< ' / '
			<< analysis numberOfRuns asString
			<< ' completed' ]).
]
