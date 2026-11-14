"
I check that a simulation runner shows any number of views of the same simulation, in tabs or in windows of their own, each from its own point of view.
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
CMSimulationRunnerPresenterTest >> tearDown [

	runner closeAllViews.
	windows do: [ :each | each close ].
	super tearDown
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testADuplicateStartsWithTheChoicesOfItsViewAndThenChoosesOnItsOwn [

	| original duplicate |
	original := runner views first.
	original observer perspective show: CMMockCow as: #aspectInvisible:.
	duplicate := runner duplicateView: original.
	self
		assert: (duplicate observer perspective aspectFor: CMMockCow)
		equals: #aspectInvisible:.
	duplicate observer perspective show: CMMockCow as: #aspectDefault:.
	self
		assert: (original observer perspective aspectFor: CMMockCow)
		equals: #aspectInvisible:
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testANewSimulationShowsItsFirstView [

	self assert: runner notebook selectedPage title equals: 'Space'
]

{ #category : 'tests' }
CMSimulationRunnerPresenterTest >> testANewViewCanShowANamedPerspective [

	| view |
	view := runner newViewWith: #perspectiveHiddenCows.
	self assert: view title equals: 'Space — Hidden cows'.
	self
		assert: (view observer perspective aspectFor: CMMockCow)
		equals: #aspectInvisible:
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
	view observer perspective show: CMMockCow as: #aspectInvisible:.
	moved := runner moveToWindow: view.
	windows add: moved detachedWindow.
	self assert: moved isInWindow.
	self
		assert: (moved observer perspective aspectFor: CMMockCow)
		equals: #aspectInvisible:.
	self assert: runner views size equals: 1
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
CMSimulationRunnerPresenterTest >> testSelectingTheLastTabShowsANewView [

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
