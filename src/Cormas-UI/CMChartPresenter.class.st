"
I show the charts of a model, in the Charts tab of a simulation, or of an entity, in a window of my own: one chart at a time, drawn from the data recorded on my subject.

## Responsibility:

- I list the charts of my subject (the `<chart>` methods of its class) by their titles, and draw the chosen one. Clicking an entry of its legend hides its line or shows it again, and lines stay hidden when the chart is drawn again.
- I say why a chart cannot be drawn, such as a probe or an entity that was not recorded, instead of drawing it.
- I save a picture of the chart in the output folder of the model; in a window of my own, I draw the chart again after each step of the simulation.

## Collaborators:

- `CMModel class>>chartSelectors` and `CMEntity class>>chartSelectors` give the charts; each `<chart>` method returns a `CMChart`.
- `CMLineChart>>chartLinesOf:in:` and `canvasOf:hiding:` draw the chart from the data of the simulation.
- `CMSimulationRunnerPresenter` creates me for the model and asks me to `drawChart` after each displayed step; `CMSpacePresenter` opens me on an entity from its context menu.

## Public API and Key Messages

- `subject:` shows the charts of a model or an entity; `showChart:` chooses one; `drawChart` draws it again.
- `followSimulation` draws the chart again at the end of each step.
- `chartList`, `chartView` and `message` give access to my parts.

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
(application newPresenter: CMChartPresenter)
	subject: cow;
	open
```

## Internal Representation

- `subject`: the model or the entity whose charts I show.
- `chart`: the chosen `CMChart`; `hiddenLines`: the names of its hidden lines.
- `refreshPending`: whether a drawing after a step is already waiting in the UI process.
"
Class {
	#name : 'CMChartPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'toolbar',
		'chartList',
		'saveToPngButton',
		'chartView',
		'messageLabel',
		'subject',
		'chart',
		'hiddenLines',
		'refreshPending'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMChartPresenter class >> example [
	<example>
	
	| simulation app |
	
	simulation := (CMSimulation for: CMMockModel new)
		activeInitSelector: #initFixed;
		activeControlSelector: #step;
		initializeSimulation;
		yourself.
		
	app := CMSimulationApplication new.
	app simulation: simulation.
		
	10 timesRepeat: [ simulation runStep ].
	
	(app newPresenter: self) open
]

{ #category : 'accessing' }
CMChartPresenter >> chartList [

	^ chartList
]

{ #category : 'accessing' }
CMChartPresenter >> chartNamed: aSelector [

	^ subject perform: aSelector
]

{ #category : 'accessing' }
CMChartPresenter >> chartView [

	^ chartView
]

{ #category : 'initialization' }
CMChartPresenter >> connectPresenters [
	"Changing the items of the drop list first leaves it without a selection, until the first chart is selected. Selecting a chart draws it"

	chartList whenSelectedItemChangedDo: [ :selector |
			selector ifNotNil: [
					hiddenLines removeAll.
					self drawChart ] ].
	saveToPngButton action: [ self saveToPng ].
	self showChartsOfSubject
]

{ #category : 'accessing' }
CMChartPresenter >> cormasModel [

	^ self simulation cormasModel
]

{ #category : 'layout' }
CMChartPresenter >> defaultLayout [
	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   spacing: 5;
				   add: chartList;
				   add: toolbar expand: false;
				   yourself)
		  expand: false;
		  add: messageLabel expand: false;
		  add: chartView;
		  yourself
]

{ #category : 'updating' }
CMChartPresenter >> drawChart [
	"Draw the chosen chart from the data recorded on my subject, keeping hidden the lines hidden from its legend, or say why it cannot be drawn"

	chart := self chartNamed: chartList selectedItem.
	[
		chartView canvas: (chart
				 canvasOf: (chart chartLinesOf: subject in: self simulation)
				 hiding: hiddenLines).
		messageLabel label: '' ]
		on: CMRecordingError
		do: [ :error |
				chartView canvas: RSCanvas new.
				messageLabel label:
					'This chart cannot be drawn: ' , error messageText ]
]

{ #category : 'updating' }
CMChartPresenter >> followSimulation [
	"Draw the chart again at the end of each step of the simulation. The subscription is weak, so that the simulation does not keep me alive"

	self timeStepAnnouncer weak
		when: CMTimeStepEnded
		send: #timeStepEnded:
		to: self
]

{ #category : 'initialization' }
CMChartPresenter >> initializePresenters [

	subject := self cormasModel.
	hiddenLines := Set new.
	refreshPending := false.
	chartList := self newDropList
		             display: [ :selector | self titleOf: selector ];
		             yourself.
	saveToPngButton := self newToolbarButton
		                   label: 'Save to PNG';
		                   help: 'Save to PNG';
		                   icon: (self iconNamed: #smallSave);
		                   yourself.
	toolbar := self newToolbar
		           add: saveToPngButton;
		           yourself.
	toolbar beIcons.
	messageLabel := self newLabel.
	chartView := SpRoassalInspectorPresenter new
]

{ #category : 'initialization' }
CMChartPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: 'Charts of ' , subject printString;
		initialExtent: 1100 @ 600;
		whenClosedDo: [ self stopFollowingSimulation ]
]

{ #category : 'accessing' }
CMChartPresenter >> message [
	"Return why the chosen chart cannot be drawn, or an empty string"

	^ messageLabel label
]

{ #category : 'drawing' }
CMChartPresenter >> saveToPng [
	"Save a picture of the chart in the output folder of the model"

	CMExport
		of: self cormasModel class
		named: 'chart'
		extension: 'png'
		writing: [ :file |
				RSPNGExporter new
					canvas: chartView canvas;
					exportToFile: file ]
]

{ #category : 'accessing' }
CMChartPresenter >> showChart: aSelector [

	chartList selectItem: aSelector
]

{ #category : 'updating' }
CMChartPresenter >> showChartsOfSubject [

	chartList
		items: subject class chartSelectors;
		selectIndex: 1
]

{ #category : 'accessing' }
CMChartPresenter >> simulation [

	^ self application simulation
]

{ #category : 'updating' }
CMChartPresenter >> stopFollowingSimulation [

	self timeStepAnnouncer unsubscribe: self
]

{ #category : 'accessing' }
CMChartPresenter >> subject: aModelOrAnEntity [
	"Show the charts of aModelOrAnEntity, drawn from its own data"

	subject := aModelOrAnEntity.
	self showChartsOfSubject
]

{ #category : 'accessing' }
CMChartPresenter >> timeStepAnnouncer [

	^ self simulation simulationContext timeStepAnnouncer
]

{ #category : 'updating' }
CMChartPresenter >> timeStepEnded: aTimeStepEnded [
	"The simulation announces the end of a step in its own process: draw in the UI process, once for all the steps that ended meanwhile"

	refreshPending ifTrue: [ ^ self ].
	refreshPending := true.
	self defer: [
			refreshPending := false.
			self drawChart ]
]

{ #category : 'accessing' }
CMChartPresenter >> titleOf: aSelector [

	^ (self chartNamed: aSelector) title ifNil: [ aSelector asString ]
]
