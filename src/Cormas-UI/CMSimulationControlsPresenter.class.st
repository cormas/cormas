Class {
	#name : 'CMSimulationControlsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'runButton',
		'stepButton',
		'progressBarLabel',
		'progressBar',
		'finalStep',
		'speedDropList',
		'displayEvery'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMSimulationControlsPresenter class >> example [
	<example>
	
	(self forTranslator: CMEnglishTranslator new) open
]

{ #category : 'as yet unclassified' }
CMSimulationControlsPresenter class >> forTranslator: aTranslator [

	^ self on: aTranslator
]

{ #category : 'as yet unclassified' }
CMSimulationControlsPresenter >> beInNotRunningMode [

	runButton
		icon: CMIcons runIcon;
		action: [ owner runSimulationUntilEnd ].
		
	stepButton enabled: true.
	"owner ifNotNil: [ owner beInNotRunningMode ]"
]

{ #category : 'as yet unclassified' }
CMSimulationControlsPresenter >> beInRunningMode [

	runButton
		icon: CMIcons pauseIcon;
		action: [ owner shouldPause: true ].
		
	stepButton enabled: false.
	owner ifNotNil: [ owner beInRunningMode ]
]

{ #category : 'initialization' }
CMSimulationControlsPresenter >> connectPresenters [

	stepButton action: [
		owner stepSimulation ].

	finalStep whenNumberChangedDo: [ :number |
		owner updateFinalTimeStep: number ].
]

{ #category : 'as yet unclassified' }
CMSimulationControlsPresenter >> currentTimeStep: aNumber [

	progressBarLabel label: ('Step ', aNumber asString).
	
	progressBar fixedAt: (finalStep number = 0
		ifTrue: [ 0 ]
		ifFalse: [ (aNumber / finalStep number) asFloat ]).
]

{ #category : 'layout' }
CMSimulationControlsPresenter >> defaultLayout [ 

	| row1Height row2Height |
	
	row1Height := self class labelHeight.
	row2Height := self class buttonHeight.

	^ SpBoxLayout newTopToBottom
		spacing: 10;
		add: (SpBoxLayout newLeftToRight
			spacing: 5;
			add: (SpBoxLayout newTopToBottom
				spacing: 3;
				add: translator tStepButtonLabel height: row1Height;
				add: stepButton height: row2Height;
				yourself) width: 40;
			add: (SpBoxLayout newTopToBottom
				spacing: 3;
				add: translator tRun height: row1Height;
				add: runButton height: row2Height;
				yourself) width: 40;
			add: '';
			add: (SpBoxLayout newTopToBottom
				spacing: 3;
				add: translator tFinalStep height: row1Height;
				add: finalStep height: row2Height;
				yourself) width: self class buttonWidth;
			add: (SpBoxLayout newTopToBottom
				spacing: 3;
				add: translator tSpeedLabel height: row1Height;
				add: speedDropList height: row2Height;
				yourself) width: 120;
			add: (SpBoxLayout newTopToBottom
				spacing: 3;
				add: translator tDisplayEveryLabel height: row1Height;
				add: displayEvery height: row2Height;
				yourself) width: self class buttonWidth;
			yourself) height: row1Height + row2Height + 3;
		add: (SpBoxLayout newLeftToRight 
			spacing: 3;
			add: (SpBoxLayout newTopToBottom
				add: translator tProgressBarLabel height: self class labelHeight;
				add: progressBarLabel height: self class labelHeight;
				yourself) width: 80;
			add: progressBar;
			yourself) height: self class labelHeight * 2 + 1;
		yourself.
]

{ #category : 'accessing' }
CMSimulationControlsPresenter >> displayEvery [
	
	^ displayEvery number
]

{ #category : 'settings' }
CMSimulationControlsPresenter >> finalTimeStep [

	^ finalStep number = 0
		ifTrue: [ nil ]
		ifFalse: [ finalStep number ]
]

{ #category : 'settings' }
CMSimulationControlsPresenter >> finalTimeStep: aNumber [

	finalStep number: aNumber
]

{ #category : 'initialization' }
CMSimulationControlsPresenter >> initializePresenters [
	
	runButton := self newButton
		help: translator tRunButtonHelp;
		yourself.
		
	stepButton := self newButton
		icon: CMIcons stepIcon;
		help: translator tStepButtonHelp;
		yourself.
		
	progressBar := self newProgressBar.
	progressBarLabel := self newLabel.
		
	finalStep := self newNumberInput
		beInteger;
		climbRate: 50;
		minimum: 0;
		yourself.
	
	speedDropList := self newDropList
		help: translator tSpeedHelp;
		items: self speedDropListItems;
		selectItem: translator tSpeedNormal; 
		yourself.
		
	displayEvery := self newNumberInput
		beInteger;
		minimum: 1;
		number: 1;
		yourself.
		
	self currentTimeStep: 0.
	self beInNotRunningMode.
]

{ #category : 'accessing - model' }
CMSimulationControlsPresenter >> setModelBeforeInitialization: aTranslator [

	translator := aTranslator
]

{ #category : 'as yet unclassified' }
CMSimulationControlsPresenter >> speedDropListItems [

	^ {
		  translator tSpeed10xSlower.
		  translator tSpeed5xSlower.
		  translator tSpeed2xSlower.
		  translator tSpeedNormal.
		  translator tSpeed2xFaster.
		  translator tSpeed5xFaster.
		  translator tSpeed10xFaster }
]

{ #category : 'as yet unclassified' }
CMSimulationControlsPresenter >> speedInMilliseconds [

	| normalSpeed mapping |
	normalSpeed := 200.

	mapping := {
		translator tSpeed10xSlower -> (normalSpeed * 10) .
		translator tSpeed5xSlower -> (normalSpeed * 5) .
		translator tSpeed2xSlower -> (normalSpeed * 2) .
		translator tSpeedNormal -> normalSpeed .
		translator tSpeed2xFaster -> (normalSpeed / 2) .
		translator tSpeed5xFaster -> (normalSpeed / 5) .
		translator tSpeed10xFaster -> (normalSpeed / 10)
	} asDictionary.
	
	^ mapping at: speedDropList selectedItem
]
