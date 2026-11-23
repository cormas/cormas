"
I am a chart that shows how a probe is spread over all instances of a class: at each step, a box from the first to the third quartile, a white line at the median, and a line from the minimum to the maximum.

## Responsibility:

- I show the spread of a probe of all instances of a class and of its subclasses, which must return numbers.
- At each step, a box gathers the values of the instances recorded at that step.
- When I show several probes, their boxes stand side by side at each step.

## Collaborators:

- `CMChart` keeps my `CMBoxSeries` and my titles, and draws me.
- `CMBoxesPlot` (in Cormas-UI-Roassal3) draws the boxes of one probe.

## Public API and Key Messages

- `add:` adds a `CMBoxSeries`, with its own label or color; the messages below add one with the default label and color.
- `boxes:ofAll:` adds the boxes of a probe of the instances of a class.

```smalltalk
| simulation chart |
simulation := (CMSimulation for: CMMockModel new)
	activeInitSelector: #initFixed;
	activeControlSelector: #step;
	initializeSimulation;
	yourself.
10 timesRepeat: [ simulation runStep ].
chart := CMBoxplot new
	title: 'Energy';
	boxes: #energy ofAll: CMMockAnimal;
	yourself.
(chart
	canvasOf: (chart seriesOf: simulation cormasModel in: simulation)
	hiding: Set new) open
```
"
Class {
	#name : 'CMBoxplot',
	#superclass : 'CMChart',
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'accessing' }
CMBoxplot >> boxes: aSelector ofAll: aClass [
	"Show the spread of the probe aSelector over the instances of aClass, and of its subclasses, as a box at each step. Add a CMBoxSeries to choose their label or color"

	self add: (CMBoxSeries new probe: aSelector ofAll: aClass)
]

{ #category : 'accessing' }
CMBoxplot >> seriesClass [

	^ CMBoxSeries
]
