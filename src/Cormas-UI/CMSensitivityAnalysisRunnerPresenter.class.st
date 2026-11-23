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
		'table',
		'tableDropList',
		'exportButton',
		'exportLabel'
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

	self showCharts.
	self offerExport
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

	analysis whenFinishedDo: [ :anAnalysis | self beInFinishedMode ].

	tableDropList whenSelectedItemChangedDo: [ :aClass |
		self showResults ].

	stopButton action: [ analysis stop ]
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
CMSensitivityAnalysisRunnerPresenter >> export [
	"Export the analysis once, and say where"

	| folder |
	folder := analysis export.
	exportButton disable.
	exportLabel label: 'Exported to ' , folder fullName
]

{ #category : 'accessing' }
CMSensitivityAnalysisRunnerPresenter >> exportButton [

	^ exportButton
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

	tableDropList := self newDropList
		                 items: analysis resultClasses;
		                 display: [ :aClass | aClass name ];
		                 yourself.

	table := self instantiate: CMDataPresenter.
	table columnNames: #(  ).
	table modelClass: analysis modelClass.
	table hideSummary.

	exportButton := self newButton
		                label: 'Export all data';
		                icon: CMIcons csvIcon;
		                help:
			                'Write the design and the results of the analysis in a folder of the model''s output folder';
		                disable;
		                yourself.
	exportLabel := self newLabel.

	notebook := self newNotebook.
	notebook addPageTitle: 'Data' provider: [
			self newPresenter
				layout: (SpBoxLayout newTopToBottom
						 spacing: 5;
						 add: tableDropList expand: false;
						 add: table;
						 add: exportButton height: 45;
						 add: exportLabel expand: false;
						 yourself);
				yourself ].

	self beInInitialMode
]

{ #category : 'initialization' }
CMSensitivityAnalysisRunnerPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.

	aWindowPresenter 
		title: 'Sensitivity Analysis Runner';
		initialExtent: 800@600
]

{ #category : 'updating' }
CMSensitivityAnalysisRunnerPresenter >> offerExport [
	"Offer to export the results of the runs done, with the size of the export"

	analysis results ifEmpty: [ ^ self ].
	exportButton
		label:
			'Export all data ('
			, analysis exportSize humanReadableByteSizeString , ')';
		action: [ self export ];
		enable
]

{ #category : 'initialization' }
CMSensitivityAnalysisRunnerPresenter >> setModelBeforeInitialization: anAnalysis [

	analysis := anAnalysis
]

{ #category : 'updating' }
CMSensitivityAnalysisRunnerPresenter >> showCharts [
	"Show the views of the analysis once it has results of model probes against varied parameters"

	(analysis results isEmpty or: [
		 analysis outputs isEmpty or: [ analysis parameterNames isEmpty ] ])
		ifTrue: [ ^ self ].
	notebook
		addPageTitle: 'Analysis'
		provider: [
		self instantiate: CMSensitivityAnalysisChartPresenter on: analysis ]
]

{ #category : 'updating' }
CMSensitivityAnalysisRunnerPresenter >> showResults [
	"Show the results of the class chosen in the drop-down list"

	| rows |
	rows := analysis resultsOf: tableDropList selectedItem.
	rows ifEmpty: [ ^ self ].
	table columnNames: rows first keys.
	table showData: (rows collect: [ :row | row values asArray ])
]

{ #category : 'accessing' }
CMSensitivityAnalysisRunnerPresenter >> table [

	^ table
]

{ #category : 'accessing' }
CMSensitivityAnalysisRunnerPresenter >> tableDropList [

	^ tableDropList
]

{ #category : 'updating' }
CMSensitivityAnalysisRunnerPresenter >> updateDataTable [
	"Offer the results of the model and of each class with recorded instances, keeping the chosen one, and show it"

	tableDropList updateItemsKeepingSelection: analysis resultClasses.
	self showResults
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
