"
I am a chart that shows probes as areas stacked over time, so that their total can be read at the top: the parts of a whole, such as the plots of each land use.

## Responsibility:

- I show a probe of my subject (the model, or the entity whose chart I am) as an area, stacked on the areas shown before it.
- I show a probe of all instances of a class as one area for each instance when it returns numbers, or as one area for each of its values, counting the instances that have it, when it returns strings or booleans.
- A step when an object was not alive adds nothing to the stack.

## Collaborators:

- `CMChart` gives me the probes I show, titles, labels and colors, and draws me.
- Cormas-UI-Roassal3 draws each area with a `RSAreaPlot`.

## Public API and Key Messages

- `area:` adds an area for a probe of my subject, which must return numbers.
- `areas:ofAll:` adds the areas of a probe of the instances of a class and of its subclasses.

```smalltalk
| simulation chart |
simulation := (CMSimulation for: CMMockModel new)
	activeInitSelector: #initFixed;
	activeControlSelector: #step;
	initializeSimulation;
	yourself.
10 timesRepeat: [ simulation runStep ].
chart := CMAreaChart new
	title: 'Cells';
	areas: #state ofAll: CMMockCell;
	yourself.
(chart
	canvasOf: (chart seriesOf: simulation cormasModel in: simulation)
	hiding: Set new) open
```
"
Class {
	#name : 'CMAreaChart',
	#superclass : 'CMChart',
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'accessing' }
CMAreaChart >> area: aSelector [
	"Show the probe aSelector, which returns numbers, as an area stacked on the areas shown before"

	self showProbe: aSelector
]

{ #category : 'accessing' }
CMAreaChart >> areas: aSelector ofAll: aClass [
	"Show the probe aSelector of the instances of aClass, and of its subclasses, as stacked areas: one for each instance when it returns numbers, or one for each value, counting the instances that have it, when it returns strings or booleans"

	self showProbe: aSelector ofAll: aClass
]
