"
I am a series whose marks are stacked on those of the series of my kind before me in the chart: positive values upward from zero, negative values downward below zero. I am the abstract superclass of `CMAreaSeries` and `CMBarSeries`.

## Responsibility:

- For the subject of the chart, I make one stack of my probe on y, which must return numbers.
- For all the instances of a class, I make one stack for each instance when my probe on y returns numbers, or else one for each of its values, counting the instances that have it.
- At each value on x, I stack the sum of my values there on the positive sums of the series before me, or below their negative sums when it is negative.

## Collaborators:

- `CMXYSeries` gives me my probes, label and color.
- My subclasses give the Roassal plot that draws a stack from its bottoms to its tops (`plotX:from:to:`).

## Public API and Key Messages

- `x:y:`, `x:y:ofAll:`, `label:`, `color:`, `atShownStep`
- `category:label:`, `category:color:` and `category:label:color:` name and color the stack of a value; the chosen values come first, in the order they were chosen, then the others in alphabetical order.

```smalltalk
CMBarSeries new
	x: #currentTimeStep y: #state ofAll: CMMockCell;
	category: #alive label: 'Alive' color: Color green;
	yourself
```

## Internal Representation

- `categoryLabels`, `categoryColors`: the label and the color chosen for values of my probe on y.
- `chosenCategories`: the values whose label or color were chosen, in the order they were first chosen.

### Implementation Points

- An outflow is a probe returning negative numbers, rather than a setting drawing positive values downward, so that the recorded data, its CSV and its sums say what the chart shows.
"
Class {
	#name : 'CMStackedSeries',
	#superclass : 'CMXYSeries',
	#instVars : [
		'categoryLabels',
		'categoryColors',
		'chosenCategories'
	],
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'configuring' }
CMStackedSeries >> category: aValue color: aColor [
	"Color the area of the instances whose probe returns aValue"
	self choose: aValue.
	categoryColors at: aValue put: aColor
]

{ #category : 'configuring' }
CMStackedSeries >> category: aValue label: aString [
	"Name the area of the instances whose probe returns aValue"
	self choose: aValue.
	categoryLabels at: aValue put: aString
]

{ #category : 'configuring' }
CMStackedSeries >> category: aValue label: aString color: aColor [
	self
		category: aValue label: aString;
		category: aValue color: aColor
]

{ #category : 'private' }
CMStackedSeries >> choose: aValue [
	(chosenCategories includes: aValue) ifFalse: [ chosenCategories add: aValue ]
]

{ #category : 'accessing' }
CMStackedSeries >> chosenCategories [
	"The values whose label or color were chosen, in the order they were first chosen"
	^ chosenCategories
]

{ #category : 'initialization' }
CMStackedSeries >> initialize [
	super initialize.
	categoryLabels := Dictionary new.
	categoryColors := Dictionary new.
	chosenCategories := OrderedCollection new
]

{ #category : 'accessing' }
CMStackedSeries >> labelOfCategory: aValue [
	"The label chosen for aValue, or else aValue itself"
	^ categoryLabels at: aValue ifAbsent: [ aValue asString ]
]
