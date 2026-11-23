"
I am a series of a chart: what it draws for one probe, or two for points, such as a line or a set of boxes, and how it is labelled and colored. I am the abstract superclass of `CMLineSeries`, `CMAreaSeries`, `CMBoxSeries`, `CMBarSeries` and `CMPointSeries`.

## Responsibility:

- I know the probe I show, and whether I show it on the subject of the chart (the model, or the entity whose chart it is) or on all the instances of a class and of its subclasses.
- I know my label in the legend, my probe by default, and my color, a color of the chart's palette by default. When I show all the instances of a class, they all get my color.
- Cormas-UI-Roassal3 makes me the `CMSeriesData` that draw me from the recorded data.

## Collaborators:

- `CMChart` adds me with `add:` and asks me for my series, in its order.
- `CMSimulation>>dataOf:` and `dataOfAll:` give the `CMDataTable`s I read my probe from.

## Public API and Key Messages

- `probe:` or `probe:ofAll:` choose what I show, before `label:`, which they would replace.
- `label:` and `color:` choose how I am shown.

```smalltalk
CMLineChart new
	title: 'Rabbits and grass';
	line: #numberOfRabbits;
	add: (CMLineSeries new probe: #amountOfGrass;
		label: 'Patches with grass';
		color: Color green;
		yourself);
	yourself
```

## Internal Representation

- `probe`: the selector of a probe.
- `showsAllInstances`: whether I show all the instances of `classOfAll`, rather than the subject of the chart.
- `classOfAll`: the class whose instances I show.
- `label`: a string.
- `colors`: the colors I am drawn in, by position, or none to take those of the chart's palette; `color:` makes it a single color.
"
Class {
	#name : 'CMChartSeries',
	#superclass : 'Object',
	#instVars : [
		'probe',
		'showsAllInstances',
		'classOfAll',
		'label',
		'colors'
	],
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

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
	colors := #(  )
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
	aStream << '#' << probe.
	showsAllInstances ifTrue: [ aStream << ' of all ' << classOfAll name ]
]

{ #category : 'accessing' }
CMChartSeries >> probe [

	^ probe
]

{ #category : 'configuring' }
CMChartSeries >> probe: aSelector [
	"Show the probe aSelector of the subject of the chart: the model in a model chart, or the entity whose chart it is"
	self setProbe: aSelector.
	showsAllInstances := false
]

{ #category : 'configuring' }
CMChartSeries >> probe: aSelector ofAll: aClass [
	"Show the probe aSelector of all the instances of aClass and of its subclasses"
	self setProbe: aSelector.
	showsAllInstances := true.
	classOfAll := aClass
]

{ #category : 'accessing' }
CMChartSeries >> probes [
	"Return the selectors of the probes I show"

	^ { probe }
]

{ #category : 'private' }
CMChartSeries >> setProbe: aSelector [
	probe := aSelector.
	label := aSelector asString
]

{ #category : 'testing' }
CMChartSeries >> showsAllInstances [
	"Return whether I show all the instances of a class, rather than the subject of the chart"
	^ showsAllInstances
]

{ #category : 'comparing' }
CMChartSeries >> showsTheSameAs: aChartSeries [
	"Return whether aChartSeries shows the same probe of the same objects as me"
	^ probe = aChartSeries probe and: [
		  showsAllInstances = aChartSeries showsAllInstances and: [
			  showsAllInstances not or: [
				  classOfAll = aChartSeries classOfAll ] ] ]
]
