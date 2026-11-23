"
I show one chart of a model at a time, chosen in a drop-down list of all its charts. The Charts tab of a simulation is one of me, and each copy of it in a window is another one, so that each shows its own chart.

## Responsibility:

- Offer every chart of the model, and show the chosen one drawn from the latest data.
- Remember the hidden lines and the step of each chart shown before.
- Ask my host to open a copy of me in a window of its own.

## Collaborators:

- `CMChartPresenter`: shows the chosen chart; I am its host.
- `CMSimulationRunnerPresenter`: shows me in its Charts tab, opens and closes my copies, and tells me when to draw.

## Public API and Key Messages

- `host:subject:chart:` to set my host, the model whose charts I offer, and the chart I show first
- `show:` to choose the chart of a method
- `copyFor:` and `openInWindow` to show a copy of me in a window
- `updateDiagram` after a displayed step

```
(runner instantiate: CMChartsPresenter)
	host: runner subject: aModel chart: #chartPopulation;
	yourself
```

## Internal Representation

- charts: the presenters of the charts shown before, by selector, so that they keep their hidden lines and their step
"
Class {
	#name : 'CMChartsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'host',
		'subject',
		'dropList',
		'duplicateButton',
		'saveButton',
		'chartBox',
		'charts',
		'shownChart',
		'window'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'copying and windows' }
CMChartsPresenter >> adopt: aChart [
	"Show aChart when its chart is chosen"
	charts at: aChart chartSelector put: aChart
]

{ #category : 'initialization' }
CMChartsPresenter >> connectPresenters [
	dropList whenSelectedItemChangedDo: [ :each |
		each ifNotNil: [ self showChartOf: each ] ]
]

{ #category : 'copying and windows' }
CMChartsPresenter >> copyFor: aHost [
	"Return a copy of me for aHost, showing my chart with the same hidden lines and step"
	| copy |
	copy := aHost instantiate: CMChartsPresenter.
	copy adopt: (shownChart copyFor: copy).
	^ copy
		  host: aHost subject: subject chart: shownChart chartSelector;
		  yourself
]

{ #category : 'layout' }
CMChartsPresenter >> defaultLayout [
	^ SpBoxLayout newTopToBottom
		  spacing: 5;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 5;
				   add: dropList width: 250;
				   add: duplicateButton width: 30;
				   add: saveButton expand: false;
				   yourself)
		  expand: false;
		  add: chartBox;
		  yourself
]

{ #category : 'accessing' }
CMChartsPresenter >> displayedTitle [
	^ 'Chart: ' , shownChart title
]

{ #category : 'accessing' }
CMChartsPresenter >> host: aHost subject: aModelOrAnEntity chart: aSelector [
	"Offer the charts of aModelOrAnEntity, shown by aHost, and show the chart of the method aSelector"
	host := aHost.
	subject := aModelOrAnEntity.
	dropList items: subject class chartSelectors.
	self show: aSelector
]

{ #category : 'initialization' }
CMChartsPresenter >> initializePresenters [
	charts := Dictionary new.
	dropList := self newDropList
		            help: 'The chart to show';
		            display: [ :each | self titleOf: each ];
		            yourself.
	duplicateButton := self newButton
		                   icon: (self iconNamed: #window);
		                   help: 'Open a copy of these charts in a window of its own, to show another chart at the same time';
		                   action: [ host duplicateCharts: self ];
		                   yourself.
	saveButton := self newButton
		              label: 'Save a picture';
		              icon: (self iconNamed: #smallSave);
		              help: 'Save a picture of the chart in the output folder of the model';
		              action: [ shownChart saveToPng ];
		              yourself.
	chartBox := SpBoxLayout newTopToBottom
]

{ #category : 'accessing' }
CMChartsPresenter >> isInWindow [
	^ window isNotNil
]

{ #category : 'copying and windows' }
CMChartsPresenter >> newChartView: aSelector of: aModelOrAnEntity [
	"Return a chart of the method aSelector of aModelOrAnEntity, that I show"
	^ (self instantiate: CMChartPresenter)
		  host: self;
		  subject: aModelOrAnEntity chart: aSelector;
		  yourself
]

{ #category : 'accessing' }
CMChartsPresenter >> offeredTitles [
	"Return the titles of the charts that I can show"
	^ dropList items collect: [ :each | self titleOf: each ]
]

{ #category : 'copying and windows' }
CMChartsPresenter >> openInWindow [
	"Show me in a window of my own. Closing the window closes me in my host"
	window := self asWindow.
	window
		title: self displayedTitle;
		initialExtent: 900 @ 650;
		whenClosedDo: [ host closeCharts: self ].
	window open
]

{ #category : 'accessing' }
CMChartsPresenter >> show: aSelector [
	"Choose the chart of the method aSelector, and show it"
	dropList selectItem: aSelector
]

{ #category : 'private' }
CMChartsPresenter >> showChartOf: aSelector [
	"Show the chart of the method aSelector, drawn from the latest data. A chart shown before keeps its hidden lines and its step"
	shownChart := charts
		              at: aSelector
		              ifPresent: [ :chart |
			              chart drawChart.
			              chart ]
		              ifAbsentPut: [ self newChartView: aSelector of: subject ].
	chartBox
		removeAll;
		add: shownChart.
	self isInWindow ifTrue: [ window title: self displayedTitle ]
]

{ #category : 'accessing' }
CMChartsPresenter >> shownChart [
	^ shownChart
]

{ #category : 'private' }
CMChartsPresenter >> titleOf: aSelector [
	"The title of the chart of the method aSelector, or else the selector"
	^ (subject perform: aSelector) title ifNil: [ aSelector asString ]
]

{ #category : 'updating' }
CMChartsPresenter >> updateDiagram [
	"Draw my chart again from the latest data"
	shownChart updateDiagram
]

{ #category : 'updating' }
CMChartsPresenter >> updateInInterface: aBlock [
	^ host updateInInterface: aBlock
]

{ #category : 'accessing' }
CMChartsPresenter >> window [
	^ window
]
