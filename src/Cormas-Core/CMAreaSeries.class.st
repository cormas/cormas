"
I am an area of a `CMAreaChart`, stacked on the areas before me.

## Responsibility:

- For the subject of the chart, I make one series of my probe, which must return numbers.
- For all the instances of a class, I make one series for each instance when my probe returns numbers, or else one for each of its values, counting the instances that have it.

## Collaborators:

- `CMChartSeries` gives me my probe, label and color.

## Public API and Key Messages

- `probe:`, `probe:ofAll:`, `label:`, `color:`

```smalltalk
(CMAreaSeries probe: #state ofAll: CMMockCell)
	label: 'Cells';
	yourself
```
"
Class {
	#name : 'CMAreaSeries',
	#superclass : 'CMChartSeries',
	#instVars : [
		'categories'
	],
	#category : 'Cormas-Core-Charts',
	#package : 'Cormas-Core',
	#tag : 'Charts'
}

{ #category : 'configuring' }
CMAreaSeries >> category: aValue color: aColor [
	"Color the area of the instances whose probe returns aValue"
	(self categoryAt: aValue) at: 2 put: aColor
]

{ #category : 'configuring' }
CMAreaSeries >> category: aValue label: aString [
	"Name the area of the instances whose probe returns aValue"
	(self categoryAt: aValue) at: 1 put: aString
]

{ #category : 'configuring' }
CMAreaSeries >> category: aValue label: aString color: aColor [
	self
		category: aValue label: aString;
		category: aValue color: aColor
]

{ #category : 'private' }
CMAreaSeries >> categoryAt: aValue [
	"The label and the color chosen for aValue, nil until chosen"
	^ categories at: aValue ifAbsentPut: [ Array new: 2 ]
]

{ #category : 'accessing' }
CMAreaSeries >> chosenCategories [
	"The values whose label or color were chosen, in the order they were first chosen"
	^ categories keys
]

{ #category : 'accessing' }
CMAreaSeries >> colorOfCategory: aValue [
	"The color chosen for aValue, or nil"
	^ (categories at: aValue ifAbsent: [ ^ nil ]) second
]

{ #category : 'initialization' }
CMAreaSeries >> initialize [
	super initialize.
	categories := OrderedDictionary new
]

{ #category : 'accessing' }
CMAreaSeries >> labelOfCategory: aValue [
	^ (categories at: aValue ifAbsent: [ ^ aValue asString ]) first ifNil: [ aValue asString ]
]
