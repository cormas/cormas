Class {
	#name : 'CMEntityInspectorPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'simulation',
		'inspector',
		'windows'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'private' }
CMEntityInspectorPresenterTest >> cow [

	^ (simulation cormasModel entitiesOfClass: CMMockCow) first
]

{ #category : 'private' }
CMEntityInspectorPresenterTest >> open [

	windows add: inspector open
]

{ #category : 'private' }
CMEntityInspectorPresenterTest >> pageTitles [

	^ (inspector notebook pages collect: [ :each | each title ]) asArray
]

{ #category : 'running' }
CMEntityInspectorPresenterTest >> setUp [

	| application |
	super setUp.
	simulation := (CMSimulation for: CMMockModel new)
		              randomSeed: 41;
		              activeInitSelector: #initFixed;
		              activeControlSelector: #step;
		              initializeSimulation;
		              yourself.
	3 timesRepeat: [ simulation runStep ].
	application := CMSimulationApplication new.
	application simulation: simulation.
	application cormasModel: simulation cormasModel.
	inspector := application newPresenter: CMEntityInspectorPresenter.
	windows := OrderedCollection new
]

{ #category : 'running' }
CMEntityInspectorPresenterTest >> tearDown [

	inspector closeAllViews.
	windows do: [ :each | each close ].
	super tearDown
]

{ #category : 'tests' }
CMEntityInspectorPresenterTest >> testAChartMovedBackToTheTabsClosesItsWindow [

	| moved back |
	inspector entity: self cow.
	moved := inspector moveToWindow: inspector charts first.
	back := inspector moveToTabs: moved.
	self deny: moved detachedWindow isOpen.
	self assert: self pageTitles equals: #( 'Inspector' 'Data' 'Energy' ).
	self assert: inspector charts asArray equals: { back }
]

{ #category : 'tests' }
CMEntityInspectorPresenterTest >> testAChartMovedToAWindowLeavesTheTabs [

	| moved |
	inspector entity: self cow.
	moved := inspector moveToWindow: inspector charts first.
	windows add: moved detachedWindow.
	self assert: moved isInWindow.
	self assert: self pageTitles equals: #( 'Inspector' 'Data' ).
	self assert: inspector charts asArray equals: { moved }
]

{ #category : 'tests' }
CMEntityInspectorPresenterTest >> testAnEntityHasATabForItselfForItsDataAndForEachOfItsCharts [

	inspector entity: self cow.
	self assert: self pageTitles equals: #( 'Inspector' 'Data' 'Energy' )
]

{ #category : 'tests' }
CMEntityInspectorPresenterTest >> testAnEntityHasNoChartTabWhenOnlyTheLastStepIsRecorded [

	simulation recordLastStepOnly.
	inspector entity: self cow.
	self assert: self pageTitles equals: #( 'Inspector' 'Data' )
]

{ #category : 'tests' }
CMEntityInspectorPresenterTest >> testAnEntityWithoutChartsHasNoChartTab [

	inspector entity:
		(simulation cormasModel entitiesOfClass: CMMockCell) first.
	self assert: self pageTitles equals: #( 'Inspector' 'Data' )
]

{ #category : 'tests' }
CMEntityInspectorPresenterTest >> testAnEntityWithoutProbesHasNoDataTab [

	inspector entity: CMMockCity new.
	self assert: self pageTitles equals: #( 'Inspector' )
]

{ #category : 'tests' }
CMEntityInspectorPresenterTest >> testClosingTheInspectorClosesTheWindowsOfItsCharts [

	| moved |
	inspector entity: self cow.
	self open.
	moved := inspector moveToWindow: inspector charts first.
	windows removeFirst close.
	self deny: moved detachedWindow isOpen
]

{ #category : 'tests' }
CMEntityInspectorPresenterTest >> testClosingTheInspectorStopsFollowingTheSimulation [

	| announcer |
	inspector entity: self cow.
	self open.
	windows removeFirst close.
	announcer := simulation simulationContext timeStepAnnouncer.
	self deny: (announcer hasSubscriber: inspector).
	self deny: (announcer hasSubscriber: inspector dataPresenter)
]

{ #category : 'tests' }
CMEntityInspectorPresenterTest >> testTheChartTabShowsTheChartOfTheEntity [

	inspector entity: self cow.
	self assert: inspector charts first subject identicalTo: self cow.
	self
		assert: inspector charts first chartSelector
		equals: #chartEnergy
]

{ #category : 'tests' }
CMEntityInspectorPresenterTest >> testTheChartsAreDrawnAgainAfterAStep [

	| canvas |
	inspector entity: self cow.
	self open.
	inspector notebook selectPage: inspector notebook pages last.
	canvas := inspector charts first chartView canvas.
	simulation runStep.
	self
		deny: inspector charts first chartView canvas
		identicalTo: canvas
]

{ #category : 'tests' }
CMEntityInspectorPresenterTest >> testTheDataTabShowsTheDataOfTheEntity [

	inspector entity: self cow.
	self
		assert: inspector dataPresenter table items
		equals: (simulation dataOf: self cow) rows
]

{ #category : 'tests' }
CMEntityInspectorPresenterTest >> testTheInspectorIsTitledByTheEntity [

	inspector entity: self cow.
	self open.
	self assert: windows first title equals: self cow printString
]
