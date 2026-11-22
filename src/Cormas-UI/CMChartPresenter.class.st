"
I show one chart of a model or of an entity, drawn from the data recorded on it, in a tab of my host or in a window of my own.

## Responsibility:

- I draw the chart that a `<chart>` method of my subject returns. Clicking an entry of its legend hides its line or shows it again, and lines stay hidden when the chart is drawn again.
- I say why the chart cannot be drawn, such as a probe or an entity that was not recorded, instead of drawing it.
- I save a picture of the chart in the output folder of the model, and move to a window of my own and back to the tabs of my host, keeping my hidden lines.

## Collaborators:

- `CMLineChart>>chartLinesOf:in:` and `canvasOf:hiding:` draw the chart from the data of the simulation.
- My host, such as `CMSimulationRunnerPresenter`, creates me with `newChartView:of:`, moves me (`moveToWindow:`, `moveToTabs:`), closes me (`closeView:`) and asks me to `updateDiagram` after each displayed step, which I do through its `updateInInterface:`.

## Public API and Key Messages

- `subject:chart:` shows the chart of a method of a model or an entity; `drawChart` draws it again.
- `title` is the title of the chart, or else the selector of its method.
- `hiddenLines`, `chartView` and `message` give access to my state and my parts.

```smalltalk
| simulation application |
simulation := (CMSimulation for: CMMockModel new)
	activeInitSelector: #initFixed;
	activeControlSelector: #step;
	initializeSimulation;
	yourself.
10 timesRepeat: [ simulation runStep ].
application := CMSimulationApplication new.
application simulation: simulation.
application cormasModel: simulation cormasModel.
(application newPresenter: CMChartPresenter)
	subject: simulation cormasModel chart: #chartCells;
	open
```

## Internal Representation

- `subject`: the model or the entity whose chart I show; `chartSelector`: the method that returns it; `chart`: the `CMChart` it returned.
- `hiddenLines`: the names of the hidden lines.
- `host`: who manages me; `detachedWindow`: my window, when I am not in a tab.

### Implementation Points

- Spec cannot move a presenter from a tab to a window, so a moved chart is a copy (`copyFor:`), as for views of the space.
"
Class {
	#name : 'CMChartPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'toolbar',
		'saveToPngButton',
		'chartView',
		'messageLabel',
		'subject',
		'chart',
		'hiddenLines',
		'chartSelector',
		'host',
		'detachedWindow'
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
CMChartPresenter >> chartSelector [

	^ chartSelector
]

{ #category : 'accessing' }
CMChartPresenter >> chartView [

	^ chartView
]

{ #category : 'updating' }
CMChartPresenter >> closeDiagram [
	"Nothing keeps running for a chart once it is no longer shown"

	
]

{ #category : 'initialization' }
CMChartPresenter >> connectPresenters [

	saveToPngButton action: [ self saveToPng ]
]

{ #category : 'actions' }
CMChartPresenter >> copyFor: aHost [
	"Return a new presenter of my chart for aHost, with the same lines hidden. Spec cannot move a presenter from a tab to a window, so a moved chart is a copy"

	| copy |
	copy := aHost newChartView: chartSelector of: subject.
	copy hiddenLines addAll: hiddenLines.
	copy drawChart.
	^ copy
]

{ #category : 'accessing' }
CMChartPresenter >> cormasModel [

	^ self application cormasModel
]

{ #category : 'initialization' }
CMChartPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: toolbar expand: false;
		  add: messageLabel expand: false;
		  add: chartView;
		  yourself
]

{ #category : 'accessing' }
CMChartPresenter >> detachedWindow [
	"Return the window of my own, when I was moved out of the tabs of my host"

	^ detachedWindow
]

{ #category : 'accessing' }
CMChartPresenter >> displayedTitle [

	^ self title
]

{ #category : 'updating' }
CMChartPresenter >> drawChart [
	"Draw my chart from the data recorded on my subject, keeping hidden the lines hidden from its legend, or say why it cannot be drawn"

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

{ #category : 'accessing' }
CMChartPresenter >> hiddenLines [
	"Return the names of the lines hidden from the legend"

	^ hiddenLines
]

{ #category : 'actions' }
CMChartPresenter >> host: aHost [
	"Let aHost, such as a simulation runner, manage me in its tabs, and offer to move me to a window of my own and back"

	host := aHost.
	toolbar addItemRight: (self newToolbarButton
			 label: 'Move';
			 icon: (self iconNamed: #window);
			 help:
				 'Move this chart to a window of its own, or back to the tabs';
			 action: [ self moveElsewhere ];
			 yourself)
]

{ #category : 'initialization' }
CMChartPresenter >> initializePresenters [

	hiddenLines := Set new.
	saveToPngButton := self newToolbarButton
		                   label: 'Save to PNG';
		                   help: 'Save a picture of the chart';
		                   icon: (self iconNamed: #smallSave);
		                   yourself.
	toolbar := self newToolbar
		           add: saveToPngButton;
		           yourself.
	toolbar beIcons.
	messageLabel := self newLabel.
	chartView := SpRoassalInspectorPresenter new
]

{ #category : 'accessing' }
CMChartPresenter >> isInWindow [

	^ detachedWindow isNotNil
]

{ #category : 'accessing' }
CMChartPresenter >> message [
	"Return why the chart cannot be drawn, or an empty string"

	^ messageLabel label
]

{ #category : 'actions' }
CMChartPresenter >> moveElsewhere [

	self isInWindow
		ifTrue: [ host moveToTabs: self ]
		ifFalse: [ host moveToWindow: self ]
]

{ #category : 'actions' }
CMChartPresenter >> openInWindow [
	"Show me in a window of my own. Closing the window closes me in my host"

	detachedWindow := self asWindow.
	detachedWindow
		title: self displayedTitle;
		initialExtent: 900 @ 600;
		whenClosedDo: [ host closeView: self ].
	detachedWindow open
]

{ #category : 'actions' }
CMChartPresenter >> registerIn: aHost [

	aHost charts add: self
]

{ #category : 'actions' }
CMChartPresenter >> saveToPng [
	"Save a picture of the chart in the output folder of the model"

	CMExport
		of: self cormasModel class
		named: chartSelector asString
		extension: 'png'
		writing: [ :file |
				RSPNGExporter new
					canvas: chartView canvas;
					exportToFile: file ]
]

{ #category : 'accessing' }
CMChartPresenter >> simulation [

	^ self application simulation
]

{ #category : 'accessing' }
CMChartPresenter >> subject [

	^ subject
]

{ #category : 'accessing' }
CMChartPresenter >> subject: aModelOrAnEntity chart: aSelector [
	"Show the chart that the method aSelector of aModelOrAnEntity returns, drawn from the data recorded on it"

	subject := aModelOrAnEntity.
	chartSelector := aSelector.
	chart := subject perform: aSelector.
	self drawChart
]

{ #category : 'accessing' }
CMChartPresenter >> title [
	"Return the title of my chart, or else the selector of its method"

	^ chart title ifNil: [ chartSelector asString ]
]

{ #category : 'updating' }
CMChartPresenter >> updateDiagram [
	"Draw my chart again after a displayed step, in the UI process and while the simulation waits, so that the data does not change meanwhile"

	host updateInInterface: [ self drawChart ]
]
