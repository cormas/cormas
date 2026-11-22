"
I am a chart that shows probes as lines over time, one line per probe.

## Responsibility:

- I know which probes I show, in the order they were added.
- I refuse to show the same probe twice.
- Cormas-UI-Roassal3 draws me from a `CMDataTable`: each line follows the column of its probe over the steps of the table.

## Collaborators:

- `CMChart` gives me titles, labels and colors.
- `CMDataTable` holds the values I draw.

## Public API and Key Messages

- `line:` adds a line for a probe.
- `lines` returns the probes I show.
- In Cormas-UI-Roassal3, `canvasOn:` draws me from a data table, with a legend.

```smalltalk
| table chart |
table := CMDataTable withColumns: #( #boars #urbanBoars ).
table addStep: 0 values: #( 40 2 ).
table addStep: 1 values: #( 38 3 ).
chart := CMLineChart new
	title: 'Boars';
	line: #boars;
	line: #urbanBoars;
	label: 'Boars in towns' for: #urbanBoars;
	yourself.
(chart canvasOn: table) open
```

## Internal Representation

- `lines`: an `OrderedCollection` of probe selectors.
"
Class {
	#name : 'CMLineChart',
	#superclass : 'CMChart',
	#instVars : [
		'lines'
	],
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'initialization' }
CMLineChart >> initialize [

	super initialize.
	lines := OrderedCollection new
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

{ #category : 'private' }
CMLineChart >> shownSelectors [

	^ lines
]
