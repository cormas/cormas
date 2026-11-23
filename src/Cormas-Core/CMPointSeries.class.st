"
I am the series of a `CMScatterplot`: the points of one probe on y against another probe on x.

## Responsibility:

- I know my two probes, and whether I show the subject of the chart over time or all the instances of a class at one step.
- I am labelled after my probe on y, unless a label is chosen.
- I turn recorded data into points, x at y.

## Collaborators:

- `CMScatterplot`: the chart I am added to.
- `CMDataTable`: the recorded columns of my two probes.

## Public API and Key Messages

- `probeX:y:` shows the subject of the chart, one point per recorded step.
- `probeX:y:ofAll:` shows each instance of a class, one point per instance at the shown step.
- `label:` and `color:` change how I am shown.

```
CMPointSeries new
	probeX: #age y: #energy ofAll: RMRabbit;
	color: Color gray;
	yourself
```

`probe:` and `probe:ofAll:` are refused: a point needs a probe for each axis.

## Internal Representation

- `xProbe`: the selector of my probe on x. The inherited `probe` is my probe on y.
"
Class {
	#name : 'CMPointSeries',
	#superclass : 'CMChartSeries',
	#instVars : [
		'xProbe'
	],
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'printing' }
CMPointSeries >> printOn: aStream [

	aStream << '#' << probe << ' against #' << xProbe.
	showsAllInstances ifTrue: [ aStream << ' of all ' << classOfAll name ]
]

{ #category : 'configuring' }
CMPointSeries >> probe: aSelector [

	^ self refuseASingleProbe
]

{ #category : 'configuring' }
CMPointSeries >> probe: aSelector ofAll: aClass [

	^ self refuseASingleProbe
]

{ #category : 'configuring' }
CMPointSeries >> probeX: xSelector y: ySelector [
	"Show the probe ySelector against the probe xSelector of the subject of the chart, a point per recorded step"

	self setProbe: ySelector.
	xProbe := xSelector
]

{ #category : 'configuring' }
CMPointSeries >> probeX: xSelector y: ySelector ofAll: aClass [
	"Show the probe ySelector against the probe xSelector of each instance of aClass and of its subclasses, a point per instance"

	super probe: ySelector ofAll: aClass.
	xProbe := xSelector
]

{ #category : 'accessing' }
CMPointSeries >> probes [

	^ {
		  xProbe.
		  probe }
]

{ #category : 'private' }
CMPointSeries >> refuseASingleProbe [

	^ self error:
		  ('{1} needs a probe for each axis: send it probeX:y: or probeX:y:ofAll:'
			   format: { self class name })
]

{ #category : 'comparing' }
CMPointSeries >> showsTheSameAs: aChartSeries [

	^ (super showsTheSameAs: aChartSeries) and: [
		  xProbe = aChartSeries xProbe ]
]

{ #category : 'accessing' }
CMPointSeries >> xProbe [

	^ xProbe
]
