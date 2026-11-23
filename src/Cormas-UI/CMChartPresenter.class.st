"
I show one chart of a model or of an entity, drawn from the data recorded on it, in a tab of my host or in a window of my own.

## Responsibility:

- I draw the chart that a `<chart>` method of my subject returns. Clicking an entry of its legend hides its series or shows it again, and series stay hidden when the chart is drawn again.
- For a chart with a series shown at the shown step only, such as a histogram of one step, I show the latest recorded step after each displayed step, and a step slider chooses another one, which stays shown until the next displayed step.
- I say why the chart cannot be drawn, such as a probe or an entity that was not recorded, instead of drawing it.
- I save a picture of the chart in the output folder of the model, and move to a window of my own and back to the tabs of my host, keeping my hidden series and my chosen step.

## Collaborators:

- `CMChart>>seriesDataOf:in:` and `canvasOf:hiding:` draw the chart from the data of the simulation; `CMSeriesData>>upToStep:` keeps the data up to the chosen step.
- My host, a `TCMViewHost` such as `CMSimulationRunnerPresenter` or `CMEntityInspectorPresenter`, creates me with `newChartView:of:`, moves me (`moveToWindow:`, `moveToTabs:`), closes me (`closeView:`) and asks me to `updateDiagram` after each displayed step, which I do through its `updateInInterface:`.

## Public API and Key Messages

- `subject:chart:` shows the chart of a method of a model or an entity; `drawChart` draws it again, and `drawChartUpToStep:` draws it from the data recorded up to a step.
- `title` is the title of the chart, or else the selector of its method.
- `hiddenSeries`, `chartView`, `stepSlider` and `message` give access to my state and my parts.

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
- `hiddenSeries`: the names of the hidden series.
- `upToStep`: the step up to which the data is drawn, `Float infinity` for all of it; `shownStep`: the step shown by the series shown at the shown step only; `stepSlider`: the slider that chooses it, in my layout only for such a chart.
- `host`: who manages me; `detachedWindow`: my window, when I am not in a tab.

### Implementation Points

- Spec cannot move a presenter from a tab to a window, so a moved chart is a copy (`copyFor:`), as for views of the space.
"
Class {
	#name : 'CMChartPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'buttonBar',
		'chartView',
		'messageLabel',
		'subject',
		'chart',
		'chartSelector',
		'host',
		'detachedWindow',
		'stepSlider',
		'upToStep',
		'shownStep',
		'hiddenSeries'
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
	stepSlider whenValueChangedDo: [ :value |
		self showStep: value rounded ]
]

{ #category : 'actions' }
CMChartPresenter >> copyFor: aHost [
	"Return a new presenter of my chart for aHost, with the same series hidden and the same step chosen. Spec cannot move a presenter from a tab to a window, so a moved chart is a copy"

	| copy |
	copy := aHost newChartView: chartSelector of: subject.
	copy hiddenSeries addAll: hiddenSeries.
	copy drawChartUpToStep: upToStep.
	^ copy
]

{ #category : 'accessing' }
CMChartPresenter >> cormasModel [

	^ self application cormasModel
]

{ #category : 'initialization' }
CMChartPresenter >> defaultLayout [
	^ SpBoxLayout newTopToBottom
		  add: buttonBar expand: false;
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
	"Draw my chart again, from the data recorded on my subject up to the step chosen with the step slider, if any"

	self drawChartUpToStep: upToStep
]

{ #category : 'updating' }
CMChartPresenter >> drawChartUpToStep: aStep [
	"Draw my chart from the data recorded on my subject up to aStep, keeping hidden the series hidden from its legend, or say why it cannot be drawn. Series shown at the shown step show the last of these steps. While the simulation runs, the x axis leaves room to grow"

	upToStep := aStep.
	[
		| series |
		series := chart seriesDataOf: subject in: self simulation.
		chart hasSeriesAtShownStep ifTrue: [
			self updateStepSliderFor: series ].
		chartView canvas: (chart
				 canvasOf: (series collect: [ :each | each upToStep: aStep ])
				 hiding: hiddenSeries
				 leavingRoomToGrow: self simulation isSimulationRunning).
		messageLabel label: '' ]
		on: CMRecordingError
		do: [ :error |
				chartView canvas: RSCanvas new.
				messageLabel label:
					'This chart cannot be drawn: ' , error messageText ]
]

{ #category : 'accessing' }
CMChartPresenter >> hiddenSeries [
	"Return the names of the series hidden from the legend"

	^ hiddenSeries
]

{ #category : 'actions' }
CMChartPresenter >> host: aHost [
	"Let aHost, such as a simulation runner, manage me"
	host := aHost
]

{ #category : 'initialization' }
CMChartPresenter >> initializePresenters [
	hiddenSeries := Set new.
	upToStep := Float infinity.
	buttonBar := SpBoxLayout newLeftToRight
		             spacing: 5;
		             yourself.
	messageLabel := self newLabel.
	chartView := SpRoassalInspectorPresenter new.
	stepSlider := self newSlider
		              quantum: 1;
		              yourself
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
CMChartPresenter >> offerToSaveAndMove [
	"Offer to save a picture of me, and to move me to a window of my own and back to the tabs of my host"
	buttonBar
		add: (self newButton
				 label: 'Save a picture';
				 icon: (self iconNamed: #smallSave);
				 help: 'Save a picture of the chart in the output folder of the model';
				 action: [ self saveToPng ];
				 yourself)
		expand: false;
		add: (self newButton
				 label: 'Move';
				 icon: (self iconNamed: #window);
				 help: 'Move this chart to a window of its own, or back to the tabs';
				 action: [ self moveElsewhere ];
				 yourself)
		expand: false
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
				CMPNGExporter new
					canvas: chartView canvas;
					exportToFile: file ]
]

{ #category : 'updating' }
CMChartPresenter >> showStep: aStep [
	"Draw my chart at aStep, chosen with the step slider"

	aStep = shownStep ifFalse: [ self drawChartUpToStep: aStep ]
]

{ #category : 'accessing' }
CMChartPresenter >> simulation [

	^ self application simulation
]

{ #category : 'accessing' }
CMChartPresenter >> stepSlider [

	^ stepSlider
]

{ #category : 'accessing' }
CMChartPresenter >> subject [

	^ subject
]

{ #category : 'accessing' }
CMChartPresenter >> subject: aModelOrAnEntity chart: aSelector [
	"Show the chart that the method aSelector of aModelOrAnEntity returns, drawn from the data recorded on it, with a step slider when one of its series shows the shown step only"

	subject := aModelOrAnEntity.
	chartSelector := aSelector.
	chart := subject perform: aSelector.
	chart hasSeriesAtShownStep ifTrue: [
		self layout add: stepSlider expand: false ].
	self drawChart
]

{ #category : 'accessing' }
CMChartPresenter >> title [
	"Return the title of my chart, or else the selector of its method"

	^ chart title ifNil: [ chartSelector asString ]
]

{ #category : 'updating' }
CMChartPresenter >> updateDiagram [
	"Draw my chart again after a displayed step, in the UI process and while the simulation waits, so that the data does not change meanwhile. Series shown at the shown step go back to the latest step"

	host updateInInterface: [ self drawChartUpToStep: Float infinity ]
]

{ #category : 'updating' }
CMChartPresenter >> updateStepSliderFor: someSeries [
	"Let the step slider choose among the steps of someSeries, at the last of them up to my step"

	| steps |
	steps := (someSeries flatCollect: [ :each | each steps ]) asSet
		         sorted.
	steps ifEmpty: [ ^ self ].
	shownStep := (steps select: [ :each | each <= upToStep ])
		             ifEmpty: [ steps first ]
		             ifNotEmpty: [ :earlierSteps | earlierSteps last ].
	stepSlider
		max: steps last;
		min: steps first;
		value: shownStep;
		label: 'Step ' , shownStep printString
]
