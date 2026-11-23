"
I represent a reference line of a `CMChart`: a dashed line across the chart at a fixed value, such as a threshold or the step of an event, with a label and a color.

## Responsibility:

- Know the value on x or on y where I am drawn.
- Know my label, shown on the chart at the end of the line rather than in the legend.
- Know my color, grey unless the modeler chooses another.

## Collaborators:

- `CMChart`: keeps its reference lines on x and on y, and draws them over its series.

## Public API and Key Messages

- `at:label:color:` creates a reference line.
- `value`, `label` and `color` return what I know.

A chart creates me when it receives `lineAtX:label:color:` or `lineAtY:label:color:`:

```
CMChart new
	histogramX: #energy ofAll: WSHSheep;
	lineAtX: 5 label: 'Hungry' color: CMColor red;
	yourself
```
"
Class {
	#name : 'CMReferenceLine',
	#superclass : 'Object',
	#instVars : [
		'value',
		'label',
		'color'
	],
	#category : 'Cormas-Core',
	#package : 'Cormas-Core'
}

{ #category : 'instance creation' }
CMReferenceLine class >> at: aNumber label: aString color: aColor [

	^ self new setValue: aNumber label: aString color: aColor
]

{ #category : 'accessing' }
CMReferenceLine >> color [

	^ color
]

{ #category : 'accessing' }
CMReferenceLine >> label [

	^ label
]

{ #category : 'initialization' }
CMReferenceLine >> setValue: aNumber label: aString color: aColor [

	value := aNumber.
	label := aString.
	color := aColor
]

{ #category : 'accessing' }
CMReferenceLine >> value [

	^ value
]
