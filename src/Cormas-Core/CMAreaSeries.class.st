"
I am an area of a `CMAreaChart`, stacked on the areas before me.

## Responsibility:

- For the subject of the chart, I make one series of my probe, which must return numbers.
- For all the instances of a class, I make one series for each instance when my probe returns numbers, or else one for each of its values, counting the instances that have it.

## Collaborators:

- `CMChartSeries` gives me my probe, label and color.

## Public API and Key Messages

- `probe:`, `probe:ofAll:`, `label:`, `color:`
- `category:label:`, `category:color:` and `category:label:color:` name and color the area of a value; the chosen values come first, in the order they were chosen, then the others in alphabetical order

```smalltalk
CMAreaSeries new
	probe: #state ofAll: CMMockCell;
	category: #alive label: 'Alive' color: Color green;
	yourself
```
"
Class {
	#name : 'CMAreaSeries',
	#superclass : 'CMChartSeries',
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
CMAreaSeries >> category: aValue color: aColor [
	"Color the area of the instances whose probe returns aValue"
	self choose: aValue.
	categoryColors at: aValue put: aColor
]

{ #category : 'configuring' }
CMAreaSeries >> category: aValue label: aString [
	"Name the area of the instances whose probe returns aValue"
	self choose: aValue.
	categoryLabels at: aValue put: aString
]

{ #category : 'configuring' }
CMAreaSeries >> category: aValue label: aString color: aColor [
	self
		category: aValue label: aString;
		category: aValue color: aColor
]

{ #category : 'private' }
CMAreaSeries >> choose: aValue [
	(chosenCategories includes: aValue) ifFalse: [ chosenCategories add: aValue ]
]

{ #category : 'accessing' }
CMAreaSeries >> chosenCategories [
	"The values whose label or color were chosen, in the order they were first chosen"
	^ chosenCategories
]

{ #category : 'initialization' }
CMAreaSeries >> initialize [
	super initialize.
	categoryLabels := Dictionary new.
	categoryColors := Dictionary new.
	chosenCategories := OrderedCollection new
]

{ #category : 'accessing' }
CMAreaSeries >> labelOfCategory: aValue [
	"The label chosen for aValue, or else aValue itself"
	^ categoryLabels at: aValue ifAbsent: [ aValue asString ]
]
