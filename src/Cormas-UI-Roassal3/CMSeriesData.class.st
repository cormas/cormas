"
I am the data of a series of a chart, ready to draw: the series that draws me, a name, a color, and my rows, each a step and a value. A value is a point, x at y, or a number for a histogram.

## Responsibility:

- I know my name, shown in the legend, and by which I am hidden.
- I know my color, and the series whose kind draws me.
- I know my steps and my values, of the same size and in step order, and can return the part of them recorded up to a step, or at a step.

## Collaborators:

- `CMChartSeries` creates me from recorded data.
- `CMChart>>canvasOf:hiding:` draws me with the series data of the same kind, and hides me by my name.

## Public API and Key Messages

- `CMSeriesData of:named:color:steps:values:` creates me.
- `series`, `name`, `color`, `steps`, `values` and `xValues` return what I know.
- `upToStep:` and `atStep:` return a copy of me with the rows recorded up to a step, or at a step; `placedIn:` a copy with my values on x at the positions of their categories.

```smalltalk
(CMSeriesData
	of: (CMLineSeries new x: #currentTimeStep y: #boars)
	named: 'boars'
	color: Color brown
	steps: #( 0 1 2 )
	values: { 0 @ 40. 1 @ 38. 2 @ 41 }) upToStep: 1
```
"
Class {
	#name : 'CMSeriesData',
	#superclass : 'Object',
	#instVars : [
		'series',
		'name',
		'color',
		'steps',
		'values'
	],
	#category : 'Cormas-UI-Roassal3',
	#package : 'Cormas-UI-Roassal3'
}

{ #category : 'instance creation' }
CMSeriesData class >> of: aChartSeries named: aString color: aColor steps: someSteps values: someValues [

	^ self new
		  setSeries: aChartSeries
		  name: aString
		  color: aColor
		  steps: someSteps
		  values: someValues;
		  yourself
]

{ #category : 'copying' }
CMSeriesData >> atStep: aStep [
	"Return a copy of me with only the rows recorded at aStep"

	| indexes |
	indexes := (1 to: steps size) select: [ :each |
		           (steps at: each) = aStep ].
	^ self
		  withSteps: (indexes collect: [ :each | steps at: each ])
		  values: (indexes collect: [ :each | values at: each ])
]

{ #category : 'accessing' }
CMSeriesData >> color [

	^ color
]

{ #category : 'accessing' }
CMSeriesData >> name [

	^ name
]

{ #category : 'copying' }
CMSeriesData >> placedIn: someCategories [
	"Return a copy of me with each value on x at the position of its category on the x axis"

	^ self
		  withSteps: steps
		  values: (series place: values in: someCategories)
]

{ #category : 'accessing' }
CMSeriesData >> series [

	^ series
]

{ #category : 'initialization' }
CMSeriesData >> setSeries: aChartSeries name: aString color: aColor steps: someSteps values: someValues [

	series := aChartSeries.
	name := aString.
	color := aColor.
	steps := someSteps.
	values := someValues
]

{ #category : 'accessing' }
CMSeriesData >> steps [

	^ steps
]

{ #category : 'copying' }
CMSeriesData >> upToStep: aStep [
	"Return a copy of me with only the rows recorded at aStep and before, as they were when the simulation reached aStep"

	| count |
	count := steps count: [ :each | each <= aStep ].
	^ self withSteps: (steps first: count) values: (values first: count)
]

{ #category : 'accessing' }
CMSeriesData >> values [

	^ values
]

{ #category : 'private' }
CMSeriesData >> withSteps: someSteps values: someValues [

	^ self class
		  of: series
		  named: name
		  color: color
		  steps: someSteps
		  values: someValues
]

{ #category : 'accessing' }
CMSeriesData >> xValues [
	"Return the value on x of each of my rows"

	^ series xValuesOf: values
]
