Class {
	#name : 'CMSpacePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'toolbar',
		'povSelection',
		'diagram',
		'povButton',
		'isPovVisible',
		'spaceBuilder'
	],
	#category : 'Cormas-UI-Simulation',
	#package : 'Cormas-UI',
	#tag : 'Simulation'
}

{ #category : 'examples' }
CMSpacePresenter class >> example [
	<example>
	
	| model app |
	model := CMMockModel new.
	
	(CMSimulation for: model)
		activeInitSelector: #initFixed;
		activeControlSelector: #step;
		initializeSimulation.
		
	app := CMSimulationApplication new.
	app cormasModel: model.
	(app newPresenter: self) open
]

{ #category : 'closing' }
CMSpacePresenter >> closeDiagram [
	"Stop showing and updating the diagram. A space keeps running until it is closed, even when nothing displays it anymore"

	self application announcer unsubscribe: self.
	diagram space close
]

{ #category : 'initialization' }
CMSpacePresenter >> connectPresenters [

	povButton action: [
		isPovVisible := isPovVisible not.
		self updatePovSelectionVisibility.
		self updatePovButtonIcon.
		self update ].
	
	self application announcer
		when: CMSpaceGridChanged
		send: #updateDiagram
		to: self
]

{ #category : 'accessing' }
CMSpacePresenter >> cormasModel [

	^ self application cormasModel
]

{ #category : 'layout' }
CMSpacePresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: toolbar expand: false;
		add: (SpBoxLayout newLeftToRight
			spacing: 5;
			add: diagram;
			add: povSelection width: 200;
			yourself);
		yourself
]

{ #category : 'as yet unclassified' }
CMSpacePresenter >> fitDiagram [

	spaceBuilder zoomToFit
]

{ #category : 'as yet unclassified' }
CMSpacePresenter >> hideSettings [

	owner owner hideSettings
]

{ #category : 'initialization' }
CMSpacePresenter >> initializeDiagram [
	"Create the view of the space and the presenter that embeds it"

	spaceBuilder := CMBlSpaceElement for: self cormasModel.
	diagram := spaceBuilder asPresenter.
	diagram owner: self.
	self update
]

{ #category : 'initialization' }
CMSpacePresenter >> initializePresenters [

	self initializeToolbar.

	povSelection := (self instantiate: CMPovSelectionPresenter)
		                whenChangedDo: [ spaceBuilder update ];
		                yourself.

	self updatePovSelectionVisibility.
	self initializeDiagram
]

{ #category : 'initialization' }
CMSpacePresenter >> initializeToolbar [

	isPovVisible := false.
	toolbar := self newToolbar.
	toolbar beIcons.
	
	povButton := self newToolbarButton
		label: 'PoV';
		help: 'PoV';
		yourself.
		
	self updatePovButtonIcon.
	toolbar addItemRight: povButton.

	CMSpacePresenterCommand sortedSubclasses do: [ :aClass |
		| command |
		command := aClass forOwner: self.
		toolbar add: command toolbarButton ].
]

{ #category : 'actions' }
CMSpacePresenter >> saveToPng [
	"Save a picture of the whole space in the output folder of the model"

	CMExport
		of: self cormasModel class
		named: 'space'
		extension: 'png'
		writing: [ :file | self saveToPngFile: file ]
]

{ #category : 'as yet unclassified' }
CMSpacePresenter >> saveToPngFile: aFileReference [

	spaceBuilder saveToPngFile: aFileReference
]

{ #category : 'accessing' }
CMSpacePresenter >> spaceBuilder [

	^ spaceBuilder
]

{ #category : 'TOREMOVE' }
CMSpacePresenter >> updateDiagram [

	spaceBuilder update
]

{ #category : 'as yet unclassified' }
CMSpacePresenter >> updatePovButtonIcon [

	povButton icon: (isPovVisible
		ifTrue: [ CMIcons grayEyeIcon ]
		ifFalse: [ CMIcons eyeIcon ] )
]

{ #category : 'as yet unclassified' }
CMSpacePresenter >> updatePovSelectionVisibility [

	isPovVisible
		ifTrue: [ povSelection show ]
		ifFalse: [ povSelection hide ].
]
