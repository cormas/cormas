"
I am a chart that a modeler defines in a `<chart>` method, to show probes recorded during a simulation. I am the abstract superclass of the kinds of charts: `CMLineChart`, `CMAreaChart`, `CMBoxplot`, `CMHistogram` and `CMScatterplot`.

## Responsibility:

- I know my series, the `CMSeriesData` that each show a probe of my subject (the model, or the entity whose chart I am) or of all the instances of a class, in the order they were added.
- I accept only the kind of series I draw, and refuse a series that shows what another of my series shows.
- I know the titles of the chart and of its axes, and whether it has a legend.

## Collaborators:

- `CMChartSeries` and its subclasses know the probe they show and how it is labelled and colored. My subclasses build series with the default label and color with the messages of their kind, such as `line:` or `boxes:ofAll:`.
- Cormas-UI-Roassal3 asks my series for `CMSeriesData` from the `CMDataTable`s a `CMSimulation` recorded (`seriesDataOf:in:`), and draws them with axis lines, ticks and a legend whose entries hide and show their series (`canvasOf:hiding:`). Each subclass says how it plots its series.

## Public API and Key Messages

- `add:` adds a series.
- `title:`, `xTitle:`, `yTitle:`, `hideLegend`
- `isSingleStep` says whether I show one step, rather than the change over time.

```smalltalk
CMLineChart new
	title: 'Boars';
	line: #boars;
	add: (CMLineSeries new probe: #urbanBoars;
		label: 'Boars in towns';
		color: Color gray;
		yourself);
	yourself
```

## Internal Representation

- `title`, `xTitle`, `yTitle`: strings, or nil when the chart has none.
- `series`: an `OrderedCollection` of `CMSeriesData`.
- `showsLegend`: a boolean, true unless `hideLegend` was sent.

### Implementation Points

A chart names probes by their selectors and never refers to the model's state, so that the same chart can show a live simulation or saved data.
"
Class {
	#name : 'CMChart',
	#superclass : 'Object',
	#instVars : [
		'title',
		'xTitle',
		'yTitle',
		'series',
		'showsLegend'
	],
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'accessing' }
CMChart >> add: aChartSeries [
	"Show aChartSeries, after the series added before. It must be of the kind of series I draw, and not show what another of my series shows"

	(aChartSeries isKindOf: self seriesClass) ifFalse: [
			self error: ('{1} draws {2}, not {3}' format: {
						 self class name.
						 self seriesClass name.
						 aChartSeries class name }) ].
	(series anySatisfy: [ :each | each showsTheSameAs: aChartSeries ])
		ifTrue: [
		self error: 'The chart already shows ' , aChartSeries printString ].
	series add: aChartSeries
]

{ #category : 'presentation' }
CMChart >> hideLegend [
	"Draw me without a legend, for example when the legend would only repeat the title"

	showsLegend := false
]

{ #category : 'initialization' }
CMChart >> initialize [

	super initialize.
	series := OrderedCollection new.
	showsLegend := true
]

{ #category : 'accessing' }
CMChart >> isSingleStep [
	"Return whether I show the values of a single step, rather than their change over time"

	^ false
]

{ #category : 'accessing' }
CMChart >> seriesClass [
	"Return the class of the series I draw"

	^ self subclassResponsibility
]

{ #category : 'accessing' }
CMChart >> title [

	^ title
]

{ #category : 'accessing' }
CMChart >> title: aString [

	title := aString
]

{ #category : 'accessing' }
CMChart >> xTitle [

	^ xTitle
]

{ #category : 'accessing' }
CMChart >> xTitle: aString [

	xTitle := aString
]

{ #category : 'accessing' }
CMChart >> yTitle [

	^ yTitle
]

{ #category : 'accessing' }
CMChart >> yTitle: aString [

	yTitle := aString
]
