"
I am a series of a chart: what it draws for one probe, such as a line or a set of boxes, and how it is labelled and colored. I am the abstract superclass of `CMLineSeries`, `CMAreaSeries`, `CMBoxSeries` and `CMBarSeries`.

## Responsibility:

- I know the probe I show, and whether I show it on the subject of the chart (the model, or the entity whose chart it is) or on all the instances of a class and of its subclasses.
- I know my label in the legend, my probe by default, and my color, a color of the chart's palette by default. When I show all the instances of a class, they all get my color.
- Cormas-UI-Roassal3 makes me the `CMSeriesData` that draw me from the recorded data.

## Collaborators:

- `CMChart` adds me with `add:` and asks me for my series, in its order.
- `CMSimulation>>dataOf:` and `dataOfAll:` give the `CMDataTable`s I read my probe from.

## Public API and Key Messages

- `probe:` and `probe:ofAll:` (class side) create me.
- `label:` and `color:` choose how I am shown.

```smalltalk
CMLineChart new
	title: 'Rabbits and grass';
	line: #numberOfRabbits;
	add: ((CMLineSeries probe: #amountOfGrass)
		label: 'Patches with grass';
		color: Color green;
		yourself);
	yourself
```

## Internal Representation

- `probe`: the selector of a probe.
- `classOfAll`: the class whose instances I show, or nil when I show the subject of the chart.
- `label`: a string; `color`: a color, or nil for a color of the chart's palette.
"
Class {
	#name : 'CMChartSeries',
	#superclass : 'Object',
	#instVars : [
		'probe',
		'classOfAll',
		'label',
		'color'
	],
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'instance creation' }
CMChartSeries class >> probe: aSelector [
	"Return a series that shows the probe aSelector of the subject of the chart: the model in a model chart, or the entity whose chart it is"

	^ self new setProbe: aSelector ofAll: nil
]

{ #category : 'instance creation' }
CMChartSeries class >> probe: aSelector ofAll: aClass [
	"Return a series that shows the probe aSelector of all the instances of aClass and of its subclasses"

	^ self new setProbe: aSelector ofAll: aClass
]

{ #category : 'accessing' }
CMChartSeries >> classOfAll [

	^ classOfAll
]

{ #category : 'accessing' }
CMChartSeries >> color [

	^ color
]

{ #category : 'presentation' }
CMChartSeries >> color: aColor [
	"Draw me in aColor, instead of a color of the chart's palette. When I show all the instances of a class, they all get aColor"

	color := aColor
]

{ #category : 'accessing' }
CMChartSeries >> label [

	^ label
]

{ #category : 'presentation' }
CMChartSeries >> label: aString [
	"Name me with aString in the legend, instead of my probe"

	label := aString
]

{ #category : 'printing' }
CMChartSeries >> printOn: aStream [

	aStream << '#' << probe.
	classOfAll ifNotNil: [ aStream << ' of all ' << classOfAll name ]
]

{ #category : 'accessing' }
CMChartSeries >> probe [

	^ probe
]

{ #category : 'initialization' }
CMChartSeries >> setProbe: aSelector ofAll: aClass [

	probe := aSelector.
	classOfAll := aClass.
	label := aSelector asString
]

{ #category : 'testing' }
CMChartSeries >> showsTheSameAs: aChartSeries [
	"Return whether aChartSeries shows the same probe of the same objects as me"

	^ probe = aChartSeries probe and: [
		  classOfAll = aChartSeries classOfAll ]
]
