"
I am a chart that shows probes as lines over time: one line for a probe of my subject (the model, or the entity whose chart I am), or one line for each instance of a class.

## Responsibility:

- I know which probes I show, and of which objects, in the order they were added.
- I refuse to show the same probe of the same objects twice.
- Cormas-UI-Roassal3 draws me: each line follows the values of its probe over the steps recorded on its object.

## Collaborators:

- `CMChart` gives me titles, labels and colors.
- `CMDataTable` holds the values I draw; `CMSimulation>>dataOfAll:` gives the data of all instances of a class.
- `CMChartLine` (in Cormas-UI-Roassal3) is one line ready to draw.

## Public API and Key Messages

- `line:` adds a line for a probe of my subject.
- `lines:ofAll:` adds a line for a probe of each instance of a class and of its subclasses, named after the probe and the instance.
- In Cormas-UI-Roassal3, `chartLinesOf:in:` returns the lines to draw from the data a simulation recorded, and raises an error for a line of a method that is not a probe. `canvasOf:hiding:` draws them with x and y axis lines, ticks without needless decimals, and a legend whose entries hide and show their lines when clicked.

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
	canvasOf: (chart chartLinesOf: simulation cormasModel in: simulation)
	hiding: Set new) open
```

## Internal Representation

- `lines`: an `OrderedCollection` of probe selectors of my subject.
- `linesOfAll`: an `OrderedCollection` of associations from probe selectors to classes.
"
Class {
	#name : 'CMLineChart',
	#superclass : 'CMChart',
	#instVars : [
		'lines',
		'linesOfAll'
	],
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'initialization' }
CMLineChart >> initialize [

	super initialize.
	lines := OrderedCollection new.
	linesOfAll := OrderedCollection new
]

{ #category : 'accessing' }
CMLineChart >> line: aSelector [
	"Show the probe aSelector as a line over time"

	(lines includes: aSelector) ifTrue: [
		self error: ('The chart already shows #{1}' format: { aSelector }) ].
	lines add: aSelector
]

{ #category : 'accessing' }
CMLineChart >> lines [

	^ lines
]

{ #category : 'accessing' }
CMLineChart >> lines: aSelector ofAll: aClass [
	"Show the probe aSelector of each instance of aClass, and of its subclasses, as a line over time"

	(linesOfAll includes: aSelector -> aClass) ifTrue: [
			self error: ('The chart already shows #{1} of all {2}' format: {
						 aSelector.
						 aClass name }) ].
	linesOfAll add: aSelector -> aClass
]

{ #category : 'accessing' }
CMLineChart >> linesOfAll [

	^ linesOfAll
]

{ #category : 'accessing' }
CMLineChart >> shownSelectors [

	^ lines , (linesOfAll collect: [ :each | each key ])
]
