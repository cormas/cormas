"
I am a chart that a modeler defines in a `<chart>` method, to show the probes recorded during a simulation. My series can be of different kinds, such as a line over stacked areas, or boxes with a line through them, as long as they all have the same probe on x.

## Responsibility:

- I know my series, each showing a probe of my subject (the model, or the entity whose chart I am) or of all the instances of a class, in the order they were added.
- I refuse a series whose probe on x is not the one of my other series, so that my x axis has one meaning, and a series that draws what another of my series draws.
- I know the titles of the chart and of its axes, whether it has a legend, its reference lines and the range its y axis covers at least.

## Collaborators:

- `CMLineSeries`, `CMPointSeries`, `CMAreaSeries`, `CMBarSeries`, `CMBoxSeries` and `CMHistogramSeries` know what they show and how it is labelled and colored. My shortcuts, such as `lineX:y:` or `boxesX:y:ofAll:`, add one with the default label and color.
- Cormas-UI-Roassal3 asks my series for `CMSeriesData` from the `CMDataTable`s a `CMSimulation` recorded (`seriesDataOf:in:`), and draws them with axis lines, ticks and a legend whose entries hide and show their series (`canvasOf:hiding:`). The series of each kind are drawn together, so that areas and bars stack, negative values below zero, histograms share their bins and boxes stand side by side.

## Public API and Key Messages

- `add:` adds a configured series.
- `lineX:y:`, `linesX:y:ofAll:`, `pointsX:y:`, `pointsX:y:ofAll:`, `areaX:y:`, `areasX:y:ofAll:`, `barsX:y:`, `barsX:y:ofAll:`, `boxesX:y:ofAll:` and `histogramX:ofAll:` add a series with the default label and color.
- `title:`, `xTitle:`, `yTitle:`, `hideLegend`.
- `lineAtY:label:` and `lineAtX:label:` draw a reference line, such as a threshold or the step of an event, labelled on the chart rather than in the legend.
- `yFrom:to:` fixes the y axis, for shares or scores, unless a value goes beyond it.
- `hasSeriesAtShownStep` says whether a series shows only the step chosen with the step slider.

Probes are named by their selectors. The step is `#currentTimeStep`, a message that every model and entity understands:

```smalltalk
CMChart new
	title: 'Rabbits and grass';
	add: (CMAreaSeries new
		x: #currentTimeStep y: #amountOfGrass;
		label: 'Patches with grass';
		color: Color green;
		yourself);
	lineX: #currentTimeStep y: #numberOfRabbits;
	yourself
```

## Internal Representation

- `title`, `xTitle`, `yTitle`: strings, or nil when the chart has none.
- `series`: an `OrderedCollection` of `CMChartSeries`.
- `showsLegend`: a boolean, true unless `hideLegend` was sent.
- `xReferenceLines`, `yReferenceLines`: `OrderedCollection`s of associations from a value to its label.
- `yMinimum`, `yMaximum`: numbers the y axis covers at least, 0 unless `yFrom:to:` was sent.

### Implementation Points

A chart names probes by their selectors and never refers to the model's state, so that the same chart can show a live simulation or saved data. Each kind of series is drawn over the kinds added before it.
"
Class {
	#name : 'CMChart',
	#superclass : 'Object',
	#instVars : [
		'title',
		'xTitle',
		'yTitle',
		'series',
		'showsLegend',
		'xReferenceLines',
		'yReferenceLines',
		'yMinimum',
		'yMaximum'
	],
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'adding' }
CMChart >> add: aChartSeries [
	"Show aChartSeries, after the series added before. All my series have the same probe on x, so that my x axis has one meaning, and none draws what another already draws"

	(series isNotEmpty and: [ series first x ~= aChartSeries x ])
		ifTrue: [
				self error:
					('All the series of a chart have the same probe on x: #{1}, not #{2}'
						 format: {
								 series first x.
								 aChartSeries x }) ].
	(series anySatisfy: [ :each | each showsTheSameAs: aChartSeries ])
		ifTrue: [
		self error: 'The chart already shows ' , aChartSeries printString ].
	series add: aChartSeries
]

{ #category : 'adding' }
CMChart >> areaX: xSelector y: ySelector [
	"Show the probe ySelector against the probe xSelector of the subject of the chart, as an area stacked on the areas before it"

	self add: (CMAreaSeries new x: xSelector y: ySelector)
]

{ #category : 'adding' }
CMChart >> areasX: xSelector y: ySelector ofAll: aClass [
	"Show the probe ySelector against the probe xSelector of all the instances of aClass, and of its subclasses, as stacked areas: one for each instance when it returns numbers, or else one for each of its values, counting the instances that have it"

	self add: (CMAreaSeries new x: xSelector y: ySelector ofAll: aClass)
]

{ #category : 'adding' }
CMChart >> barsX: xSelector y: ySelector [
	"Show the probe ySelector against the probe xSelector of the subject of the chart, as bars stacked on the bars before them, or below them when it is negative"

	self add: (CMBarSeries new x: xSelector y: ySelector)
]

{ #category : 'adding' }
CMChart >> barsX: xSelector y: ySelector ofAll: aClass [
	"Show the probe ySelector against the probe xSelector of all the instances of aClass, and of its subclasses, as stacked bars: one for each instance when it returns numbers, or else one for each of its values, counting the instances that have it"

	self add: (CMBarSeries new x: xSelector y: ySelector ofAll: aClass)
]

{ #category : 'adding' }
CMChart >> boxesX: xSelector y: ySelector ofAll: aClass [
	"Show the spread of the probe ySelector of all the instances of aClass, and of its subclasses, as a box for each value of the probe xSelector"

	self add: (CMBoxSeries new x: xSelector y: ySelector ofAll: aClass)
]

{ #category : 'accessing' }
CMChart >> hasSeriesAtShownStep [
	"Return whether one of my series shows only the step chosen with the step slider"

	^ series anySatisfy: [ :each | each isAtShownStep ]
]

{ #category : 'presentation' }
CMChart >> hideLegend [
	"Draw me without a legend, for example when the legend would only repeat the title"

	showsLegend := false
]

{ #category : 'adding' }
CMChart >> histogramX: aSelector ofAll: aClass [
	"Count the values of the probe aSelector of all the instances of aClass, and of its subclasses, in bins, over every recorded step. Add a CMHistogramSeries sent atShownStep to count those of one step"

	self add: (CMHistogramSeries new x: aSelector ofAll: aClass)
]

{ #category : 'initialization' }
CMChart >> initialize [

	super initialize.
	series := OrderedCollection new.
	showsLegend := true.
	xReferenceLines := OrderedCollection new.
	yReferenceLines := OrderedCollection new.
	yMinimum := 0.
	yMaximum := 0
]

{ #category : 'adding' }
CMChart >> lineAtX: aNumber label: aString [
	"Draw a line across the chart at aNumber on x, such as the step of an event, labelled aString on the chart rather than in the legend"

	xReferenceLines add: aNumber -> aString
]

{ #category : 'adding' }
CMChart >> lineAtY: aNumber label: aString [
	"Draw a line across the chart at aNumber on y, such as a threshold or a need, labelled aString on the chart rather than in the legend"

	yReferenceLines add: aNumber -> aString
]

{ #category : 'adding' }
CMChart >> lineX: xSelector y: ySelector [
	"Show the probe ySelector against the probe xSelector of the subject of the chart, as a line. Add a CMLineSeries to choose its label or color"

	self add: (CMLineSeries new x: xSelector y: ySelector)
]

{ #category : 'adding' }
CMChart >> linesX: xSelector y: ySelector ofAll: aClass [
	"Show the probe ySelector against the probe xSelector of each instance of aClass, and of its subclasses, as a line each"

	self add: (CMLineSeries new x: xSelector y: ySelector ofAll: aClass)
]

{ #category : 'adding' }
CMChart >> pointsX: xSelector y: ySelector [
	"Show the probe ySelector against the probe xSelector of the subject of the chart, a point per recorded step"

	self add: (CMPointSeries new x: xSelector y: ySelector)
]

{ #category : 'adding' }
CMChart >> pointsX: xSelector y: ySelector ofAll: aClass [
	"Show the probe ySelector against the probe xSelector of all the instances of aClass, and of its subclasses, a point per instance and recorded step"

	self add: (CMPointSeries new x: xSelector y: ySelector ofAll: aClass)
]

{ #category : 'accessing' }
CMChart >> series [

	^ series
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

{ #category : 'adding' }
CMChart >> yFrom: aMinimum to: aMaximum [
	"My y axis covers aMinimum to aMaximum, as shares cover 0 to 1, and more if a value goes beyond them"

	yMinimum := aMinimum.
	yMaximum := aMaximum
]

{ #category : 'accessing' }
CMChart >> yTitle [

	^ yTitle
]

{ #category : 'accessing' }
CMChart >> yTitle: aString [

	yTitle := aString
]
