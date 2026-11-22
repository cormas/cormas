"
I am the Charts tab of a simulation: I show one of the charts defined by the model, drawn from the data recorded on the model.

## Responsibility:

- I list the charts of the model (its `<chart>` methods) by their titles, and draw the chosen one.
- I say why a chart cannot be drawn, such as a probe that was not recorded, instead of drawing it.
- I save a picture of the chart in the output folder of the model.

## Collaborators:

- `CMModel class>>chartSelectors` gives the charts; each `<chart>` method returns a `CMChart`.
- `CMSimulation>>modelData` gives the recorded data.
- `CMSimulationRunnerPresenter` creates me only when the model has charts, and asks me to `drawChart` after each displayed step.

## Public API and Key Messages

- `drawChart` draws the chosen chart again.
- `chartList`, `chartView` and `message` give access to my parts.

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
(application newPresenter: CMChartPresenter) open
```
"
Class {
	#name : 'CMChartPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'toolbar',
		'chartList',
		'saveToPngButton',
		'chartView',
		'messageLabel'
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

	^ self cormasModel perform: aSelector
]

{ #category : 'accessing' }
CMChartPresenter >> chartView [

	^ chartView
]

{ #category : 'initialization' }
CMChartPresenter >> connectPresenters [

	chartList whenSelectedItemChangedDo: [ self drawChart ].
	saveToPngButton action: [ self saveToPng ]
]

{ #category : 'accessing' }
CMChartPresenter >> cormasModel [

	^ self simulation cormasModel
]

{ #category : 'initialization' }
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

{ #category : 'drawing' }
CMChartPresenter >> drawChart [
	"Draw the chosen chart from the data recorded on the model, or say why it cannot be drawn"

	| chart |
	chart := self chartNamed: chartList selectedItem.
	[
		chartView canvas: (chart canvasOn: self simulation modelData).
		messageLabel label: '' ]
		on: CMRecordingError
		do: [ :error |
				chartView canvas: RSCanvas new.
				messageLabel label:
					'This chart cannot be drawn: ' , error messageText ]
]

{ #category : 'initialization' }
CMChartPresenter >> initializePresenters [

	chartList := self newDropList
		             items: self cormasModel class chartSelectors;
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
	chartView := SpRoassalInspectorPresenter new.
	self drawChart
]

{ #category : 'initialization' }
CMChartPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'Chart';
		initialExtent: 1000@600
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
CMChartPresenter >> simulation [

	^ self application simulation
]

{ #category : 'accessing' }
CMChartPresenter >> titleOf: aSelector [

	^ (self chartNamed: aSelector) title ifNil: [ aSelector asString ]
]
