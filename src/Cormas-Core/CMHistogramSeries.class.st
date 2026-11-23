"
I am a histogram: I count the values of one probe in bins. My probe is on x, and the counts on y.

## Responsibility:

- I know my probe, which returns numbers, and I am labelled after it, unless a label is chosen.
- I count the values of every recorded step, or of the shown step only after `atShownStep`.
- Cormas-UI-Roassal3 draws me with the other histograms of my chart, in the same bins.

## Collaborators:

- `CMChartSeries` gives me the objects I show, my label and my color.
- `RSHistogramPlot` draws my bars.

## Public API and Key Messages

- `x:` counts the values of the subject of the chart, `x:ofAll:` those of all the instances of a class.

```smalltalk
CMChart new
	title: 'Energy distribution';
	add: (CMHistogramSeries new
		x: #energy ofAll: RMRabbit;
		atShownStep;
		yourself);
	yourself
```
"
Class {
	#name : 'CMHistogramSeries',
	#superclass : 'CMChartSeries',
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'configuring' }
CMHistogramSeries >> x: aSelector [
	"Count the values of the probe aSelector of the subject of the chart, in bins: the model in a model chart, or the entity whose chart it is"

	x := aSelector.
	label := aSelector asString
]

{ #category : 'configuring' }
CMHistogramSeries >> x: aSelector ofAll: aClass [
	"Count the values of the probe aSelector of all the instances of aClass and of its subclasses, in bins"

	self x: aSelector.
	self showAllInstancesOf: aClass
]
