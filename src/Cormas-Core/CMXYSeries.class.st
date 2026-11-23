"
I am a series that shows a probe on y against a probe on x. I am the abstract superclass of the kinds of marks: `CMLineSeries`, `CMPointSeries`, `CMAreaSeries` and `CMBoxSeries`.

## Responsibility:

- I know my probe on y, which returns numbers, besides my probe on x, which may also return strings or booleans, then shown as categories.
- I am labelled after my probe on y, unless a label is chosen.
- Cormas-UI-Roassal3 makes my values points: the value on x at the value on y of each recorded row.

## Collaborators:

- `CMChartSeries` gives me my probe on x, the objects I show, my label and my color.
- `CMDataTable`: the recorded columns of my two probes.

## Public API and Key Messages

- `x:y:` shows the subject of the chart, `x:y:ofAll:` all the instances of a class.
- `y` returns my probe on y.

```smalltalk
CMPointSeries new
	x: #age y: #energy ofAll: RMRabbit;
	atShownStep;
	yourself
```

## Internal Representation

- `y`: the selector of my probe on y.
"
Class {
	#name : 'CMXYSeries',
	#superclass : 'CMChartSeries',
	#instVars : [
		'y'
	],
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'accessing' }
CMXYSeries >> printProbesOn: aStream [

	aStream << '#' << y << ' against #' << x
]

{ #category : 'accessing' }
CMXYSeries >> probes [

	^ {
		  x.
		  y }
]

{ #category : 'configuring' }
CMXYSeries >> x: xSelector y: ySelector [
	"Show the probe ySelector against the probe xSelector of the subject of the chart: the model in a model chart, or the entity whose chart it is"

	x := xSelector.
	y := ySelector.
	label := ySelector asString
]

{ #category : 'configuring' }
CMXYSeries >> x: xSelector y: ySelector ofAll: aClass [
	"Show the probe ySelector against the probe xSelector of all the instances of aClass and of its subclasses"

	self x: xSelector y: ySelector.
	self showAllInstancesOf: aClass
]

{ #category : 'accessing' }
CMXYSeries >> y [

	^ y
]
