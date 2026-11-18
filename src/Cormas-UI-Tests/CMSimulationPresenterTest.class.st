Class {
	#name : 'CMSimulationPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'simulation',
		'presenter',
		'window'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'running' }
CMSimulationPresenterTest >> setUp [

	| application |
	super setUp.
	simulation := (CMSimulation for: CMMockModel new)
		              activeInitSelector: #initFixed;
		              activeControlSelector: #step;
		              initializeSimulation;
		              yourself.
	simulation stopWhen: [ :model | false ].
	application := CMSimulationApplication new.
	application
		simulation: simulation;
		cormasModel: simulation cormasModel.
	presenter := application newPresenter: CMSimulationPresenter.
	window := presenter open
]

{ #category : 'running' }
CMSimulationPresenterTest >> tearDown [

	simulation stopWhen: [ :model | true ].
	simulation resume.
	window isClosed ifFalse: [ window close ].
	super tearDown
]

{ #category : 'tests' }
CMSimulationPresenterTest >> testANewSimulationStopsThePreviousOne [

	simulation runAllSteps.
	presenter initializeSimulationInit: #initFixed control: #step.
	(Delay forMilliseconds: 200) wait.
	self deny: simulation isSimulationRunning
]

{ #category : 'tests' }
CMSimulationPresenterTest >> testClosingTheWindowLeavesNoMorphFocused [
	"Morphic remembers the last focused morph, which would keep the closed window and its simulation from being collected"

	| morphs button |
	morphs := window adapter widget allMorphs asIdentitySet.
	button := morphs detect: [ :each |
		          each isKindOf: SpPluggableButtonMorph ].
	button takeKeyboardFocus.
	button focusIndicatorMorph.
	window close.
	self deny:
		(morphs includes: self currentWorld activeHand keyboardFocus).
	self deny: (morphs includes:
			 (Smalltalk ui theme focusIndicator ifNotNil: [ :each | each key ]))
]

{ #category : 'tests' }
CMSimulationPresenterTest >> testClosingTheWindowStopsTheSimulation [

	simulation runAllSteps.
	window close.
	(Delay forMilliseconds: 200) wait.
	self deny: simulation isSimulationRunning
]

{ #category : 'tests' }
CMSimulationPresenterTest >> testTheRunButtonRunsANewSimulationInitializedWhileTheOldOneRan [

	| runButton newSimulation |
	runButton := (presenter instVarNamed: #simulationRunner)
		             instVarNamed: #runButton.
	runButton click.
	presenter initializeSimulationInit: #initFixed control: #step.
	newSimulation := presenter application simulation.
	newSimulation stopWhen: [ :model | false ].
	[
		runButton click.
		(Delay forMilliseconds: 200) wait.
		self assert: newSimulation isSimulationRunning ] ensure: [
			newSimulation
				stopWhen: [ :model | true ];
				resume ]
]
