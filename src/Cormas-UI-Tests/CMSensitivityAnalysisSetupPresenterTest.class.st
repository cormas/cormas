"
I test `CMSensitivityAnalysisSetupPresenter`: the analysis it builds has the replicates, master seed, design, recorded steps and probes chosen in the window.
"
Class {
	#name : 'CMSensitivityAnalysisSetupPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'presenter',
		'output'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'private' }
CMSensitivityAnalysisSetupPresenterTest >> csvOf: aFile [
	"Return the lines of the CSV aFile, each as an Array of its fields"

	^ aFile contents lines collect: [ :each | (each splitOn: $,) asArray ]
]

{ #category : 'private' }
CMSensitivityAnalysisSetupPresenterTest >> sample: aSelector values: anArray [

	presenter
		sample: (presenter parametersTable items detect: [ :each |
				 each getterSelector = aSelector ])
		with: (CMListSamplingMethod new
				 values: anArray;
				 yourself)
]

{ #category : 'private' }
CMSensitivityAnalysisSetupPresenterTest >> seedsOf: anAnalysisFolder [

	^ (self csvOf: anAnalysisFolder / 'results.csv') allButFirst
		  collect: [ :each | each at: 3 ]
]

{ #category : 'running' }
CMSensitivityAnalysisSetupPresenterTest >> setUp [

	super setUp.
	presenter := CMSensitivityAnalysisSetupPresenter new.
	presenter initializeWithModelClass: CMMockModel.
	presenter initSelectorDropList selectItem: #init.
	presenter finalStepInput number: 2.
	presenter masterSeedInput number: 42.
	output := FileSystem memory / 'output'
]

{ #category : 'tests' }
CMSensitivityAnalysisSetupPresenterTest >> testAProbeSwitchedOffIsNotInTheResults [

	| header |
	presenter recordingPresenter
		doNotRecord: #numberOfDeadCells
		of: CMMockModel.
	header := (self csvOf:
		           (presenter newAnalysis runIn: output) / 'results.csv')
		          first.
	self assert: (header includes: 'numberOfAliveCells').
	self deny: (header includes: 'numberOfDeadCells')
]

{ #category : 'tests' }
CMSensitivityAnalysisSetupPresenterTest >> testChoosingASamplingKeepsTheReplicates [

	presenter replicatesInput number: 2.
	self sample: #initialNumberOfCows values: #( 1 2 ).
	self assert: presenter newAnalysis numberOfRuns equals: 4
]

{ #category : 'tests' }
CMSensitivityAnalysisSetupPresenterTest >> testRunsRecordEveryStepsWhenChosen [

	presenter recordingPresenter lastStepOnlyCheckBox state: false.
	presenter recordingPresenter intervalInput number: 1.
	self
		assert:
			((presenter newAnalysis runIn: output) / 'run-1' / 'data.csv')
				contents lines size
		equals: 4
]

{ #category : 'tests' }
CMSensitivityAnalysisSetupPresenterTest >> testRunsRecordTheirLastStepOnlyByDefault [

	self
		assert:
			((presenter newAnalysis runIn: output) / 'run-1' / 'data.csv')
				contents lines size
		equals: 2
]

{ #category : 'tests' }
CMSensitivityAnalysisSetupPresenterTest >> testTheDesignIsChosenInTheSetup [

	self sample: #initialNumberOfCows values: #( 1 2 ).
	self sample: #initialNumberOfGoats values: #( 1 2 3 ).
	self assert: presenter newAnalysis numberOfRuns equals: 6.
	presenter oneFactorAtATimeButton click.
	self assert: presenter newAnalysis numberOfRuns equals: 5.
	presenter fullFactorialButton click.
	self assert: presenter newAnalysis numberOfRuns equals: 6
]

{ #category : 'tests' }
CMSensitivityAnalysisSetupPresenterTest >> testTheReplicatesHaveTheSeedsOfTheMasterSeed [

	| expected |
	presenter replicatesInput number: 3.
	expected := (CMSensitivityAnalysis on:
			             ((CMSimulation for: CMMockModel new)
				              activeInitSelector: #init;
				              activeControlSelector: #step;
				              stopAfterStep: 2;
				              yourself))
		            masterSeed: 42;
		            replicates: 3;
		            runIn: output / 'expected'.
	self
		assert: (self seedsOf: (presenter newAnalysis runIn: output))
		equals: (self seedsOf: expected)
]

{ #category : 'tests' }
CMSensitivityAnalysisSetupPresenterTest >> testTheRunButtonCountsTheRunsOfTheChosenDesign [

	self sample: #initialNumberOfCows values: #( 1 2 ).
	self sample: #initialNumberOfGoats values: #( 1 2 3 ).
	presenter oneFactorAtATimeButton click.
	self assert: (presenter runButton label includesSubstring: ' 5 ').
	presenter fullFactorialButton click.
	self assert: (presenter runButton label includesSubstring: ' 6 ')
]
