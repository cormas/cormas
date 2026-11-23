"
I inspect an entity in a simulation: the entity itself, the data recorded on it and each of its charts, in tabs. I am opened by Inspect in the context menu of an entity in a view of the space.

## Responsibility:

- Show the Pharo inspector of the entity, a Data tab when its class has probes, and a tab for each `<chart>` method of its class.
- Move each chart to a window of its own and back, as the simulation window does.
- Follow the simulation, so that the data and the shown charts include its latest steps, until my window is closed.

## Collaborators:

- `CMEntityDataPresenter` is my Data tab, and `CMChartPresenter` each chart tab.
- `TCMViewHost` moves, closes and updates the charts.
- The simulation of my application holds the data, so the entity never needs to know its simulation.

## Public API and Key Messages

- `entity:` shows an entity and starts following the simulation.
- `entity`, `dataPresenter`, `charts`, `notebook`

```smalltalk
| simulation application cow |
simulation := (CMSimulation for: CMMockModel new)
	activeInitSelector: #initFixed;
	activeControlSelector: #step;
	initializeSimulation;
	yourself.
10 timesRepeat: [ simulation runStep ].
application := CMSimulationApplication new.
application simulation: simulation.
application cormasModel: simulation cormasModel.
cow := (simulation cormasModel entitiesOfClass: CMMockCow) first.
(application newPresenter: CMEntityInspectorPresenter)
	entity: cow;
	open
```

## Internal Representation

- `entity`: the entity I inspect; `dataPresenter`: my Data tab, or nil when its class has no probes.
- `charts`: the charts, in tabs or in windows; `pages`: the tab of each chart in a tab.
"
Class {
	#name : 'CMEntityInspectorPresenter',
	#superclass : 'SpPresenter',
	#traits : 'TCMViewHost',
	#classTraits : 'TCMViewHost classTrait',
	#instVars : [
		'entity',
		'notebook',
		'pages',
		'charts',
		'dataPresenter'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'private' }
CMEntityInspectorPresenter >> addTab: aView [

	self addPageFor: aView
]

{ #category : 'accessing' }
CMEntityInspectorPresenter >> charts [

	^ charts
]

{ #category : 'accessing' }
CMEntityInspectorPresenter >> dataPresenter [

	^ dataPresenter
]

{ #category : 'initialization' }
CMEntityInspectorPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: notebook;
		  yourself
]

{ #category : 'accessing' }
CMEntityInspectorPresenter >> entity [

	^ entity
]

{ #category : 'accessing' }
CMEntityInspectorPresenter >> entity: anEntity [
	"Show anEntity, the data recorded on it when its class has probes, and a tab for each of its charts. Follow the simulation, so that they show its latest steps"

	entity := anEntity.
	notebook addPage: (SpNotebookPage
			 title: 'Inspector'
			 provider: [ StInspectorPresenter onObject: entity ]).
	entity class probeSelectors ifNotEmpty: [
			dataPresenter := self instantiate: CMEntityDataPresenter.
			dataPresenter
				entity: entity;
				followSimulation.
			notebook addPage:
				(SpNotebookPage title: 'Data' provider: [ dataPresenter ]) ].
	entity class chartSelectors do: [ :each |
		self addPageFor: (self newChartView: each of: entity) ].
	self followSimulation
]

{ #category : 'updating' }
CMEntityInspectorPresenter >> followSimulation [
	"Draw the shown charts again at the end of each step of the simulation. The subscription is weak, so that the simulation does not keep me alive"

	self timeStepAnnouncer weak
		when: CMTimeStepEnded
		send: #timeStepEnded:
		to: self
]

{ #category : 'private' }
CMEntityInspectorPresenter >> forget: aView [

	charts remove: aView
]

{ #category : 'accessing' }
CMEntityInspectorPresenter >> hostedViews [

	^ charts copy
]

{ #category : 'initialization' }
CMEntityInspectorPresenter >> initializePresenters [

	notebook := self newNotebook.
	pages := Dictionary new.
	charts := OrderedCollection new
]

{ #category : 'initialization' }
CMEntityInspectorPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: entity printString;
		initialExtent: 800 @ 600;
		whenClosedDo: [
				self stopFollowingSimulation.
				self closeAllViews ]
]

{ #category : 'views' }
CMEntityInspectorPresenter >> newChartView: aSelector of: aModelOrAnEntity [
	"Answer a chart of the method aSelector of aModelOrAnEntity, that I manage"

	^ (self instantiate: CMChartPresenter)
		  host: self;
		  offerToMove;
		  subject: aModelOrAnEntity chart: aSelector;
		  yourself
]

{ #category : 'accessing' }
CMEntityInspectorPresenter >> notebook [

	^ notebook
]

{ #category : 'accessing' }
CMEntityInspectorPresenter >> pages [

	^ pages
]

{ #category : 'accessing' }
CMEntityInspectorPresenter >> simulation [

	^ self application simulation
]

{ #category : 'updating' }
CMEntityInspectorPresenter >> stopFollowingSimulation [

	self timeStepAnnouncer unsubscribe: self.
	dataPresenter ifNotNil: [ dataPresenter stopFollowingSimulation ]
]

{ #category : 'private' }
CMEntityInspectorPresenter >> timeStepAnnouncer [

	^ self simulation simulationContext timeStepAnnouncer
]

{ #category : 'updating' }
CMEntityInspectorPresenter >> timeStepEnded: aTimeStepEnded [

	self updateShownViews
]
