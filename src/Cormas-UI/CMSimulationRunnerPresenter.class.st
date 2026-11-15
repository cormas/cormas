"
I run a simulation and show it: its views of the space, its data and its charts, in tabs.

## Responsibility:

- Step or run the simulation, and update what is shown after each step.
- Manage any number of views of the space, each with its own choices: add a new one, duplicate one, move one to a window of its own and back, close one.
- Close all the views when the simulation is initialized again, and show one new view with the perspective that the init method names with the pragma `<perspective: #perspectiveX>`.

## Collaborators:

- `CMSpacePresenter`: each view of the space.
- `CMObserver`: the state of each view, which moves with it between a tab and a window.
- `CMSimulation`: the simulation I run.

## Public API and Key Messages

- `views`, `newView`, `newViewWith:`, `duplicateView:`, `moveToWindow:`, `moveToTabs:`, `closeView:`, `closeAllViews`
- `stepSimulation`

```
(runner newViewWith: #perspectiveHiddenCows) title ""'Space — Hidden cows'""
```

## Internal Representation

- `views`: the views, in the order they were opened.
- `pages`: the tab of each view that is in a tab.
- `newViewPage`: the last tab, which adds a view when it is clicked.

### Implementation Points

- After each step, I update the views in windows, and only the selected tab, so that hidden tabs cost nothing.
"
Class {
	#name : 'CMSimulationRunnerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'runButton',
		'stepButton',
		'currentTimeStepLabel',
		'speedDropList',
		'displayEveryNumberPresenter',
		'notebook',
		'dataTable',
		'chartPresenter',
		'dataPage',
		'chartsPage',
		'views',
		'pages',
		'newViewPage'
	],
	#category : 'Cormas-UI-Simulation',
	#package : 'Cormas-UI',
	#tag : 'Simulation'
}

{ #category : 'examples' }
CMSimulationRunnerPresenter class >> example [
	<example>
	| app simulation |

	simulation := (CMSimulation for: CMMockModel new)
		randomSeed: 41;
		activeInitSelector: #initFixed;
		activeControlSelector: #step;
		initializeSimulation;
		yourself.
		
	app := CMSimulationApplication new.
	app simulation: simulation.
	app cormasModel: simulation cormasModel.
	(app newPresenter: CMSimulationRunnerPresenter) open
]

{ #category : 'examples' }
CMSimulationRunnerPresenter class >> exampleEmpty [
	<example>
	(CMSimulationApplication new newPresenter: self) open
]

{ #category : 'views' }
CMSimulationRunnerPresenter >> addTab: aView [
	"Show aView in a closeable tab, just before the tab that adds views. The notebook can only add a tab at the end, so that tab is removed and added again"

	| page |
	views add: aView.
	page := SpNotebookPage
		        title: aView displayedTitle
		        provider: [ aView ].
	page beCloseable.
	pages at: aView put: page.
	notebook removePage: newViewPage.
	notebook addPage: page.
	notebook addPage: newViewPage.
	^ aView
]

{ #category : 'views' }
CMSimulationRunnerPresenter >> addViewObservedBy: anObserver [

	^ self addTab: (self newViewObservedBy: anObserver)
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> beInPauseMode [

	self initializeRunButtonWithRunAction.
	stepButton enabled: true
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> beInRunningMode [

	self initializeRunButtonWithPauseAction.
	stepButton enabled: false
]

{ #category : 'views' }
CMSimulationRunnerPresenter >> closeAllViews [

	views copy do: [ :each | self closeView: each ]
]

{ #category : 'views' }
CMSimulationRunnerPresenter >> closeView: aView [
	"Stop showing aView, whether it is in a tab or in a window. A tab may already have left the notebook, when its close button was pressed"

	views remove: aView ifAbsent: [ ^ self ].
	pages at: aView ifPresent: [ :page |
			pages removeKey: aView.
			(notebook pages includes: page) ifTrue: [
				notebook removePage: page ] ].
	aView isInWindow ifTrue: [ aView detachedWindow close ].
	aView closeDiagram
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> connectPresenters [

	stepButton action: [ self stepSimulation ].
	self initializeRunButtonWithRunAction.

	speedDropList whenSelectedItemChangedDo: [ :item |
		self setSimulationIntervalDelay ].

	notebook whenSelectedPageChangedDo: [ :page :previous |
			page == newViewPage
				ifTrue: [ self newViewPageSelectedAfter: previous ]
				ifFalse: [ self showSelectedNotebookPage ] ].
	notebook whenPageRemovedDo: [ :page |
			pages keysAndValuesDo: [ :view :each |
				each == page ifTrue: [ self closeView: view ] ] ]
]

{ #category : 'accessing' }
CMSimulationRunnerPresenter >> cormasModel [

	^ self simulation cormasModel
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> defaultLayout [

	| simulationControlsLayout |
	simulationControlsLayout := SpBoxLayout newLeftToRight
		                            spacing: 5;
		                            add: (SpBoxLayout newTopToBottom
				                             spacing: 2;
				                             add: 'Step' expand: false;
				                             add: stepButton;
				                             yourself)
		                            width: 60;
		                            add: (SpBoxLayout newTopToBottom
				                             spacing: 2;
				                             add: 'Run' expand: false;
				                             add: runButton;
				                             yourself)
		                            width: 60;
		                            add: SpNullPresenter new width: 10;
		                            add: (SpBoxLayout newTopToBottom
				                             vAlignCenter;
				                             add: SpNullPresenter new
				                             height: self class labelHeight;
				                             add: currentTimeStepLabel;
				                             yourself)
		                            width: 100;
		                            add: SpNullPresenter new;
		                            add: (SpBoxLayout newTopToBottom
				                             spacing: 2;
				                             add: 'Speed' expand: false;
				                             add: speedDropList;
				                             yourself)
		                            height: 52;
		                            add: (SpBoxLayout newTopToBottom
				                             spacing: 2;
				                             add: 'Display every' expand: false;
				                             add: displayEveryNumberPresenter;
				                             yourself)
		                            expand: false;
		                            yourself.

	^ SpBoxLayout newTopToBottom
		  spacing: 10;
		  add: simulationControlsLayout expand: false;
		  add: notebook;
		  yourself
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> displayCurrentTimeStep [

	currentTimeStepLabel label: ('Step: ', self simulation currentTimeStep asString)
]

{ #category : 'views' }
CMSimulationRunnerPresenter >> duplicateView: aView [
	"Add a view in a new tab, which starts with the choices of aView and then chooses on its own"

	^ self addViewObservedBy: aView observer copy
]

{ #category : 'examples' }
CMSimulationRunnerPresenter >> example [
	<script: 'self example'>
]

{ #category : 'update presenters' }
CMSimulationRunnerPresenter >> fitDiagram [

	self simulation ifNil: [ ^ self ].
	views do: [ :each | each isInWindow ifFalse: [ each fitDiagram ] ]
]

{ #category : 'views' }
CMSimulationRunnerPresenter >> freeTitleFrom: aString for: aView [
	"Answer aString, or aString numbered when another view already has that title"

	| title number |
	title := aString.
	number := 1.
	[
	views anySatisfy: [ :each |
		each ~~ aView and: [ each title = title ] ] ] whileTrue: [
			number := number + 1.
			title := aString , ' (' , number printString , ')' ].
	^ title
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> hideSettings [

	self flag: 'TODO'.
	"simulationControls hide."
	
	self flag: 'TODO'.
	"owner hideInitializationSettings."
	self update.
	self fitDiagram
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initialPerspective [
	"Answer the perspective that the init method of the simulation names with the pragma <perspective:>, or else an empty one"

	^ (self cormasModel class lookupSelector:
		   self simulation activeInitSelector) pragmas
		  detect: [ :each | each selector = #perspective: ]
		  ifFound: [ :pragma |
		  self cormasModel perspectiveNamed: pragma arguments first ]
		  ifNone: [ CMPerspective new ]
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeNotebookPages [
	"Show the data and the charts of a new simulation, then one view of its space and a last tab that adds a view. The views of the previous simulation are closed, and the new one starts with the perspective named by the init method"

	self closeAllViews.
	chartPresenter := self instantiate: CMChartPresenter.

	dataTable := self instantiate: CMDataPresenter.
	dataTable columnNames: (self simulation activeProbes collect: #name).
	dataTable modelClass: self cormasModel class.

	"Replaced before the old pages are removed, so that the old one is not taken for it when the notebook selects it"
	newViewPage := SpNotebookPage title: '' provider: [ self newLabel ].
	newViewPage icon: (self iconNamed: #smallAdd).

	self flag: 'TODO'.
	"This is a hack to avoid a nasty Spec bug. When we remove all pages after changing a nancy notebook page (a different presenter), it breaks because it can't find the model"
	"notebook removeAll."
	notebook pages size timesRepeat: [ notebook removePageAt: 1 ].

	dataPage := SpNotebookPage title: 'Data' provider: [ dataTable ].

	chartsPage := SpNotebookPage
		              title: 'Charts'
		              provider: [ chartPresenter ].

	notebook addPage: dataPage.
	notebook addPage: chartsPage.
	notebook addPage: (SpNotebookPage
			 title: 'Inspector'
			 provider: [ StInspectorPresenter onObject: self simulation ]).
	notebook addPage: newViewPage.

	self addViewObservedBy: (CMObserver new
			 perspective: self initialPerspective;
			 yourself).
	notebook selectPage: (pages at: views first)
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializePresenters [

	runButton := self newButton
		             help: 'Run the simulation to the end';
		             yourself.
	stepButton := self newButton
		              icon: CMIcons stepIcon;
		              help: 'Run the simulation just one step forward';
		              yourself.

	currentTimeStepLabel := self newLabel.
	speedDropList := self newDropList
		                 help: 'Speed of simulation';
		                 items: self speedDropListItems;
		                 selectItem: 'normal';
		                 yourself.
	displayEveryNumberPresenter := self newNumberInput
		                               beInteger;
		                               minimum: 1;
		                               number: 1;
		                               yourself.
	self beInPauseMode.
	views := OrderedCollection new.
	pages := IdentityDictionary new.
	notebook := self newNotebook.
	"A hack to overcome an issue with notebook pages that were added to an empty notebook not signalling the event when they are selected"
	notebook addPage:
		(SpNotebookPage title: 'Empty' provider: [ self newLabel ]).
	"By default this page is disabled. It will be enabled when the simulation: setter is called"
	self enabled: false.

	self simulation ifNotNil: [ self updateWithSimulation ]
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeRunButtonWithPauseAction [

	runButton
		icon: CMIcons pauseIcon;
		action: [ self pauseSimulation ]
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeRunButtonWithRunAction [

	runButton
		icon: CMIcons runIcon;
		action: [ self simulation isSimulationProcessConfigured
			ifFalse: [ self runSimulationUntilEnd ]
			ifTrue: [ self resumeSimulation ] ]
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'Simulation Runner';
		initialExtent: 1000@600;
		whenResizingDo: [ self fitDiagram ].
]

{ #category : 'views' }
CMSimulationRunnerPresenter >> moveToTabs: aView [
	"Show aView in a new tab, with its choices and its title, and close its window. Answer the view in the tab"

	| back |
	back := self newViewObservedBy: aView observer.
	back title: aView title.
	self closeView: aView.
	self addTab: back.
	^ back
]

{ #category : 'views' }
CMSimulationRunnerPresenter >> moveToWindow: aView [
	"Show aView in a window of its own, with its choices and its title. Answer the view in the window"

	| moved |
	moved := self newViewObservedBy: aView observer.
	moved title: aView title.
	self closeView: aView.
	views add: moved.
	moved openInWindow.
	^ moved
]

{ #category : 'views' }
CMSimulationRunnerPresenter >> newView [
	"Add a view in a new tab, showing every class with its default aspect"

	^ self addViewObservedBy: CMObserver new
]

{ #category : 'views' }
CMSimulationRunnerPresenter >> newViewObservedBy: anObserver [
	"Answer a view on anObserver, with the first free title"

	| view |
	view := (self instantiate: CMSpacePresenter on: anObserver)
		        host: self;
		        yourself.
	view title: (self freeTitleFrom: view baseTitle for: view).
	view
		whenPerspectiveChangedDo: [
			view title: (self freeTitleFrom: view baseTitle for: view) ];
		whenChoicesChangedDo: [ self showTitleOf: view ].
	^ view
]

{ #category : 'views' }
CMSimulationRunnerPresenter >> newViewPageSelectedAfter: aPage [
	"Show a new view when the tab that adds views is clicked. The notebook also selects that tab by itself when the tab before it closes, and then the tab before it is shown instead. The selection is deferred, because the notebook ignores a new selection while it announces one, and the tab may have left the notebook in the meantime, when all the tabs are replaced"

	| page |
	page := (notebook pages includes: aPage)
		        ifTrue: [ pages at: self newView ]
		        ifFalse: [ notebook pages at: notebook pages size - 1 ].
	self application defer: [
		(notebook pages includes: page) ifTrue: [ notebook selectPage: page ] ]
]

{ #category : 'views' }
CMSimulationRunnerPresenter >> newViewWith: aSelector [
	"Add a view in a new tab, showing the perspective that the model defines in its method aSelector"

	^ self addViewObservedBy: (CMObserver new
			   perspective: (self cormasModel perspectiveNamed: aSelector);
			   yourself)
]

{ #category : 'accessing' }
CMSimulationRunnerPresenter >> notebook [

	^ notebook
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> pauseSimulation [

	self beInPauseMode.
	self simulation pause
]

{ #category : 'actions' }
CMSimulationRunnerPresenter >> resumeSimulation [

	self beInRunningMode.
	self simulation resume
]

{ #category : 'actions' }
CMSimulationRunnerPresenter >> runSimulationUntilEnd [

	self beInRunningMode.
	self setStepsPerInterval.

	self simulation runAllStepsAfterEachIntervalDo: [
		[ self updateAfterStep ] onErrorDo: [ :error |
			error asString = '#intersect: was sent to nil'
				ifFalse: [ error signal ] ] ]
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> setSimulationIntervalDelay [

	self simulation intervalDelay: self speedInMilliseconds.
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> setStepsPerInterval [

	self simulation stepsPerInterval: displayEveryNumberPresenter number.
]

{ #category : 'update presenters' }
CMSimulationRunnerPresenter >> showSelectedNotebookPage [
	"Refresh the page that the user just selected, unless a simulation is running: its next displayed step refreshes the page, and a refresh asked by the interface must not overlap a step"

	(self simulation isNotNil and: [ self simulation isSimulationRunning ])
		ifTrue: [ ^ self ].
	self updateSelectedNotebookPage
]

{ #category : 'views' }
CMSimulationRunnerPresenter >> showTitleOf: aView [
	"Show the title of aView on its tab, when it is in one"

	pages at: aView ifPresent: [ :page |
			page
				title: aView displayedTitle;
				pageTitleChanged ]
]

{ #category : 'accessing' }
CMSimulationRunnerPresenter >> simulation [

	^ self application simulation 
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> speedDropListItems [

	^ {
		'10x slower' .
		'5x slower' .
		'2x slower' .
		'normal' .
		'2x faster'.
		'5x faster'.
		'10x faster' }
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> speedInMilliseconds [

	| normalSpeed mapping |
	normalSpeed := 200.

	mapping := {
		'10x slower' -> (normalSpeed * 10) .
		'5x slower' -> (normalSpeed * 5) .
		'2x slower' -> (normalSpeed * 2) .
		'normal' -> normalSpeed .
		'2x faster' -> (normalSpeed / 2) .
		'5x faster' -> (normalSpeed / 5) .
		'10x faster' -> (normalSpeed / 10)
	} asDictionary.
	
	^ mapping at: speedDropList selectedItem
]

{ #category : 'actions' }
CMSimulationRunnerPresenter >> stepSimulation [

	self simulation runStep.
	self updateAfterStep.
]

{ #category : 'update presenters' }
CMSimulationRunnerPresenter >> updateAfterStep [

	self displayCurrentTimeStep.
	self updateSelectedNotebookPage.
	
	"To apply the new value entered into the number input"
	self setStepsPerInterval
]

{ #category : 'update presenters' }
CMSimulationRunnerPresenter >> updateChart [

	chartPresenter updateCharts.
]

{ #category : 'update presenters' }
CMSimulationRunnerPresenter >> updateDataTable [

	dataTable showData: self simulation data
]

{ #category : 'update presenters' }
CMSimulationRunnerPresenter >> updateSelectedNotebookPage [
	"Only update the page that is currently being displayed, and the views in windows of their own. This makes execution much faster because other pages (charts, data table, other views) are not updated when they are not displayed"

	views do: [ :each | each isInWindow ifTrue: [ each updateDiagram ] ].
	notebook selectedPage ifNil: [ ^ self ].
	pages keysAndValuesDo: [ :view :page |
		notebook selectedPage = page ifTrue: [ view updateDiagram ] ].
	notebook selectedPage = dataPage ifTrue: [ self updateDataTable ].
	notebook selectedPage = chartsPage ifTrue: [ self updateChart ]
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> updateWithSimulation [

	self setSimulationIntervalDelay.
	self simulation whenFinishedDo: [ self beInPauseMode ].
	
	self displayCurrentTimeStep.
	self enabled: true.
	self initializeNotebookPages.
	self simulation simulationContext timeStepAnnouncer
    when: ValueChanged do: [ :ann |
        currentTimeStepLabel defer: [ self displayCurrentTimeStep ] ]
    for: self.  "Automatic unsubscription when the presenter is released"
]

{ #category : 'views' }
CMSimulationRunnerPresenter >> views [
	"Answer the views of the space of the simulation, in tabs or in windows of their own"

	^ views
]
