"
I am a chart that shows the distribution of a probe over all instances of a class at a single step: bars counting the instances whose value falls in each bin.

## Responsibility:

- I show a probe of all instances of a class and of its subclasses, which must return numbers.
- I count the values at the last step of the series I am given: the latest recorded step, or, in the chart view, the step chosen with its step slider.
- My bins are evenly spaced over the values; whole numbers close enough to each other each have a bin of their own. When I show several probes, they share the same bins.

## Collaborators:

- `CMChart` keeps my `CMBarSeries` and my titles, and draws me.
- Cormas-UI-Roassal3 draws the bars of each probe with a `RSHistogramPlot`.
- `CMChartPresenter` adds a step slider to the view of a chart whose `isSingleStep` is true.

## Public API and Key Messages

- `add:` adds a `CMBarSeries`, with its own label or color; the messages below add one with the default label and color.
- `bars:ofAll:` adds the bars of a probe of the instances of a class.

```smalltalk
| simulation chart series |
simulation := (CMSimulation for: CMMockModel new)
	activeInitSelector: #initFixed;
	activeControlSelector: #step;
	initializeSimulation;
	yourself.
10 timesRepeat: [ simulation runStep ].
chart := CMHistogram new
	title: 'Energy';
	bars: #energy ofAll: CMMockAnimal;
	yourself.
series := chart seriesOf: simulation cormasModel in: simulation.
(chart
	canvasOf: (series collect: [ :each | each upToStep: 5 ])
	hiding: Set new) open
```
"
Class {
	#name : 'CMHistogram',
	#superclass : 'CMChart',
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'accessing' }
CMHistogram >> bars: aSelector ofAll: aClass [
	"Show the distribution of the probe aSelector over the instances of aClass, and of its subclasses, at one step. Add a CMBarSeries to choose their label or color"

	self add: (CMBarSeries new probe: aSelector ofAll: aClass)
]

{ #category : 'accessing' }
CMHistogram >> isSingleStep [

	^ true
]

{ #category : 'accessing' }
CMHistogram >> seriesClass [

	^ CMBarSeries
]
