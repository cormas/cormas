"
I am one view of the space of a simulation: I show its entities with the looks that my observer fills, with a toolbar, the perspective of the view beside it, and my aspects in a popover under the Aspects button.

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
- `aspects`: my `CMAspectsPresenter`.
"
Class {
	#name : 'CMSpacePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'toolbar',
		'diagram',
		'spaceBuilder',
		'observer',
		'host',
		'title',
		'detachedWindow',
		'aspects',
		'aspectsButton',
		'whenChoicesChangedBlock',
		'whenPerspectiveChangedBlock',
		'perspectiveDropList',
		'resetButton',
		'aspectsClosedAt'
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
CMSpacePresenter >> aspects [
	"Answer the panel where my choices are made"

	^ aspects
]

{ #category : 'accessing' }
CMSpacePresenter >> baseTitle [
	"Answer my title before it is numbered: the name of my perspective, if it has one"

	^ observer perspective name
		  ifEmpty: [ 'Space' ]
		  ifNotEmpty: [ :name | 'Space — ' , name ]
]

{ #category : 'aspects' }
CMSpacePresenter >> choicesChanged [
	"While a simulation runs, its next displayed step shows the new choices"

	self isSimulationRunning ifFalse: [ spaceBuilder update ].
	aspects refresh.
	resetButton enabled: observer isModified.
	self showTitle.
	whenChoicesChangedBlock value
]

{ #category : 'aspects' }
CMSpacePresenter >> choosePerspective: aPerspective [

	aPerspective name = observer original name ifTrue: [ ^ self ].
	observer perspective: aPerspective.
	self perspectiveChanged
]

{ #category : 'updating' }
CMSpacePresenter >> closeDiagram [
	"Stop showing and updating the diagram. A space keeps running until it is closed, even when nothing displays it anymore. Bloc fails when the morph of a closed space loses the keyboard focus later, so the focus is released first"

	| hand |
	self application announcer unsubscribe: self.
	hand := self currentWorld activeHand.
	(diagram adapter notNil and: [
		 diagram adapter widget allMorphs includes: hand keyboardFocus ])
		ifTrue: [ hand releaseKeyboardFocus ].
	diagram space close
]

{ #category : 'initialization' }
CMSpacePresenter >> connectPresenters [

	aspectsButton action: [ self toggleAspects ].
	perspectiveDropList whenSelectedItemChangedDo: [ :each |
		self choosePerspective: each ].
	resetButton action: [
			observer reset.
			self perspectiveChanged ].
	aspects whenChangedDo: [ self choicesChanged ].

	self application announcer
		when: CMSpaceGridChanged
		send: #updateDiagram
		to: self
]

{ #category : 'actions' }
CMSpacePresenter >> copyFor: aSimulationRunner [
	"Return a new view for aSimulationRunner, with my choices and my title. Spec cannot move a presenter from a tab to a window, so a moved view is a copy"

	^ (aSimulationRunner newViewObservedBy: observer)
		  title: title;
		  yourself
]

{ #category : 'accessing' }
CMSpacePresenter >> cormasModel [

	^ self application cormasModel
]

{ #category : 'layout' }
CMSpacePresenter >> defaultLayout [
	"The perspective of the view is chosen beside the toolbar, when the model defines perspectives"

	| top |
	top := SpBoxLayout newLeftToRight
		       spacing: 5;
		       add: toolbar;
		       yourself.
	self hasPerspectives ifTrue: [
			top
				add: (SpBoxLayout newTopToBottom
						 vAlignCenter;
						 add: perspectiveDropList;
						 yourself)
				width: 180;
				add: (SpBoxLayout newTopToBottom
						 vAlignCenter;
						 add: resetButton;
						 yourself)
				width: 60 ].
	^ SpBoxLayout newTopToBottom
		  add: top expand: false;
		  add: diagram;
		  yourself
]

{ #category : 'accessing' }
CMSpacePresenter >> detachedWindow [
	"Answer the window of my own, when I was moved out of the tabs of the simulation runner"

	^ detachedWindow
]

{ #category : 'updating' }
CMSpacePresenter >> displayedTitle [
	"Answer my title, marked when my choices differ from the named perspective I started from"

	^ (observer isModified and: [ observer original name notEmpty ])
		  ifTrue: [ title , ' (modified)' ]
		  ifFalse: [ title ]
]

{ #category : 'as yet unclassified' }
CMSpacePresenter >> fitDiagram [

	spaceBuilder zoomToFit
]

{ #category : 'aspects' }
CMSpacePresenter >> hasPerspectives [

	^ self cormasModel perspectiveSelectors isNotEmpty
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
	"Create the view of the space and the presenter that embeds it. While a simulation runs, the view is filled by its next displayed step. A choice made in the context menu of an entity may give a class a choice of its own, and so a row of its own. Inspecting an entity opens the inspector that also shows its data and its charts"

	spaceBuilder := self isSimulationRunning
		                ifTrue: [
		                CMBlSpaceElement
			                emptyFor: self cormasModel
			                observedBy: observer ]
		                ifFalse: [
		                CMBlSpaceElement
			                for: self cormasModel
			                observedBy: observer ].
	spaceBuilder whenAspectsChangedDo: [
			aspects updateRows.
			self choicesChanged ].
	spaceBuilder inspectEntitiesWith: [ :entity |
		self openInspectorOn: entity ].
	diagram := spaceBuilder asPresenter.
	diagram owner: self.
	self update
]

{ #category : 'initialization' }
CMSpacePresenter >> initializePresenters [

	whenChoicesChangedBlock := [ ].
	whenPerspectiveChangedBlock := [ ].
	aspectsClosedAt := 0.
	self initializeToolbar.
	perspectiveDropList := self newDropList
		                       help: 'The perspective of this view';
		                       items: self perspectives;
		                       display: [ :each |
			                       each name ifEmpty: [ 'None' ] ];
		                       yourself.
	resetButton := self newButton
		               label: 'Reset';
		               help: 'Go back to the perspective';
		               yourself.
	aspects := self instantiate: CMAspectsPresenter on: observer.
	self initializeDiagram.
	self showPerspective
]

{ #category : 'initialization' }
CMSpacePresenter >> initializeToolbar [

	toolbar := self newToolbar.
	toolbar beIcons.
	aspectsButton := self newToolbarButton
		                 label: 'Aspects';
		                 icon: CMIcons eyeIcon;
		                 help:
			                 'Show or hide each class of entities, and choose how it appears';
		                 yourself.
	toolbar addItemRight: aspectsButton.
	CMSpacePresenterCommand sortedSubclasses do: [ :aClass |
			| command |
			command := aClass forOwner: self.
			toolbar add: command toolbarButton ]
]

{ #category : 'accessing' }
CMSpacePresenter >> isInWindow [

	^ detachedWindow isNotNil
]

{ #category : 'aspects' }
CMSpacePresenter >> isSimulationRunning [
	"Answer whether a simulation is changing the model. Then only its displayed steps refresh me, so that I never read the model while it changes"

	^ self application simulation isNotNil and: [
		  self application simulation isSimulationRunning ]
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

{ #category : 'accessing' }
CMSpacePresenter >> openInWindow [
	"Show me in a window of my own. Closing the window closes me as a view of the simulation"

	detachedWindow := self asWindow.
	detachedWindow
		title: self displayedTitle;
		initialExtent: 900 @ 600;
		whenClosedDo: [ host closeView: self ].
	detachedWindow open
]

{ #category : 'actions' }
CMSpacePresenter >> openInspectorOn: anEntity [
	"Open a window showing anEntity, the data recorded on it and its charts"

	(self application newPresenter: CMEntityInspectorPresenter)
		entity: anEntity;
		open
]

{ #category : 'aspects' }
CMSpacePresenter >> perspectiveChanged [
	"My observer got another perspective, or went back to its own"

	aspects updateRows.
	self showPerspective.
	whenPerspectiveChangedBlock value.
	self choicesChanged
]

{ #category : 'aspects' }
CMSpacePresenter >> perspectiveDropList [

	^ perspectiveDropList
]

{ #category : 'aspects' }
CMSpacePresenter >> perspectives [
	"Answer an empty perspective and the perspectives that the model defines"

	^ { CMPerspective new }
	  , (self cormasModel perspectiveSelectors collect: [ :each |
			   self cormasModel perspectiveNamed: each ])
]

{ #category : 'actions' }
CMSpacePresenter >> registerIn: aSimulationRunner [

	aSimulationRunner views add: self
]

{ #category : 'aspects' }
CMSpacePresenter >> resetButton [

	^ resetButton
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

{ #category : 'aspects' }
CMSpacePresenter >> showPerspective [

	perspectiveDropList disableSelectionDuring: [
			perspectiveDropList selectItem:
				(perspectiveDropList items detect: [ :each |
					 each name = observer original name ]) ].
	resetButton enabled: observer isModified
]

{ #category : 'updating' }
CMSpacePresenter >> showTitle [

	self isInWindow ifTrue: [ detachedWindow title: self displayedTitle ]
]

{ #category : 'accessing' }
CMSpacePresenter >> spaceBuilder [

	^ spaceBuilder
]

{ #category : 'accessing' }
CMSpacePresenter >> title [

	^ title
]

{ #category : 'updating' }
CMSpacePresenter >> title: aString [

	title := aString.
	self showTitle
]

{ #category : 'aspects' }
CMSpacePresenter >> toggleAspects [
	"Show my aspects in a popover under the Aspects button, which closes when the user clicks elsewhere. A click on the button while the popover is open closes it first, as any click outside it does, so that same click must not open it again"

	(Time millisecondsSince: aspectsClosedAt) < 300 ifTrue: [ ^ self ].
	self newPopover
		relativeTo: aspectsButton;
		bePositionBottom;
		presenter: aspects;
		whenClosedDo: [ aspectsClosedAt := Time millisecondClockValue ];
		popup
]

{ #category : 'TOREMOVE' }
CMSpacePresenter >> updateDiagram [

	spaceBuilder update
]

{ #category : 'initialization' }
CMSpacePresenter >> whenChoicesChangedDo: aBlock [
	"Run aBlock after any change of the choices of my observer"

	whenChoicesChangedBlock := aBlock
]

{ #category : 'initialization' }
CMSpacePresenter >> whenPerspectiveChangedDo: aBlock [
	"Run aBlock after another perspective was chosen in me, or after a reset, before the blocks of other changes"

	whenPerspectiveChangedBlock := aBlock
]
