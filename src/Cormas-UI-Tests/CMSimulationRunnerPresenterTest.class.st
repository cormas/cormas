"
I check that a simulation runner shows any number of views of the same simulation, in tabs or in windows of their own, each with its own choices.
"
Class {
	#name : 'CMSimulationRunnerPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'runner',
		'windows'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'private' }
CMSimulationRunnerPresenterTest >> itemNamed: aString inMenuOf: anEntity in: aView [

	^ ((aView spaceBuilder contextMenuFor: anEntity) menuGroups
		   flatCollect: [ :each | each menuItems ]) detect: [ :each |
		  each name = aString ]
]

{ #category : 'private' }
CMSimulationRunnerPresenterTest >> openedWindowOf: aPresenterClass [

	| window |
	window := runner application windows detect: [ :each |
		          each presenter isKindOf: aPresenterClass ].
	windows add: window.
	^ window
]

{ #category : 'running' }
CMSimulationRunnerPresenterTest >> setUp [

	| simulation application |
	super setUp.
	simulation := (CMSimulation for: CMMockModel new)
		              randomSeed: 41;
		              activeInitSelector: #initFixed;
		              activeControlSelector: #step;
		              initializeSimulation;
		              yourself.
	application := CMSimulationApplication new.
	application simulation: simulation.
	application cormasModel: simulation cormasModel.
	runner := application newPresenter: CMSimulationRunnerPresenter.
	windows := OrderedCollection new
]

{ #category : 'running' }
CMSimulationRunnerPresenterTest >> skipWithoutARealInterface [
	"Skip the test when the interface runs deferred blocks at once, as UIManager does when there is no UI, such as on the continuous integration of Pharo 14. Selecting a page while the notebook announces the selection of another one is ignored, so the runner defers it"

	| ran |
	ran := false.
	runner application defer: [ ran := true ].
	ran ifTrue: [
		self skip: 'The interface runs deferred blocks at once' ]
]

{ #category : 'running' }
CMSimulationRunnerPresenterTest >> tearDown [

	runner closeAllViews.
	windows do: [ :each | each close ].
	super tearDown
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testADuplicateStartsWithTheChoicesOfItsViewAndThenChoosesOnItsOwn [

	| original duplicate |
	original := runner views first.
	original observer perspective hide: CMMockCow.
	duplicate := runner duplicateView: original.
	self deny: (duplicate observer perspective isVisible: CMMockCow).
	duplicate observer perspective show: CMMockCow.
	self deny: (original observer perspective isVisible: CMMockCow)
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testAModelWithoutProbesOrChartsHasNeitherDataNorChartsTab [

	| simulation application otherRunner |
	simulation := (CMSimulation for: CMMockModelWithoutData new)
		              activeInitSelector: #initGrid;
		              activeControlSelector: #step;
		              initializeSimulation;
		              yourself.
	application := CMSimulationApplication new.
	application simulation: simulation.
	application cormasModel: simulation cormasModel.
	otherRunner := application newPresenter: CMSimulationRunnerPresenter.
	self
		assert:
		(otherRunner notebook pages collect: [ :each | each title ]) asArray
		equals: #( 'Inspector' 'Space' '' )
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testANewSimulationClosesItsViewsAndShowsANewOne [

	| view |
	view := runner views first.
	view observer perspective hide: CMMockCow.
	runner newView.
	runner moveToWindow: runner views last.
	windows add: runner views last detachedWindow.
	runner initializeNotebookPages.
	self assert: runner views size equals: 1.
	self deny: runner views first isInWindow.
	self deny: runner views first observer isModified.
	self assert:
		(runner views first observer perspective isVisible: CMMockCow)
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testANewSimulationShowsItsFirstView [

	self assert: runner notebook selectedPage title equals: 'Space'
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testANewSimulationShowsThePerspectiveNamedByItsInitMethod [

	runner simulation
		activeInitSelector: #initFixedWithHiddenCows;
		initializeSimulation.
	runner initializeNotebookPages.
	self
		assert: runner views first observer original name
		equals: 'Hidden cows'.
	self deny:
		(runner views first observer perspective isVisible: CMMockCow).
	self assert: runner views first title equals: 'Space — Hidden cows'
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testANewViewCanShowANamedPerspective [

	| view |
	view := runner newViewWith: #perspectiveHiddenCows.
	self assert: view title equals: 'Space — Hidden cows'.
	self deny: (view observer perspective isVisible: CMMockCow)
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testANewViewIsAddedBeforeTheLastTab [

	runner newView.
	self
		assert:
		(runner notebook pages collect: [ :each | each title ]) asArray
		equals: #( 'Data' 'Charts' 'Inspector' 'Space' 'Space (2)'
		   '' )
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testANewViewTakesTheFirstFreeTitle [

	runner newView.
	runner newView.
	runner closeView: runner views second.
	runner newView.
	self
		assert: (runner views collect: [ :each | each title ]) asArray
		equals: #( 'Space' 'Space (3)' 'Space (2)' )
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testAViewAddedWhileTheSimulationRunsShowsNothingUntilItsNextStep [
	"Building a view reads the model, which a running simulation is changing. The next displayed step fills the view"

	| finished view |
	finished := Semaphore new.
	runner simulation
		stopWhen: [ :model | false ];
		whenFinishedDo: [ finished signal ];
		runAllStepsAfterEachIntervalDo: [ (Delay forMilliseconds: 20) wait ].
	[
		view := runner newView.
		self assert: view spaceBuilder childrenCount equals: 0 ] ensure: [
			runner simulation stopWhen: [ :model | true ].
			finished waitTimeoutSeconds: 5 ]
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testAViewKeepsItsTitleWhenItMovesBackToTheTabs [

	| moved |
	runner newView.
	moved := runner moveToWindow: runner views first.
	windows add: moved detachedWindow.
	runner moveToTabs: moved.
	self
		assert: (runner views collect: [ :each | each title ]) asSet
		equals: #( 'Space' 'Space (2)' ) asSet
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testAViewKeepsItsTitleWhenItMovesToAWindow [

	| moved |
	runner newView.
	moved := runner moveToWindow: runner views first.
	windows add: moved detachedWindow.
	self assert: moved detachedWindow title equals: 'Space'.
	self
		assert:
		(runner notebook pages collect: [ :each | each title ]) asArray
		equals: #( 'Data' 'Charts' 'Inspector' 'Space (2)' '' )
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testAViewMovedBackToTheTabsClosesItsWindow [

	| moved window back |
	moved := runner moveToWindow: runner views first.
	window := moved detachedWindow.
	windows add: window.
	back := runner moveToTabs: moved.
	self deny: back isInWindow.
	self assert: window isClosed.
	self assert: runner views size equals: 1
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testAViewMovedToAWindowKeepsItsChoices [

	| view moved |
	view := runner views first.
	view observer perspective hide: CMMockCow.
	moved := runner moveToWindow: view.
	windows add: moved detachedWindow.
	self assert: moved isInWindow.
	self deny: (moved observer perspective isVisible: CMMockCow).
	self assert: runner views size equals: 1
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testAViewOffersThePerspectivesOfTheModel [

	| dropList |
	dropList := runner views first perspectiveDropList.
	self
		assert:
			(dropList items collect: [ :each | dropList display value: each ])
				asArray
		equals: #( 'None' 'Hidden cows' )
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testAViewWhoseChoicesDifferFromItsPerspectiveIsMarkedAsModified [

	| view moved |
	view := runner newViewWith: #perspectiveHiddenCows.
	(view aspects rows detect: [ :each | each entityClass = CMMockCow ])
		visibilityCheckBox state: true.
	self
		assert:
		(runner notebook pages at: runner notebook pages size - 1) title
		equals: 'Space — Hidden cows (modified)'.
	moved := runner moveToWindow: view.
	windows add: moved detachedWindow.
	self
		assert: moved detachedWindow title
		equals: 'Space — Hidden cows (modified)'
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testChoosingAChartInTheMenuOfAnEntityOpensThatChart [

	| view cow window |
	view := runner newViewWith: #perspectiveHiddenCows.
	cow := (view cormasModel entitiesOfClass: CMMockCow) first.
	(self itemNamed: 'Charts' inMenuOf: cow in: view) subMenu menuGroups
		first menuItems first performMenuActionWith: nil.
	window := self openedWindowOf: CMChartPresenter.
	self assert: window title equals: 'Charts of ' , cow printString.
	self
		assert: window presenter chartList selectedItem
		equals: #chartEnergy
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testChoosingAPerspectiveInAViewRetitlesIt [

	| view |
	view := runner views first.
	view perspectiveDropList selectIndex: 2.
	self assert: view title equals: 'Space — Hidden cows'.
	self
		assert:
		(runner notebook pages collect: [ :each | each title ]) asArray
		equals: #( 'Data' 'Charts' 'Inspector' 'Space — Hidden cows'
			   '' )
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testChoosingAPerspectiveInAViewShowsIt [

	| view |
	view := runner views first.
	view perspectiveDropList selectIndex: 2.
	self deny: (view observer perspective isVisible: CMMockCow).
	self deny:
		(view aspects rows detect: [ :each | each entityClass = CMMockCow ])
			visibilityCheckBox state.
	self deny: view observer isModified
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testChoosingDataInTheMenuOfAnEntityOpensItsData [

	| view cow |
	view := runner newViewWith: #perspectiveHiddenCows.
	cow := (view cormasModel entitiesOfClass: CMMockCow) first.
	(self itemNamed: 'Data' inMenuOf: cow in: view)
		performMenuActionWith: nil.
	self
		assert: (self openedWindowOf: CMEntityDataPresenter) title
		equals: 'Data of ' , cow printString
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testChoosingInTheMenuOfAnEntityUpdatesItsView [

	| view goat |
	view := runner newViewWith: #perspectiveHiddenCows.
	goat := view cormasModel newEntity: CMMockGoat.
	(((view spaceBuilder contextMenuFor: goat) menuGroups flatCollect: [
		  :each | each menuItems ]) detect: [ :each |
		 each name = 'Hide CMMockGoat' ]) performMenuActionWith: nil.
	self deny:
		(view aspects rows detect: [ :each | each entityClass = CMMockGoat ])
			visibilityCheckBox state.
	self assert: view resetButton isEnabled.
	self
		assert:
		(runner notebook pages at: runner notebook pages size - 1) title
		equals: 'Space — Hidden cows (modified)'
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testClosingAllViewsClosesTheirWindows [

	| moved |
	moved := runner moveToWindow: runner views first.
	windows add: moved detachedWindow.
	runner closeAllViews.
	self assert: moved detachedWindow isClosed.
	self assertEmpty: runner views
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testClosingEveryViewLeavesNone [

	runner closeView: runner views first.
	self assertEmpty: runner views
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testClosingTheTabOfAViewClosesTheView [

	runner newView.
	(runner notebook pages detect: [ :each | each title = 'Space' ])
		removeFromNotebook.
	self
		assert: (runner views collect: [ :each | each title ]) asArray
		equals: #( 'Space (2)' )
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testClosingTheViewBeforeTheLastTabShowsTheTabBeforeIt [

	self skipWithoutARealInterface.
	windows add: runner open.
	runner notebook selectPage: runner notebook pages last.
	self waitForTheInterface.
	runner notebook selectedPage removeFromNotebook.
	self waitForTheInterface.
	self
		assert: (runner views collect: [ :each | each title ]) asArray
		equals: #( 'Space' ).
	self assert: runner notebook selectedPage title equals: 'Space'
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testClosingTheWindowOfAViewClosesTheView [

	| moved |
	moved := runner moveToWindow: runner views first.
	windows add: moved detachedWindow.
	moved detachedWindow close.
	self assertEmpty: runner views
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testNewViewsAreNumbered [

	runner newView.
	runner newView.
	self
		assert: (runner views collect: [ :each | each title ]) asArray
		equals: #( 'Space' 'Space (2)' 'Space (3)' )
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testResetInAViewGoesBackToItsPerspective [

	| view |
	view := runner newViewWith: #perspectiveHiddenCows.
	self deny: view resetButton isEnabled.
	(view aspects rows detect: [ :each | each entityClass = CMMockCow ])
		visibilityCheckBox state: true.
	self assert: view resetButton isEnabled.
	view resetButton click.
	self deny:
		(view aspects rows detect: [ :each | each entityClass = CMMockCow ])
			visibilityCheckBox state.
	self deny: view observer isModified.
	self
		assert:
		(runner notebook pages at: runner notebook pages size - 1) title
		equals: 'Space — Hidden cows'
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testSelectingTheLastTabShowsANewView [

	self skipWithoutARealInterface.
	runner notebook selectPage: runner notebook pages last.
	self waitForTheInterface.
	self assert: runner views size equals: 2.
	self assert: runner notebook selectedPage title equals: 'Space (2)'
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testStartsWithOneView [

	self assert: runner views size equals: 1.
	self assert: runner views first title equals: 'Space'
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testTabsKeepTheTitlesOfTheirViews [

	windows add: runner open.
	runner newView.
	runner moveToWindow: runner views first.
	windows add: runner views last detachedWindow.
	self
		assert: (runner notebook adapter widget pages collect: [ :each |
					 (each labelMorph allMorphs detect: [ :morph |
						  morph isKindOf: StringMorph ]) contents ]) asArray
		equals: #( 'Data' 'Charts' 'Inspector' 'Space (2)' '' )
]

{ #category : 'running' }
CMSimulationRunnerPresenterTest >> waitForTheInterface [
	"Wait until the interface has run what was deferred so far"

	| done |
	done := Semaphore new.
	runner application defer: [ done signal ].
	self deny: (done waitTimeoutMilliseconds: 2000)
]
