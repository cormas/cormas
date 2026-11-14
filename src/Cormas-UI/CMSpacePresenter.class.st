"
I am one view of the space of a simulation: I show its entities from the point of view of my observer, with a toolbar and a panel to choose their aspects.

## Responsibility:

- Show the space with the looks that my observer fills, and follow the simulation when I am updated.
- Let a user choose the aspects of my view, without changing any other view.
- Ask my simulation runner to duplicate me, or to move me to a window of my own and back.

## Collaborators:

- `CMObserver`: my model, which holds my perspective and the looks of the entities.
- `CMBlSpaceElement`: draws the space.
- `CMSimulationRunnerPresenter`: my host, which manages all the views of a simulation.

## Public API and Key Messages

- `observer`, `title`, `isInWindow`
- `updateDiagram` shows the current step.

I am created on an observer:

```
CMSpacePresenter newApplication: anApplication model: CMObserver new
```

## Internal Representation

- `observer`: my `CMObserver`.
- `host`: the `CMSimulationRunnerPresenter` that manages me, when there is one.
- `title`: my title, numbered by my host when several views would have the same one.
- `detachedWindow`: my window, when I was moved out of the tabs of my host, or nil.
"
Class {
	#name : 'CMSpacePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'toolbar',
		'povSelection',
		'diagram',
		'povButton',
		'isPovVisible',
		'spaceBuilder',
		'observer',
		'host',
		'title',
		'detachedWindow'
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

{ #category : 'accessing' }
CMSpacePresenter >> baseTitle [
	"Answer my title before it is numbered: the name of my perspective, if it has one"

	^ observer perspective name
		  ifEmpty: [ 'Space' ]
		  ifNotEmpty: [ :name | 'Space — ' , name ]
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

{ #category : 'accessing' }
CMSpacePresenter >> detachedWindow [
	"Answer the window of my own, when I was moved out of the tabs of the simulation runner"

	^ detachedWindow
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
CMSpacePresenter >> host: aSimulationRunner [
	"Let aSimulationRunner manage me, and offer its actions on views in my toolbar"

	host := aSimulationRunner.
	toolbar
		addItemRight: (self newToolbarButton
				 label: 'Duplicate';
				 icon: (self iconNamed: #smallCopy);
				 help: 'Open another view with the same choices';
				 action: [ host duplicateView: self ];
				 yourself);
		addItemRight: (self newToolbarButton
				 label: 'Move';
				 icon: (self iconNamed: #window);
				 help:
					 'Move this view to a window of its own, or back to the tabs';
				 action: [ self moveElsewhere ];
				 yourself)
]

{ #category : 'initialization' }
CMSpacePresenter >> initializeDiagram [
	"Create the view of the space and the presenter that embeds it"

	spaceBuilder := CMBlSpaceElement
		                for: self cormasModel
		                observedBy: observer.
	povSelection observer: observer.
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

{ #category : 'accessing' }
CMSpacePresenter >> isInWindow [

	^ detachedWindow isNotNil
]

{ #category : 'actions' }
CMSpacePresenter >> moveElsewhere [

	self isInWindow
		ifTrue: [ host moveToTabs: self ]
		ifFalse: [ host moveToWindow: self ]
]

{ #category : 'accessing' }
CMSpacePresenter >> observer [

	^ observer
]

{ #category : 'actions' }
CMSpacePresenter >> openInWindow [
	"Show me in a window of my own. Closing the window closes me as a view of the simulation"

	detachedWindow := self asWindow.
	detachedWindow
		title: title;
		initialExtent: 600 @ 600;
		whenClosedDo: [ host closeView: self ].
	detachedWindow open
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

{ #category : 'initialization' }
CMSpacePresenter >> setModelBeforeInitialization: anObserver [

	observer := anObserver
]

{ #category : 'accessing' }
CMSpacePresenter >> spaceBuilder [

	^ spaceBuilder
]

{ #category : 'accessing' }
CMSpacePresenter >> title [

	^ title
]

{ #category : 'accessing' }
CMSpacePresenter >> title: aString [

	title := aString.
	self isInWindow ifTrue: [ detachedWindow title: aString ]
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
