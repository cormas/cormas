"
I am a chart that shows probes as lines over time: one line for a probe of my subject (the model, or the entity whose chart I am), or one line for each instance of a class.

## Responsibility:

- I add the probes shown as lines, with the help of `CMChart`.
- Cormas-UI-Roassal3 draws me: each line follows the values of its probe over the steps recorded on its object.

## Collaborators:

- `CMChart` gives me the probes I show, titles, labels and colors, and draws me.
- `CMSimulation>>dataOf:` and `dataOfAll:` give the data I show.

## Public API and Key Messages

- `line:` adds a line for a probe of my subject.
- `lines:ofAll:` adds a line for a probe of each instance of a class and of its subclasses, named after the probe and the instance.

```smalltalk
| simulation chart |
simulation := (CMSimulation for: CMMockModel new)
	activeInitSelector: #initFixed;
	activeControlSelector: #step;
	initializeSimulation;
	yourself.
10 timesRepeat: [ simulation runStep ].
chart := CMLineChart new
	title: 'Energy';
	lines: #energy ofAll: CMMockAnimal;
	yourself.
(chart
	canvasOf: (chart seriesOf: simulation cormasModel in: simulation)
	hiding: Set new) open
```
"
Class {
	#name : 'CMLineChart',
	#superclass : 'CMChart',
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'accessing' }
CMLineChart >> line: aSelector [
	"Show the probe aSelector as a line over time"

	self showProbe: aSelector
]

{ #category : 'accessing' }
CMLineChart >> lines: aSelector ofAll: aClass [
	"Show the probe aSelector of each instance of aClass, and of its subclasses, as a line over time"

	self showProbe: aSelector ofAll: aClass
]
