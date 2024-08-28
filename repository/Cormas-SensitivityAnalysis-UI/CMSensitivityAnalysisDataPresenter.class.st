Class {
	#name : 'CMSensitivityAnalysisDataPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'sensitivityAnalysis',
		'progressBar',
		'runButton',
		'simulationsTable',
		'dataNotebook'
	],
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisDataPresenter class >> example [
	<example>
	
	| sensitivityAnalysis translator |
	
	sensitivityAnalysis := CMSensitivityAnalysis new.
	translator := CMEnglishTranslator new.
	
	^ (self forAnalysis: sensitivityAnalysis translator: translator) open
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisDataPresenter class >> forAnalysis: aSensitivityAnalysis translator: aTranslator [

	^ self on: { aSensitivityAnalysis . aTranslator }
]

{ #category : 'layout' }
CMSensitivityAnalysisDataPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 10;
		add: (SpBoxLayout newTopToBottom
			spacing: 2;
			add: 'Simulations' height: self class labelHeight;
			add: simulationsTable;
			yourself);
		add: (SpBoxLayout newLeftToRight
			spacing: 20;
			add: runButton expand: false;
			add: (SpBoxLayout newTopToBottom
				add: 'Progress:';
				add: 'Finished 10 out of 1000 simulations' expand: false;
				yourself) expand: false;
			add: progressBar;
			yourself) height: self class labelHeight * 2 + 3;
		add: dataNotebook;
		yourself
]

{ #category : 'initialization' }
CMSensitivityAnalysisDataPresenter >> initializePresenters [

	runButton := self newButton
		icon: CMIcons runIcon;
		label: 'Run all';
		action: [ "do nothing" ];
		yourself.
		
	progressBar := self newProgressBar.
	
	simulationsTable := self newTable.
	dataNotebook := self newNotebook.
	
	dataNotebook addPage: (SpNotebookPage
		title: 'Data'
		icon: (self iconNamed: #database)
		provider: [ self instantiate: CMSensitivityAnalysisDataTablePresenter ]).
		
	dataNotebook addPage: (SpNotebookPage
		title: 'Charts'
		icon: CMIcons chartIcon
		provider: [ self newLabel ]).
]

{ #category : 'initialization' }
CMSensitivityAnalysisDataPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: translator tSensitivityAnalysis;
		initialExtent: 800@650.
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisDataPresenter >> setModelBeforeInitialization: aCollection [

	sensitivityAnalysis := aCollection first.
	translator := aCollection second
]
