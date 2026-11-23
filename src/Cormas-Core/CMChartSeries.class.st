"
I am a series of a chart: the marks it draws, such as a line, points or boxes, for a probe on x and, for most kinds, a probe on y, and how they are labelled and colored. I am the abstract superclass of `CMHistogramSeries`, which counts the values of its probe on x, and of `CMXYSeries`, which shows a probe on y against a probe on x.

## Responsibility:

- I know my probe on x, and whether I show the subject of the chart (the model, or the entity whose chart it is) or all the instances of a class and of its subclasses. A probe is the selector of a `<probe>` method, or `#currentTimeStep`, the step of each recorded row.
- I know whether I show every recorded step or only the step the chart shows, my label in the legend, my probe by default, and my color, a color of the chart's palette by default. When I show all the instances of a class, they all get my color.
- Cormas-UI-Roassal3 makes me the `CMSeriesData` I draw from the recorded data, and makes my class draw the series data of my kind together.

## Collaborators:

- `CMChart` adds me with `add:` and asks me whether I draw what another series draws (`showsTheSameAs:`).
- `CMSimulation>>dataOf:` and `dataOfAll:` give the `CMDataTable`s I read my probes from.

## Public API and Key Messages

- `x:y:` or `x:y:ofAll:` (`x:` or `x:ofAll:` for a histogram) choose what I show, before `label:`, which they would replace.
- `atShownStep` shows only the step chosen with the step slider of the chart.
- `label:` and `color:` choose how I am shown.

```smalltalk
CMLineSeries new
	x: #currentTimeStep y: #energy ofAll: RMRabbit;
	color: Color gray;
	yourself
```

## Internal Representation

- `x`: the selector of my probe on x.
- `showsAllInstances`: whether I show all the instances of `classOfAll`, rather than the subject of the chart.
- `classOfAll`: the class whose instances I show.
- `label`: a string.
- `colors`: the colors I am drawn in, by position, or none to take those of the chart's palette; `color:` makes it a single color.
- `isAtShownStep`: whether I show only the step the chart shows.
"
Class {
	#name : 'CMChartSeries',
	#superclass : 'Object',
	#instVars : [
		'x',
		'showsAllInstances',
		'classOfAll',
		'label',
		'colors',
		'isAtShownStep'
	],
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'configuring' }
CMChartSeries >> atShownStep [
	"Show only the values of the step that the chart shows, chosen with its step slider, rather than those of every recorded step"

	isAtShownStep := true
]

{ #category : 'accessing' }
CMChartSeries >> classOfAll [

	^ classOfAll
]

{ #category : 'configuring' }
CMChartSeries >> color: aColor [
	"Draw me in aColor, instead of the colors of the chart's palette. When I show all the instances of a class, they all get aColor"
	colors := { aColor }
]

{ #category : 'accessing' }
CMChartSeries >> colors [
	"The colors chosen for me, or none to take those of the chart's palette"
	^ colors
]

{ #category : 'initialization' }
CMChartSeries >> initialize [

	super initialize.
	showsAllInstances := false.
	colors := #(  ).
	isAtShownStep := false
]

{ #category : 'accessing' }
CMChartSeries >> isAtShownStep [

	^ isAtShownStep
]

{ #category : 'accessing' }
CMChartSeries >> label [

	^ label
]

{ #category : 'configuring' }
CMChartSeries >> label: aString [
	"Name me with aString in the legend, instead of my probe"

	label := aString
]

{ #category : 'printing' }
CMChartSeries >> printOn: aStream [

	self printProbesOn: aStream.
	showsAllInstances ifTrue: [ aStream << ' of all ' << classOfAll name ]
]

{ #category : 'printing' }
CMChartSeries >> printProbesOn: aStream [

	aStream << '#' << x
]

{ #category : 'accessing' }
CMChartSeries >> probes [
	"Return the selectors of the methods whose values I show"

	^ { x }
]

{ #category : 'private' }
CMChartSeries >> showAllInstancesOf: aClass [
	"Show the instances of aClass and of its subclasses, rather than the subject of the chart"

	showsAllInstances := true.
	classOfAll := aClass
]

{ #category : 'testing' }
CMChartSeries >> showsAllInstances [
	"Return whether I show all the instances of a class, rather than the subject of the chart"
	^ showsAllInstances
]

{ #category : 'accessing' }
CMChartSeries >> showsTheSameAs: aChartSeries [
	"Return whether aChartSeries draws the same marks of the same probes of the same objects as me"

	^ self class = aChartSeries class and: [
			  self probes = aChartSeries probes and: [
					  showsAllInstances = aChartSeries showsAllInstances and: [
						  showsAllInstances not or: [
							  classOfAll = aChartSeries classOfAll ] ] ] ]
]

{ #category : 'accessing' }
CMChartSeries >> x [

	^ x
]
